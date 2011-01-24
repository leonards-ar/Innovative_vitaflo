
<%@ page import="com.vitaflo.innova.Purchase"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title><g:message code="purchase.show" default="Show Purchase" /></title>
</head>
<body>
<div class="nav"><span class="menuButton"><a class="home"
	href="${createLinkTo(dir: '')}"><g:message code="home"
	default="Home" /></a></span> <span class="menuButton"><g:link class="list"
	action="list">
	<g:message code="purchase.list" default="Purchase List" />
</g:link></span> <span class="menuButton"><g:link class="create" action="create">
	<g:message code="purchase.new" default="New Purchase" />
</g:link></span></div>
<div class="body">
<h1><g:message code="purchase.show" default="Show Purchase" /></h1>
<g:if test="${flash.message}">
	<div class="message"><g:message code="${flash.message}"
		args="${flash.args}" default="${flash.defaultMessage}" /></div>
</g:if> <g:form>
	<g:hiddenField name="id" value="${purchaseInstance?.id}" />
	<div class="dialog">
	<table>
		<tbody>

			<tr class="prop">
				<td valign="top" class="name"><g:message
					code="purchase.codeNumber" default="Code Number" />:</td>

				<td valign="top" class="value">
				${fieldValue(bean: purchaseInstance, field: "codeNumber")}
				</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message
					code="purchase.supplier" default="Supplier" />:</td>

				<td valign="top" class="value"><g:link controller="supplier"
					action="show" id="${purchaseInstance?.supplier?.id}">
					${purchaseInstance?.supplier?.encodeAsHTML()}
				</g:link></td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message
					code="purchase.creationDate" default="Date of issue" />:</td>

				<td valign="top" class="value"><g:formatDate
					format="dd/MM/yyyy" date="${purchaseInstance?.creationDate}" /></td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message
					code="purchase.expireDate" default="Expire Date" />:</td>

				<td valign="top" class="value"><g:formatDate
					format="dd/MM/yyyy" date="${purchaseInstance?.expireDate}" /></td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="purchase.amount"
					default="Amount" />:</td>

				<td valign="top" class="value"><g:formatNumber
					number="${purchaseInstance?.amount}" format="0.00" /></td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="purchase.status"
					default="Status" />:</td>

				<td valign="top" class="value">
				${message(code: 'purchase.status.'+purchaseInstance?.status)}
				</td>

			</tr>
		</tbody>
	</table>
	</div>

	<g:if test="${purchaseInstance?.details?.size()> 0}">
		<div class="list">
		<table style="margin-top: 5px;">
			<thead>
				<tr>

					<th><g:message code="proformaDetail.product" default="Product" /></th>

					<th><g:message code="proformaDetail.quantity" default="Quantity" /></th>

					<th><g:message code="product.price" default="Price" /></th>

					<th><g:message code="proformaDetail.total" default="Total" /></th>

				</tr>
			</thead>
			<tbody>
				<g:each in="${purchaseInstance?.details}" status="i" var="purchaseDetail">
					<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
		                <td>${fieldValue(bean:purchaseDetail, field: "productName")}</td>
		
		                <td>${fieldValue(bean:purchaseDetail, field: "quantity")}</td>
		
		                <td class="currencyValue"><g:formatNumber number="${purchaseDetail?.price}" format="0.00"/></td>
		
		                <td class="currencyValue"><g:formatNumber number="${purchaseDetail?.total}" format="0.00"/></td>
					</tr>
				</g:each>
			</tbody>
		</table>
		</div>
	</g:if>
	<g:if test="${(purchaseInstance?.status == 'Pending') || (purchaseInstance?.status == 'Free')}">
		<div class="buttons">
		  <span class="button">
		      <g:actionSubmit class="edit" action="edit" value="${message(code: 'edit', 'default': 'Edit')}" />
	      </span> 
		  <span class="button">
		      <g:actionSubmit class="delete" action="delete" value="${message(code: 'delete', 'default': 'Delete')}" onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}');" />
	      </span>
		</div>
	</g:if>
</g:form></div>
</body>
</html>
