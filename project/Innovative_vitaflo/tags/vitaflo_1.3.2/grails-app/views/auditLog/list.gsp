
<%@ page import="org.codehaus.groovy.grails.plugins.orm.auditable.AuditLogEvent" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title><g:message code="auditLog.list" default="Audit Log" /></title>
  <g:javascript library="scriptaculous" />
</head>
<body>
  <div class="nav">
    <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
  </div>
  <div class="body">
    <h1><g:message code="auditLog.list" default="Audit Log" /></h1>
    <div id="searchBox">
      <g:form
        name="searchForm"
        url="[controller:'auditLog',action:'list']">
        <table>
          <tr>
            <td>
              <div><g:message code="auditLog.actor"/> </div>
          <g:textField id="autocompleteActor" name="actor" value="${actor}" size="38" />
          <div id="actor_choices" class="autocomplete"></div>
          <g:javascript>
            new Ajax.Autocompleter("autocompleteActor", "actor_choices", "${createLink(controller:'auditLog', action:'searchAutocomplete')}",{});
          </g:javascript>
          </td>
          <td>
            <div><g:message code="auditLog.action"/> </div>
            <g:select name="eventName" from="${['INSERT', 'UPDATE', 'DELETE']}" noSelection="['':'']" valueMessagePrefix="eventName" value="${eventName}">
            </g:select>
          </td>
          <td>
            <div><g:message code="auditLog.object"/> </div>
            <g:select name="object" value="${object}" from="${['com.vitaflo.innova.Invoice','com.vitaflo.innova.User', 'com.vitaflo.innova.Client', 'com.vitaflo.innova.Patient', 'com.vitaflo.innova.Country', 'com.vitaflo.innova.Drug', 'com.vitaflo.innova.Product','com.vitaflo.innova.Proforma','com.vitaflo.innova.Purchase','com.vitaflo.innova.Supplier']}" noSelection="['':'']" valueMessagePrefix="object">
            </g:select>
          </td>
          <td>
            <div><g:message code="auditLog.objectId"/> </div>
            <g:textField name="objectId" value="${objectId}" size="10" />
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
        <g:sortableColumn property="lastUpdated" title="Last Updated" params="${params}" titleKey="auditLog.lastUpdated" />
        <g:sortableColumn property="actor" title="Actor" params="${params}" titleKey="auditLog.actor" />
        <g:sortableColumn property="eventName" title="Action" params="${params}" titleKey="auditLog.action" />
        <g:sortableColumn property="className" title="Object" params="${params}" titleKey="auditLog.object" />
        <th><g:message code="auditLog.objectId" default="ID" /></th>
        <th><g:message code="auditLog.property" default="Property" /></th>
        <th><g:message code="auditLog.value" default="Value" /></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${auditLogRecordInstanceList}" status="i" var="auditLogRecordInstance">
          <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
          <td>${i + params.offset.toInteger() + 1}</td>
          <td>${fieldValue(bean: auditLogRecordInstance, field: "lastUpdated")}</td>
          <td>${fieldValue(bean: auditLogRecordInstance, field: "actor")}</td>
          <td>${fieldValue(bean: auditLogRecordInstance, field: "eventName")}</td>
          <td>${fieldValue(bean: auditLogRecordInstance, field: "className")}</td>
          <td>${fieldValue(bean: auditLogRecordInstance, field: "persistedObjectId")}</td>
          <td>${fieldValue(bean: auditLogRecordInstance, field: "propertyName")}</td>
          <td>${fieldValue(bean: auditLogRecordInstance, field: "newValue")}</td>
          </tr>
        </g:each>
        </tbody>
      </table>
    </div>
    <div class="paginateButtons">
      <g:paginate params="${params}" total="${auditLogRecordTotal}" />
    </div>
  </div>
</body>
</html>
