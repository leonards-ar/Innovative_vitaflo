
<%@ page import="com.vitaflo.innova.Product" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title><g:message code="product.show" default="Show Product" /></title>
  </head>
  <body>
    <div class="nav">
      <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
      <span class="menuButton"><g:link class="list" action="list"><g:message code="product.list" default="Product List" /></g:link></span>
      <g:ifAnyGranted role="ROLE_ADMIN">
        <span class="menuButton"><g:link class="create" action="create"><g:message code="product.new" default="New Product" /></g:link></span>
      </g:ifAnyGranted>
    </div>
    <div class="body">
      <h1><g:message code="product.show" default="Show Product" /></h1>
      <g:if test="${flash.message}">
        <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
      </g:if>
      <g:form>
        <g:hiddenField name="id" value="${productInstance?.id}" />
        <div class="dialog">
          <table>
            <tbody>
              <tr class="prop">
                <td valign="top" class="name"><g:message code="product.name" default="Name" />:</td>

            <td valign="top" class="value">${fieldValue(bean: productInstance, field: "name")}</td>

            </tr>

              <tr class="prop">
                <td valign="top" class="name"><g:message code="product.comercialName" default="Comercial Name" />:</td>

                <td valign="top" class="value">${fieldValue(bean: productInstance, field: "comercialName")}</td>

            </tr>

            <tr class="prop">
              <td valign="top" class="name"><g:message code="product.presentation" default="Presentation" />:</td>

            <td valign="top" class="value">${fieldValue(bean: productInstance, field: "presentation")} ${fieldValue(bean: productInstance, field: "doseUnit")}</td>

            </tr>

            <tr class="prop">
              <td valign="top" class="name"><g:message code="product.price" default="Price" />:</td>
              <td valign="top" class="value">${fieldValue(bean: productInstance, field: "price")}</td>
            </tr>

            <tr class="prop">
              <td valign="top" class="name"><g:message code="product.supplier" default="Supplier" />:</td>

            <td valign="top" class="value"><g:link controller="supplier" action="show" id="${productInstance?.supplier?.id}">${productInstance?.supplier?.encodeAsHTML()}</g:link></td>

            </tr>

            <tr class="prop">
              <td valign="top" class="name"><g:message code="product.drug" default="Drug" />:</td>

            <td valign="top" class="value"><g:link controller="drug" action="show" id="${productInstance?.drug?.id}">${productInstance?.drug?.encodeAsHTML()}</g:link></td>

            </tr>

            <tr class="prop">
              <td valign="top" class="name"><g:message code="product.description" default="Description" />:</td>

            <td valign="top" class="value"><g:textArea name="description" value="${productInstance?.description}" rows="7" cols="40" readonly="true"/></td>

            </tr>

            </tbody>
          </table>
        </div>
        <g:ifAnyGranted role="ROLE_ADMIN">
          <div class="buttons">
            <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'edit', 'default': 'Edit')}" /></span>
            <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'delete', 'default': 'Delete')}" onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}');" /></span>
          </div>
        </g:ifAnyGranted>
      </g:form>
    </div>
  </body>
</html>
