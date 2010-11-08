package com.vitaflo.innova

import org.codehaus.groovy.grails.commons.ConfigurationHolder


class ReportController {

  def exportService

  def index = {
  }

  def consolidatedReport = {

    params.max = Math.min(params.max ? params.max.toInteger() : 15, 100)
    if (!params.offset) params.offset = 0
    if (!params.sort) params.sort = "expireDate"
    if (!params.order) params.order = "desc"

    def query = {

      isNotNull("purchase")
      if (params.codeNumber || params.supplier) {
        purchase {
          if (params.codeNumber) {
            eq('codeNumber', params.codeNumber)
          }
          if (params.supplier) {
            supplier {
              eq('name', params.supplier)
            }
          }

        }

      }

      if (params.number) {
        eq('number', params.number)
      }

      if (params.patient) {
        proforma {
          patient {
            def str = params.patient.split(',')
            eq('lastName', str[0])

            inList('country', session.countries)
          }
        }
      }

    }

    def criteria = Invoice.createCriteria()

    def total = criteria.count(query)

    def invoices = Invoice.withCriteria {

      maxResults(params.max)
      firstResult(params.offset?.toInteger())


      isNotNull("purchase")
      //if(params.codeNumber || params.supplier) {
      purchase {
        order(params.sort, params.order)
        if (params.codeNumber) {
          eq('codeNumber', params.codeNumber)
        }
        if (params.supplier) {
          supplier {
            eq('name', params.supplier)
          }
        }

      }

      //}

      if (params.number) {
        eq('number', params.number)
      }

      if (params.patient) {
        proforma {
          patient {
            def str = params.patient.split(',')
            eq('lastName', str[0])

            inList('country', session.countries)
          }
        }
      }

    }

    if (params?.format && params.format != "html") {
      response.contentType = ConfigurationHolder.config.grails.mime.types[params.format]
      response.setHeader("Content-disposition", "attachment; filename=ConsolidatedReport.${params.format}")
      def exportCriteria = Invoice.createCriteria()
      def exportInvoices = exportCriteria.list(query)

      List fields = ["purchase", "number", "purchase.supplier"]
      def purchaseLabel = g.message(code: "consolidated.report.purchase")
      def invoiceLabel = g.message(code: "consolidated.report.invoice")
      def supplierLabel = g.message(code: "consolidated.report.supplier")
      Map labels = ["purchase": "${purchaseLabel}", "number": "${invoiceLabel}", "purchase.supplier": "${supplierLabel}"]
      exportService.export(params.format, response.outputStream, exportInvoices, fields, labels, [:], [:])
    }
    render(view: 'consolidatedReport', model: [invoiceList: invoices, total: total])

  }


  def showDetails = {
    def purchaseInstance = Purchase.get(params.purchaseId)
    def invoiceInstance = Invoice.get(params.invoiceId)

    return [purchaseInstance: purchaseInstance, invoiceInstance: invoiceInstance]
  }

  def salesReport = {

    def paramssupplier = params.supplier
    def paramspatient = params.patient

    Calendar actualDate = Calendar.instance
    Calendar lastDate = Calendar.instance
    if (params.toDate) {
      actualDate.setTime(params.toDate)
    }
    if (!params.fromDate) {
      lastDate.set(Calendar.DAY_OF_MONTH, 1)
      lastDate.set(Calendar.YEAR, actualDate.get(Calendar.YEAR) - 1)
    } else {
      lastDate.setTime(params.fromDate)
    }

    StringBuilder salesSelect = new StringBuilder("select year(i.date), month(i.date), sum(i.amount) ");
    StringBuilder qtySelect = new StringBuilder("select year(i.date), month(i.date), sum(d.quantity) ");
    StringBuilder salesFrom = new StringBuilder("from Invoice i ");
    StringBuilder qtyFrom = new StringBuilder("from Invoice i inner join i.proforma p inner join p.details d ");
    StringBuilder where = new StringBuilder("where i.date >= :lastDate and i.date <= :actualDate and i.status='Pagada' ")

    Map parameters = [lastDate: lastDate.getTime(), actualDate: actualDate.getTime()]

    if (params.patient) {
      salesFrom.append("inner join i.proforma p inner join p.patient pat ")
      qtyFrom.append("inner join i.proforma p inner join p.patient pat ")
      where.append("and pat.lastName=:patient ")
      def str = params.patient.split(',')
      parameters.put("patient", str[0])
    }

    if (params.supplier) {
      salesFrom.append("inner join i.purchase pur inner join pur.supplier s ")
      qtyFrom.append("inner join i.purchase pur inner join pur.supplier s ")
      where.append("and s.name =:supplier and i.purchase is not null ");
      parameters.put("supplier", params.supplier)
    }

    salesSelect.append(salesFrom.toString()).append(where.toString()).append("group by year(date),month(date) order by year(date), month(date) ")
    //List moneySales = Invoice.executeQuery("select year(date), month(date), sum(amount) from Invoice where date >= :lastDate and date <= :actualDate and status='Pagada' group by year(date),month(date) order by year(date), month(date)", params)

    List moneySales = Invoice.executeQuery(salesSelect.toString(), parameters)
    List salesList = createSalesList(moneySales)

    qtySelect.append(qtyFrom.toString()).append(where.toString()).append("group by year(date),month(date) order by year(date), month(date) ")
    List qtySales = Invoice.executeQuery(qtySelect.toString(), parameters)

    List qtyList = createSalesList(qtySales)

    def sXml = createSalesReportXml(salesList)
    def qXml = createSalesReportXml(qtyList)

    return [salesList: salesList, sXml: sXml, qtyList: qtyList, qXml: qXml, fromDate: lastDate, toDate: actualDate, patient: paramspatient, supplier: paramssupplier]
  }

  def salesReportByProduct = {

    def paramssupplier = params.supplier
    def paramspatient = params.patient

    Calendar actualDate = Calendar.instance
    Calendar lastDate = Calendar.instance
    if (params.toDate) {
      actualDate.setTime(params.toDate)
    }
    if (!params.fromDate) {
      lastDate.set(Calendar.DAY_OF_MONTH, 1)
      lastDate.set(Calendar.YEAR, actualDate.get(Calendar.YEAR) - 1)
    } else {
      lastDate.setTime(params.fromDate)
    }

    List productList = Invoice.executeQuery("select distinct pr from Invoice i inner join i.proforma p inner join p.details d inner join d.product pr where i.date >= :lastDate and i.date <= :actualDate order by pr.name", [lastDate: lastDate.getTime(), actualDate: actualDate.getTime()])

    List monthList = Invoice.executeQuery("select distinct year(i.date), month(i.date) from Invoice i where i.date >= :lastDate and i.date <= :actualDate order by year(i.date), month(i.date) ", [lastDate: lastDate.getTime(), actualDate: actualDate.getTime()])

    StringBuilder salesSelect = new StringBuilder("select year(i.date), month(i.date), sum(d.quantity * d.price) ");
    StringBuilder qtySelect = new StringBuilder("select year(i.date), month(i.date), sum(d.quantity) ");
    StringBuilder salesFrom = new StringBuilder("from Invoice i inner join i.proforma p inner join p.details d right outer join d.product prod ");
    StringBuilder qtyFrom = new StringBuilder("from Invoice i inner join i.proforma p inner join p.details d inner join d.product prod ");
    StringBuilder where = new StringBuilder("where i.date >= :lastDate and i.date <= :actualDate and i.status='Pagada' and d.product= :product ")

    Map parameters = [lastDate: lastDate.getTime(), actualDate: actualDate.getTime()]

    if (params.patient) {
      salesFrom.append("inner join i.proforma p inner join p.patient pat ")
      qtyFrom.append("inner join i.proforma p inner join p.patient pat ")
      where.append("and pat.lastName=:patient ")
      def str = params.patient.split(',')
      parameters.put("patient", str[0])
    }

    if (params.supplier) {
      salesFrom.append("inner join i.purchase pur inner join pur.supplier s ")
      qtyFrom.append("inner join i.purchase pur inner join pur.supplier s ")
      where.append("and s.name =:supplier and i.purchase is not null ");
      parameters.put("supplier", params.supplier)
    }


    salesSelect.append(salesFrom.toString()).append(where.toString()).append(" group by year(i.date),month(i.date), prod.name order by year(i.date), month(i.date), prod.name ")
    qtySelect.append(qtyFrom.toString()).append(where.toString()).append(" group by year(i.date),month(i.date), prod.name order by year(i.date), month(i.date), prod.name ")

    Map productMoneySalesMap = [:]
    Map productQtySalesMap = [:]


    def selectedProductIds = (params.selProductList)? params.selProductList : ""

    productList.each {p ->


      def putProduct = (!params.selProductList) || (selectedProductIds?.split(' ').collect{it.toLong()}.contains(p.id))
      if(putProduct){
          parameters.put("product", p)
          List moneySales = Invoice.executeQuery(salesSelect.toString(), parameters)
          List salesList = createSalesByPorductList(moneySales, monthList)
          if(!params.selProductList) selectedProductIds += p.id + " "

          productMoneySalesMap.put(p.shortName() , salesList)

          List qtySales = Invoice.executeQuery(qtySelect.toString(), parameters)
          List qtyList = createSalesByPorductList(qtySales, monthList)
          productQtySalesMap.put(p.shortName(), qtyList)
      }
    }

    def sXml = createSalesByProductReportXml(productMoneySalesMap, monthList)
    def qXml = createSalesByProductReportXml(productQtySalesMap, monthList)


    def formatMonthList = []

    monthList.each({item ->

      Calendar date = Calendar.instance
      date.set(Calendar.YEAR, item[0].toInteger())
      date.set(Calendar.MONTH, item[1].toInteger() - 1)

      formatMonthList.add(date)
    })

    return [salesMap: productMoneySalesMap, sXml: sXml, qtyMap: productQtySalesMap, qXml: qXml,
            monthList: formatMonthList, fromDate: lastDate, toDate: actualDate,
            patient: params.patient, supplier: params.supplier,
            productList: productList, selProductList: selectedProductIds]

  }

  String createSalesReportXml(List sales) {
    String s = "<graph xAxisName='Month' yAxisName='Sales' rotateNames='1' chartLeftMargin='50' chartRightMargin='50'>"
    sales.each({sale ->
      s += "<set name='${formatDate(date: sale.date, format: 'MMM yyyy')}' value='${sale?.amount}'/>"

    })
    s += "</graph>"
    return s
  }

  String createSalesByProductReportXml(Map sales, List monthList) {
    def colorTable=["AFD8F8","F6BD0F","8BBA00","FF8E46","008E8E","D64646","8E468E","588526","B3AA00","008ED6","800000","FF0033","FF9999","993399","9933CC","CC66CC","CC9999"]
    StringBuilder s = new StringBuilder("<graph xAxisName='Month' yAxisName='Sales' shownames='1' showvalues='0' rotateNames='0' showLegend='1' chartLeftMargin='50' chartRightMargin='50' canvasBgColor='DDDDDD' canvasBgDepth='1' canvasBaseDepth='1' yAxisMaxValue='1'>")
    StringBuilder category = new StringBuilder("<categories>")
    StringBuilder dataset = new StringBuilder();
    monthList.each({item ->
      Calendar date = Calendar.instance
      date.set(Calendar.MONTH, item[1].toInteger() - 1)
      date.set(Calendar.YEAR, item[0])
      category.append("<category name='${formatDate(date: date, format: 'MMM yyyy')}'/>")
    })
    category.append("</categories>")

    int i=0;
    for (String key in sales.keySet()) {
      dataset.append("<dataset seriesName='${key}' color='${colorTable[i++]}'>")
      List salesList = (List) sales.get(key)
      salesList.each({sale ->
        dataset.append("<set value='${sale?.amount}'/>")
      })
      dataset.append("</dataset>")
    }

    s.append(category.toString()).append(dataset.toString()).append("</graph>")
    return s
  }

  List createSalesList(List sales) {
    List salesList = []
    sales.each({item ->
      Calendar date = Calendar.instance
      date.set(Calendar.YEAR, item[0].toInteger())
      date.set(Calendar.MONTH, item[1].toInteger() - 1)

      salesList.add(new SalesCommand(date: date.getTime(), amount: item[2]))
    })

    return salesList

  }

  List createSalesByPorductList(List sales, List monthList) {
    List salesList = []
    Double foundAmount = new Double(0.0)

    for (Calendar idxDate in monthList) {
      boolean found = false
      def foundItem;
      sales.each({item ->
        if (idxDate[1] == item[1] && idxDate[0] == item[0]) {
          found = true
          foundItem = item;
        }
      })

      if (found) {
        foundAmount = foundItem[2]
      }

      Calendar date = Calendar.instance
      date.set(Calendar.YEAR, idxDate[0])
      date.set(Calendar.MONTH, idxDate[1] - 1)

      salesList.add(new SalesCommand(date: date.time, amount: foundAmount))

    }
    return salesList

  }
}

class SalesCommand {

  Date date
  Double amount

  String toString() {
    return "${this.date} - ${this.amount}"
  }
}

