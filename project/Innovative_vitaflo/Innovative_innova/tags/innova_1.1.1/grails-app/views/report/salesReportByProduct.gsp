<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title><g:message code="report.bar.salesReportByProduct" default="Sales Report By Product"/></title>
  <g:javascript library="prototype"/>
  <g:javascript library="scriptaculous"/>
  <g:javascript library="FusionCharts"/>
  <g:javascript library="FusionChartsDOM"/>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home"/></a></span>
  <span class="menuButton"><g:link class="report" action="index"><g:message code="innova.bar.report" default="Report"/></g:link></span>
</div>
<div class="body">
  <h1><g:message code="report.bar.salesReportByProduct" default="Sales Report By Product"/></h1>
  <div id="searchBox">
    <g:form
            name="searchForm"
            url="[controller:'report',action:'salesReportByProduct']">
      <table>
        <tr>
          <td>
            <div><g:message code="salesReportByProduct.report.startingDate" default="Starting Date"/></div>
            <g:datePicker name="fromDate" value="${fromDate}" precision="month" years="${2008..2020}"/>
          </td>

          <td>
            <div><g:message code="salesReportByProduct.report.endingDate" default="Ending Date"/></div>
            <g:datePicker name="toDate" value="${toDate}" precision="month" years="${2008..2020}"/>
          </td>

          <td>
            <div><g:message code="proforma.patient"/></div>
            <g:textField id="autocompletePatient" name="patient" value="${patient}"/>
            <div id="patient_choices" class="autocomplete"></div>
            <g:javascript>
            new Ajax.Autocompleter("autocompletePatient", "patient_choices", "${createLink(controller: 'patient', action: 'searchAutocomplete')}",{});
            </g:javascript>
          </td>
          <td>
            <div><g:message code="purchase.supplier"/></div>
            <g:select name="supplier" from="${com.vitaflo.innova.Supplier.list()}" value="${supplier}" noSelection="['':'']"/>
          </td>
          <td>
            <div>&nbsp;</div>
            <span class="button"><g:submitButton name="search" class="save" value="${message(code: 'find', 'default': 'Find')}"/></span>
          </td>
        </tr>
      </table>

    </g:form>

  </div>
  <br/><br/>
  <div id="sales_tables">
    <table width="100%">
      <tr>
        <td>
          <table width="10">
            <thead>
            <tr>
              <th><g:message code="salesReportByProduct.report.product" default="Product"/></th>
              <g:each in="${monthList}" status="i" var="date">
                <th><g:formatDate date="${date}" format="MM/yyyy"/></th>
              </g:each>

            </tr>
            </thead>
            <tbody>
            <g:each in="${salesMap}" status="i" var="entry">

              <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                <td>${entry.key}</td>
                <g:each in="${entry.value}" status="j" var="salesInstance">
                  <td class="currencyValue">${formatNumber(number: salesInstance?.amount, format: "0.00")}</td>
                </g:each>

              </tr>
            </g:each>

            </tbody>
          </table>
        </td>
      </tr>
      <tr>

        <td>
          <fusioncharts chartType="MSColumn3D" width="900" height="300" SWFPath="${createLinkTo(dir: 'Charts/')}">
            <data><!--[CDATA[${sXml}
        ]]--></data>
          </fusioncharts>

        </td>
      </tr>
    </table>
  </div>
  <div id="charts">
    <div id="sales_tables">
      <table width="100%">
        <tr>
        <td>
          <table width="10">
            <thead>
            <tr>
              <th><g:message code="salesReportByProduct.report.product" default="Product"/></th>
              <g:each in="${monthList}" status="i" var="date">
                <th><g:formatDate date="${date}" format="M/yyyy"/></th>
              </g:each>

            </tr>
            </thead>
            <tbody>
            <g:each in="${qtyMap}" status="i" var="entry">

              <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                <td>${entry.key}</td>
                <g:each in="${entry.value}" status="j" var="salesInstance">
                  <td class="currencyValue">${formatNumber(number: salesInstance?.amount, format: "0")}</td>
                </g:each>

              </tr>
            </g:each>

            </tbody>
          </table>
        </td>
      </tr>
        
        <tr>
          <td>
            <fusioncharts chartType="MSColumn3D" width="900" SWFPath="${createLinkTo(dir: 'Charts/')}">
              <data><!--[CDATA[${qXml}
            ]]--></data>
            </fusioncharts>

          </td>
        </tr>
      </table>
    </div>

  </div>
</div>
</body>
</html>
