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

        <th><g:message code="product.price" default="Price" /></th>
        
        <th><g:message code="proformaDetail.lot" default="Batch Number" /></th>
        
        <th><g:message code="purchase.expiredDate" default="Expired Date" /></th>                

        <th><g:message code="proformaDetail.total" default="Total" /></th>

        <th>&nbsp;</th>
    </tr>
   </thead>
   <tbody>
      <tr class="odd">
      <g:hiddenField name="count" value="${purchaseDetailList?.size()}"/>
      <td valign="top" class="value ${hasErrors(field: 'addProductId', 'errors')}">
        <g:select name="addProductId" from="${com.vitaflo.innova.Product.list([sort:'name', order:'asc'])}" optionKey="id"
                  value="${addCommand?.addProductId}"
                  noSelection="['':'Seleccione...']"
                  onchange="${remoteFunction(controller:'purchase', action:'updatePrice',onSuccess:'updateAddPrice(e)', params:'\'addProductId=\'  + this.value')}"
                  />
      </td>

      <td valign="top" class="value ${hasErrors(field: 'addQuantity', 'errors')}">
        <g:textField name="addQuantity" value="${fieldValue(bean: addCommand, field: 'addQuantity')}"/>
      </td>

      <td class="value ${hasErrors(field: 'addPrice', 'errors')}" style="vertical-align:middle;">
        <g:textField id="addPrice" name="addPrice" value="${formatNumber(number:addCommand?.addPrice, format:'0.00')}" style="text-align:center;vertical-align:middle"/>
      </td>
      <td class="value ${hasErrors(field: 'addLot', 'errors')}" style="vertical-align:middle;">
        <g:textField id="addLot" name="addLot" value="${addLot}" style="text-align:center;vertical-align:middle"/>
      </td>
      <td class="value ${hasErrors(field: 'addExpiredDate', 'errors')}" style="vertical-align:middle;">
        <g:datePicker name="addExpiredDate" value="${addExpiredDate}" precision="day" noSelection="['':'']" style="text-align:center;vertical-align:middle"/>
		  </td>            
      <td>&nbsp;</td>
      <td><g:submitToRemote controller="purchase" update="detailListPanel" action="addDetail" value="${message(code: 'add', 'default': 'Add')}"/></td>
      </tr>
    <g:each in="${purchaseDetailList}" status="i" var="purchaseDetail">
      
      <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
      <td valign="top" class="value">
      <g:hiddenField name="detailsIds[${i}]" value="${fieldValue(bean: purchaseDetail, field: 'id')}"/>
      <g:select name="productIds[${i}]" from="${com.vitaflo.innova.Product.list([sort:'name', order:'asc'])}" optionKey="id"
                value="${purchaseDetail?.product?.id}"
                noSelection="['':'Seleccione...']"
                onchange="${remoteFunction(controller:'purchase', action:'updatePrice',onSuccess:'updatePurchaseDetailsPrice(e,'+i+')', params:'\'addProductId=\'  + this.value')}"
                />
      </td>

      <td valign="top" class="value">
        <g:textField name="quantities[${i}]" value="${fieldValue(bean: purchaseDetail, field: 'quantity')}"/>
      </td>

      <td class="value" style="vertical-align:middle;">
          <g:textField id="prices[${i}]" name="prices[${i}]" value="${formatNumber(number:purchaseDetail?.price, format:'0.00')}" style="text-align:center;vertical-align:middle"/>
      </td>
      <td class="value" style="vertical-align:middle;">
          <g:textField id="lots[${i}]" name="lots[${i}]" value="${purchaseDetail?.lot}" style="text-align:center;vertical-align:middle"/>
      </td>
      <td class="value" style="vertical-align:middle;">
        <g:datePicker id="expiredDates[${i}]" name="expiredDates[${i}]" precision="day" noSelection="['':'']" value="${purchaseDetail?.expiredDate}" />
      </td>            
      <td style="vertical-align:middle"><g:formatNumber number="${purchaseDetail?.total}" /></td>
      <td><g:submitToRemote controller="purchase" update="detailListPanel" action="removeDetail" id="${i}" onSuccess="updateAmount(e)" value="${message(code: 'remove', 'default': 'Remove')}"/></td>
      </tr>
    </g:each>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
	    <td valign="top" class="name">
	        <label for="amount"><g:message code="purchase.amount" default="Amount" />:</label>
	    </td>
	    <td valign="top" class="value ${hasErrors(bean: purchaseInstance, field: 'amount', 'errors')}">
	        <g:textField name="amount" value="${formatNumber(number:amount , format:'0.00')}" />
	
	    </td>
    </tr>
    </tbody>
  </table>
</div>