
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
    <!--  span class="menuButton"><g:link class="create" action="create"><g:message code="productstock.new" default="New Proforma" /></g:link></span-->
  </div>
  <div class="body">
    <h1><g:message code="productstock.list" default="Product Stock List" /></h1>

    <g:if test="${flash.message}">
      <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
    </g:if>
<div>
      <table>
        <thead>
          <tr>
        <!--  td>&nbsp;</td -->
        <g:sortableColumn property="name" title="Name" titleKey="productstock.name" params="${params}"/>
        <th><g:message code="productstock.stock" default="Stock" /></th>
            <!--  td>&nbsp;</td-->
        <g:sortableColumn property="name" title="Name" titleKey="productstock.name" params="${params}"/>
        <th><g:message code="productstock.stock" default="Stock" /></th>
            <!-- td>&nbsp;</td-->
        <g:sortableColumn property="name" title="Name" titleKey="productstock.name" params="${params}"/>
        <th><g:message code="productstock.stock" default="Stock" /></th>
            <!-- td>&nbsp;</td-->
        <g:sortableColumn property="name" title="Name" titleKey="productstock.name" params="${params}"/>
        <th><g:message code="productstock.stock" default="Stock" /></th>

        </tr>
        </thead>
        <tbody>
        <tr>
        <g:each in="${productStockInstanceList}" status="i" var="productInstance">
          <!--  td>&nbsp;</td-->
          <td><g:link action="show" id="${productInstance?.product?.id}">${productInstance?.product?.name}</g:link></td>
          <td>${productInstance?.sum}</td>
          <g:if test="${( (i+1) % 4) == 0}">
          </tr><tr>
        </g:if>
        </g:each>
         </tr>        
        </tbody>
      </table>
    </div>
  </div>
</body>
</html>