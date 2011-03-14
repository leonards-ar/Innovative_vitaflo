
<%@ page import="com.vitaflo.innova.Client" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title><g:message code="client.create" default="Create Client" /></title>
  </head>
  <body>
    <div class="nav">
      <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
      <span class="menuButton"><g:link class="list" action="list"><g:message code="client.list" default="Client List" /></g:link></span>
    </div>
    <div class="body">
      <h1><g:message code="client.create" default="Create Client" /></h1>
      <g:if test="${flash.message}">
        <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
      </g:if>
      <g:hasErrors bean="${clientInstance}">
        <div class="errors">
          <g:renderErrors bean="${clientInstance}" as="list" />
        </div>
      </g:hasErrors>
      <g:form action="save" method="post" >
        <div class="dialog">
          <table>
            <tbody>

              <tr class="prop">
                <td valign="top" class="name">
                  <label for="name"><g:message code="client.name" default="Name" />:</label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: clientInstance, field: 'name', 'errors')}">
            <g:textField name="name" value="${fieldValue(bean: clientInstance, field: 'name')}" />

            </td>
            </tr>

            <tr class="prop">
              <td valign="top" class="name">
                <label for="address"><g:message code="client.address" default="Address" />:</label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: clientInstance, field: 'address', 'errors')}">
            <g:textField name="address" value="${fieldValue(bean: clientInstance, field: 'address')}" />

            </td>
            </tr>

            <tr class="prop">
              <td valign="top" class="name">
                <label for="phone"><g:message code="client.phone" default="Phone" />:</label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: clientInstance, field: 'phone', 'errors')}">
            <g:textField name="phone" value="${fieldValue(bean: clientInstance, field: 'phone')}" />

            </td>
            </tr>

            <tr class="prop">
              <td valign="top" class="name">
                <label for="email"><g:message code="client.email" default="Email" />:</label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: clientInstance, field: 'email', 'errors')}">
            <g:textField name="email" value="${fieldValue(bean: clientInstance, field: 'email')}" />

            </td>
            </tr>

            <tr class="prop">
              <td valign="top" class="name">
                <label for="contact"><g:message code="client.contact" default="Contact" />:</label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: clientInstance, field: 'contact', 'errors')}">
            <g:textField name="contact" value="${fieldValue(bean: clientInstance, field: 'contact')}" />

            </td>
            </tr>

            <tr class="prop">
              <td valign="top" class="name">
                <label for="cuit"><g:message code="client.cuit" default="CUIT" />:</label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: clientInstance, field: 'cuit', 'errors')}">
            <g:textField name="cuit" value="${fieldValue(bean: clientInstance, field: 'cuit')}" />

            </td>
            </tr>
            
            <tr class="prop">
              <td valign="top" class="name">
                <label for="country"><g:message code="client.respiva" default="Resp. IVA" />:</label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: clientInstance, field: 'ivaResponsibleType', 'errors')}">
            <g:select name="ivaResponsibleType" from="${Client.RESPIVA_LIST}" value="${clientInstance?.ivaResponsibleType}" valueMessagePrefix="client.respiva" noSelection="['':'']"/>

            </td>
           </tr>

            <tr class="prop">
              <td valign="top" class="name">
                <label for="country"><g:message code="client.country" default="Country" />:</label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: clientInstance, field: 'country', 'errors')}">
            <g:select name="country.id" from="${session.countries}" optionKey='id' value="${clientInstance?.country?.id}" />

            </td>
            </tr>

            </tbody>
          </table>
        </div>
        <div class="buttons">
          <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'create', 'default': 'Create')}" /></span>
        </div>
      </g:form>
    </div>
  </body>
</html>
