
<%@ page import="com.vitaflo.innova.Drug" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title><g:message code="drug.show" default="Show Drug" /></title>
  </head>
  <body>
    <div class="nav">
      <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
      <span class="menuButton"><g:link class="list" action="list"><g:message code="drug.list" default="Drug List" /></g:link></span>
      <g:ifAnyGranted role="ROLE_ADMIN">
        <span class="menuButton"><g:link class="create" action="create"><g:message code="drug.new" default="New Drug" /></g:link></span>
      </g:ifAnyGranted>
    </div>
    <div class="body">
      <h1><g:message code="drug.show" default="Show Drug" /></h1>
      <g:if test="${flash.message}">
        <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
      </g:if>
      <g:form>
        <g:hiddenField name="id" value="${drugInstance?.id}" />
        <div class="dialog">
          <table>
            <tbody>
              <tr class="prop">
                <td valign="top" class="name"><g:message code="drug.name" default="Name" />:</td>

            <td valign="top" class="value">${fieldValue(bean: drugInstance, field: "name")}</td>

            </tr>
            <tr class="prop">
              <td valign="top" class="name"><g:message code="drug.products" default="Products" />:</td>
            <td  valign="top" style="text-align: left;" class="value">
              <ul>
                <g:each in="${drugInstance?.products}" var="productInstance">
                  <li><g:link controller="product" action="show" id="${productInstance?.id}">${productInstance?.name}</g:link></li>
                </g:each>
              </ul>
            </td>
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
