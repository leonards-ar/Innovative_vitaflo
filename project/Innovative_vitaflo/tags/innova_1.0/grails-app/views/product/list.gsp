
<%@ page import="com.vitaflo.innova.Product" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title><g:message code="product.list" default="Product List" /></title>
    <g:javascript library="scriptaculous" />
  </head>
  <body>
    <div class="nav">
      <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
      <g:ifAnyGranted role="ROLE_ADMIN">
        <span class="menuButton"><g:link class="create" action="create"><g:message code="product.new" default="New Product" /></g:link></span>
      </g:ifAnyGranted>
    </div>
    <div class="body">
      <h1><g:message code="product.list" default="Product List" /></h1>
    <div id="searchBox">
      <g:form
        name="searchForm"
        url="[controller:'product',action:'list']">
        <table>
          <tr>
            <td>
              <div><g:message code="product.name"/> </div>
          <g:textField name="name" value="${name}" />
          </td>
          <td>
            <div><g:message code="product.supplier"/> </div>
          <g:textField id="autocompleteSupplier" name="supplier" value="${supplier}" />
          <div id="supplier_choices" class="autocomplete"></div>
          <g:javascript>
            new Ajax.Autocompleter("autocompleteSupplier", "supplier_choices", "${createLink(controller:'supplier', action:'searchAutocomplete')}",{});
          </g:javascript>
          </td>
          <td>
            <div>&nbsp;</div>
            <span class="button"><g:submitButton name="search" class="save" value="${message(code: 'find', 'default': 'Find')}" /></span>
          </td>
          </tr>
        </table>

      </g:form>

    </div>

      <g:if test="${flash.message}">
        <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
      </g:if>
      <div class="list">
        <table>
          <thead>
            <tr>
          <g:sortableColumn property="name" title="Name" titleKey="product.name" />

          <g:sortableColumn property="comercialName" title="Comercial Name" titleKey="product.comercialName" />

          <g:sortableColumn property="presentation" title="Presentation" titleKey="product.presentation" />

          <g:sortableColumn property="price" title="Price" titleKey="product.price" />

          <th><g:message code="product.supplier" default="Supplier" /></th>
          </tr>
          </thead>
          <tbody>
          <g:each in="${productInstanceList}" status="i" var="productInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

              <td><g:link action="show" id="${productInstance.id}">${fieldValue(bean: productInstance, field: "name")}</g:link></td>

            <td>${fieldValue(bean: productInstance, field: "comercialName")}</td>

            <td>${fieldValue(bean: productInstance, field: "presentation")} ${fieldValue(bean: productInstance, field: "doseUnit")}</td>

            <td class="currencyValue"><g:formatNumber number="${productInstance?.price}" format="0.00"/></td>

            <td>${fieldValue(bean: productInstance, field: "supplier")}</td>

            </tr>
          </g:each>
          </tbody>
        </table>
      </div>
      <div class="paginateButtons">
        <g:paginate total="${productInstanceTotal}" />
      </div>
    </div>
  </body>
</html>
