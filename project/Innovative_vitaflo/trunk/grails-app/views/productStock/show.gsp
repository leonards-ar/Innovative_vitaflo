
<%@ page import="com.vitaflo.innova.Proforma" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title><g:message code="productstock.list" default="Product Stock List" /></title>
  <g:javascript library="prototype" />
  <g:javascript library="scriptaculous" />
  

</head>
<body>
  <div class="nav">
    <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
    <span class="menuButton"><g:link class="list" action="list"><g:message code="productstock.list" default="Product List" /></g:link></span>
    <!-- span class="menuButton"><g:link class="create" action="create"><g:message code="productstock.new" default="New Product Stock" /></g:link></span-->
  </div>
  <div class="body">
    <h1><g:message code="productstock.show" default="Product Stock Show" /></h1>


<div>
      <table>
        <thead>
          <tr>
		        <th><g:message code="productstock.product" default="Product"/></th>
		        <th><g:message code="productstock.stock" default="Stock" /></th>
		        <th><g:message code="productstock.sold" default="Sold" /></th>
		        <th><g:message code="productstock.lot" default="Lot" /></th>
		        <th><g:message code="productstock.expiredDate" default="Expired Date"/>
        </tr>
        </thead>
        <tbody>

        <g:each in="${productStockList}" status="i" var="productStockInstance">
         <tr>
          <td><g:link action="edit" id="${productStockInstance?.id}">${productStockInstance?.product?.name}</g:link></td>
          <td>${productStockInstance?.quantity}</td>
          <td>${productStockInstance?.sold}</td>
          <td>${productStockInstance?.lot}</td>
          <td>${productStockInstance?.expiredDate}</td>
        </tr>
        </g:each>
                 
        </tbody>
      </table>
    </div>
  </div>
</body>
</html>