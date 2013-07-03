<div class="list">
  <g:hasErrors bean="${addCommand}">
    <div class="errors">
      <g:renderErrors bean="${addCommand}" as="list" />
    </div>
  </g:hasErrors>
  <table style="margin-top: 5px;">
    <thead>
      <tr>
        <th><g:message code="proformaDetail.product" default="Product" /></th>

        <th><g:message code="proformaDetail.quantity" default="Quantity" /></th>

        <th><g:message code="proformaDetail.dailyDose" default="Daily Dose" /></th>
        
        <th><g:message code="productstock.lot" default="Lot" /></th>

        <th><g:message code="product.price" default="Price" /></th>

        <th><g:message code="proformaDetail.total" default="Total" /></th>

        <th>&nbsp;</th>
    </tr>
   </thead>
   <tbody>
      <tr class="odd">
      <td valign="top" class="value ${hasErrors(field: 'addProductId', 'errors')}">
        <g:select name="addProductId" from="${com.vitaflo.innova.Product.list([sort:'name', order:'asc'])}" optionKey="id"
                  value="${addCommand?.addProductId}"
                  noSelection="['':'Seleccione...']"
                  onchange="${remoteFunction(controller:'invoice', action:'updatePrice',after:'showStock(this.value)',onSuccess:'updateAddPrice(e)', params:'\'addProductId=\'  + this.value')}"
                  />
      </td>

      <td valign="top" class="value ${hasErrors(field: 'addQuantity', 'errors')}">
        <g:textField name="addQuantity" value="${fieldValue(bean: addCommand, field: 'addQuantity')}"/>
      </td>

      <td valign="top" class="value ${hasErrors(field: 'addDailyDose', 'errors')}">
        <g:textField name="addDailyDose" value="${formatNumber(number:addCommand?.addDailyDose, format:'#.##')}"/>
        <g:select name="addDoseUnit" from="${com.vitaflo.innova.ProformaDetail.UNIT_LIST}" value="${fieldValue(bean: addCommand, field: 'addDoseUnit')}" noSelection="['':'']"/>
      </td>
      <td valign="top" class="value">
         <g:select name="addLot" value="${addCommand?.addLot}" list="" noSelection="['':'']"/>
      </td>      
      <td class="value ${hasErrors(field: 'addPrice', 'errors')}" style="vertical-align:middle;">
        <g:textField id="addPrice" name="addPrice" value="${formatNumber(number:addCommand?.addPrice, format:'0.00')}" style="text-align:center;vertical-align:middle"/>
      </td>
      <td>&nbsp;</td>
      <td><g:submitToRemote controller="invoice" update="detailListPanel" action="addDetail" value="${message(code: 'add', 'default': 'Add')}" onSuccess="hideProductStock()" /></td>
      </tr>
    <g:each in="${invoiceDetailList}" status="i" var="invoiceDetail">
      <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
      <td valign="top" class="value">
      <g:hiddenField name="detailsIds[${i}]" value="${formatNumber(number:invoiceDetail?.id, format:'###.##')}"/>
      <g:select name="productIds[${i}]" from="${com.vitaflo.innova.Product.list([sort:'name', order:'asc'])}" optionKey="id"
                value="${invoiceDetail?.productStock?.product?.id}"
                noSelection="['':'Seleccione...']"
                onchange="${remoteFunction(controller:'invoice', action:'updatePrice',after:'showStock()',onSuccess:'updateInvoiceDetailsPrice(e,'+i+')', params:'\'addProductId=\'  + this.value')}"
                />
      </td>

      <td valign="top" class="value">
        <g:textField name="quantities[${i}]" value="${fieldValue(bean: invoiceDetail, field: 'quantity')}"/>
      </td>

      <td valign="top" class="value">
        <g:textField name="dailyDoses[${i}]" value="${formatNumber(number:invoiceDetail?.dailyDose, format:'#.##')}"/>
        <g:select name="doseUnits[${i}]" value="${fieldValue(bean: invoiceDetail, field: 'doseUnit')}" from="${com.vitaflo.innova.ProformaDetail.UNIT_LIST}" noSelection="['':'']"/>
      </td>
      <td valign="top" class="value">
         <g:textField name="lot[${i}]" value="${invoiceDetail?.productStock?.lot}"/>
      </td>
      
      <td class="value" style="vertical-align:middle;">
          <g:textField id="prices[${i}]" name="prices[${i}]" value="${formatNumber(number:invoiceDetail?.price, format:'0.00')}" style="text-align:center;vertical-align:middle"/>
      </td>
      <div id="total[${i}]"><td style="vertical-align:middle"><g:formatNumber number="${invoiceDetail?.total}" /></div></td>
      <td><g:submitToRemote controller="proforma" update="detailListPanel" action="removeDetail" id="${i}" value="${message(code: 'remove', 'default': 'Remove')}"/></td>
      </tr>
    </g:each>
    </tbody>
  </table>
</div>