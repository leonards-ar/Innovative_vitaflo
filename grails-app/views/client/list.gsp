<%@ page import="com.vitaflo.innova.Client" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:javascript library="prototype"/>
  <title><g:message code="client.list" default="Client List"/></title>

</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home"/></a></span>
  <g:ifAnyGranted role="ROLE_ADMIN">
    <span class="menuButton"><g:link class="create" action="create"><g:message code="client.new" default="New Client"/></g:link></span>
  </g:ifAnyGranted>
</div>
<div class="body">
  <h1><g:message code="client.list" default="Client List"/></h1>
  <div id="searchBox">
    <g:form 
        name="searchForm"
        url="[controller:'client',action:'list']">
        <div><g:message code="client.name"/> </div>
              <g:textField name="clientName" value="${clientName}" />
              <span class="button"><g:submitButton name="find" class="save" value="${message(code: 'find', 'default': 'Find')}" /></span>
</g:form>

  </div>
  <g:if test="${flash.message}">
    <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}"/></div>
  </g:if>
  <div id="list" class="list">

    <table>
      <thead>
      <tr>

        <g:sortableColumn property="name" params="${params}" title="Name" titleKey="client.name"/>

        <g:sortableColumn property="phone" params="${params}" title="Phone" titleKey="client.phone"/>

        <g:sortableColumn property="contact" params="${params}" title="Contact" titleKey="client.contact"/>

        <g:if test="${session.countries.size() > 1}">
        <th><g:message code="client.country" default="Country" /></th>
        </g:if>

      </tr>
      </thead>
      <tbody>
      <g:each in="${clientInstanceList}" status="i" var="clientInstance">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

          <td><g:link action="show" id="${clientInstance.id}">${fieldValue(bean: clientInstance, field: "name")}</g:link></td>

          <td>${fieldValue(bean: clientInstance, field: "phone")}</td>

          <td>${fieldValue(bean: clientInstance, field: "contact")}</td>

          <g:if test="${session.countries.size() > 1}">
            <td>${fieldValue(bean: clientInstance, field: "country")}</td>
        </g:if>
        </tr>
      </g:each>
      </tbody>
    </table>

    <div class="paginateButtons">
      <g:paginate total="${clientInstanceTotal}" params="${params}" />
    </div>
  </div>

</div>
</body>
</html>
