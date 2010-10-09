<%@ page import="com.vitaflo.innova.Client" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title><g:message code="client.show" default="Show Client"/></title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home"/></a></span>
  <span class="menuButton"><g:link class="list" action="list"><g:message code="client.list" default="Client List"/></g:link></span>
  <g:ifAnyGranted role="ROLE_ADMIN">
    <span class="menuButton"><g:link class="create" action="create"><g:message code="client.new" default="New Client"/></g:link></span>
  </g:ifAnyGranted>
</div>
<div class="body">
  <h1><g:message code="client.show" default="Show Client"/></h1>
  <g:if test="${flash.message}">
    <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}"/></div>
  </g:if>
  <g:form>
    <g:hiddenField name="id" value="${clientInstance?.id}"/>
    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="client.name" default="Name"/>:</td>

          <td valign="top" class="value">${fieldValue(bean: clientInstance, field: "name")}</td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="client.address" default="Address"/>:</td>

          <td valign="top" class="value">${fieldValue(bean: clientInstance, field: "address")}</td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="client.phone" default="Phone"/>:</td>

          <td valign="top" class="value">${fieldValue(bean: clientInstance, field: "phone")}</td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="client.email" default="Email"/>:</td>

          <td valign="top" class="value">${fieldValue(bean: clientInstance, field: "email")}</td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="client.contact" default="Contact"/>:</td>

          <td valign="top" class="value">${fieldValue(bean: clientInstance, field: "contact")}</td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="client.country" default="Country"/>:</td>

          <td valign="top" class="value">${fieldValue(bean: clientInstance, field: "country")}</td>

        </tr>

        </tbody>
      </table>
    </div>
    <g:ifAnyGranted role="ROLE_ADMIN">
      <div class="buttons">
        <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'edit', 'default': 'Edit')}"/></span>
        <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'delete', 'default': 'Delete')}" onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}');"/></span>
      </div>
    </g:ifAnyGranted>
  </g:form>
</div>
</body>
</html>
