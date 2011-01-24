
<%@ page import="com.vitaflo.innova.Patient" %>
<%@ page import="com.vitaflo.innova.Country" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title><g:message code="patient.list" default="Patient List" /></title>
  <g:javascript library="scriptaculous" />
</head>
<body>
  <div class="nav">
    <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
      <span class="menuButton"><g:link class="create" action="create"><g:message code="patient.new" default="New Patient" /></g:link></span>
  </div>
  <div class="body">
    <h1><g:message code="patient.list" default="Patient List" /></h1>
    <div id="searchBox">
      <g:form
        name="searchForm"
        url="[controller:'patient',action:'list']">
        <table>
          <tr>
            <td>
              <div><g:message code="patient.lastName"/> </div>
          <g:textField name="patient" value="${patient}" />
          </td>
          <td>
            <div><g:message code="patient.country"/> </div>
          <g:select name="selectedCountry" from="${session?.countries}" optionKey="code" optionValue="name" noSelection="['':'']"/>
          </td>
          <td>
            <div><g:message code="patient.client"/> </div>
          <g:textField id="autocompleteClient" name="client" value="${client}" size="38" />
          <div id="client_choices" class="autocomplete"></div>
          <g:javascript>
            new Ajax.Autocompleter("autocompleteClient", "client_choices", "${createLink(controller:'client', action:'searchAutocomplete')}",{});
          </g:javascript>
          </td>
          <td>
            <div><g:message code="patient.pathology"/> </div>
          <g:textField id="autocompletePathology" name="pathology" value="${pathology}" />
          <div id="pathology_choices" class="autocomplete"></div>
          <g:javascript>
            new Ajax.Autocompleter("autocompletePathology", "pathology_choices", "${createLink(controller:'patient', action:'searchAutocompletePathology')}",{});
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
            <th>&nbsp;</th>
        <g:sortableColumn property="lastName" title="Name" params="${params}" titleKey="patient.firstName" />
        <th><g:message code="patient.initials" default="Initials"/></th>
        <th><g:message code="patient.country" default="Country" /></th>
        <g:sortableColumn property="clientName" title="Client" params="${params}" titleKey="patient.client" />
        <g:sortableColumn property="pathology" title="Pathology" params="${params}" titleKey="patient.pathology" />
        </tr>
        </thead>
        <tbody>
        <g:each in="${patientInstanceList}" status="i" var="patientInstance">
          <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
            <td>${i + params.offset.toInteger() + 1}</td>
            <td><g:link action="show" id="${patientInstance.id}">${patientInstance}</g:link></td>

          <td><g:link action="show" id="${patientInstance.id}">${patientInstance?.initials}</g:link></td>

          <td>${fieldValue(bean: patientInstance, field: "country")}</td>

          <td>${fieldValue(bean: patientInstance, field: "client")}</td>

          <td>${fieldValue(bean: patientInstance, field: "pathology")}</td>

          </tr>
        </g:each>
        </tbody>
      </table>
    </div>
    <div class="paginateButtons">
      <g:paginate params="${params}" total="${patientInstanceTotal}" />
    </div>
  </div>
</body>
</html>
