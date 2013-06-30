      <table>
        <thead>
          <tr>
		        <th><g:message code="productstock.product" default="Product"/></th>
		        <th><g:message code="productstock.stock" default="Stock" /></th>
		        <th><g:message code="productstock.sold" default="Sold" /></th>
		        <th><g:message code="productstock.available" default="Avaliable" /></th>
		        <th><g:message code="productstock.lot" default="Batch Number" /></th>
		        <th><g:message code="productstock.expiredDate" default="Expired Date"/>
        </tr>
        </thead>
        <tbody>
		<g:if test="${productStockListCount > 0}">
	        <g:each in="${productStockList}" status="i" var="productStockInstance">
	         <tr>
	          <td>${productStockInstance?.product?.name}</td>
	          <td>${productStockInstance?.quantity}</td>
	          <td>${productStockInstance?.sold}</td>
	          <td>${productStockInstance?.quantity - productStockInstance?.sold}</td>
	          <td>${productStockInstance?.lot}</td>
	          <td><g:formatDate date="${productStockInstance?.expiredDate}" format="dd/MM/yyyy"/></td>
	        </tr>
	        </g:each>
        </g:if>
        <g:else>
        	<tr>
        	  <td colspan="5"><g:message code="productStock.not.found" args="${[productName]}" default="No data to display"/></td>
        	</tr>
        </g:else>         
        </tbody>
      </table>