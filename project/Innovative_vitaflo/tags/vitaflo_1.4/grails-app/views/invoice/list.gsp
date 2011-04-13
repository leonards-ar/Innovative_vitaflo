
<%@ page import="com.vitaflo.innova.Invoice" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title><g:message code="invoice.list" default="Invoice List" /></title>
  <g:javascript library="scriptaculous" />
</head>
<body>
  <div class="nav">
    <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
    <span class="menuButton"><g:link class="create" action="create"><g:message code="invoice.new" default="New Invoice" /></g:link></span>
  </div>
  <div class="body">
    <h1><g:message code="invoice.list" default="Invoice List" /></h1>
    <div id="searchBox">
      <g:form
        name="searchForm"
        url="[controller:'invoice',action:'list']">
        <table>
          <tr>
            <td>
              <div><g:message code="purchase.codeNumber"/> </div>
          <g:textField name="codeNumber" value="${codeNumber}" />
          </td>
          <td>
            <div><g:message code="proforma.client"/> </div>

          <g:textField id="autocompleteClient" name="client" value="${client}" size="38" />
          <div id="client_choices" class="autocomplete"></div>
          <g:javascript>
            new Ajax.Autocompleter("autocompleteClient", "client_choices", "${createLink(controller:'client', action:'searchAutocomplete')}",{});
          </g:javascript>
          </td>
          <td>
            <div><g:message code="proforma.patient"/> </div>
          <g:textField id="autocompletePatient" name="patient" value="${patient}" />
          <div id="patient_choices" class="autocomplete"></div>
          <g:javascript>
            new Ajax.Autocompleter("autocompletePatient", "patient_choices", "${createLink(controller:'patient', action:'searchAutocomplete')}",{});
          </g:javascript>
          </td>
          <td>
            <div><g:message code="invoice.status"/> </div>
          <g:select name="status" from="${com.vitaflo.innova.Invoice.STATUS_LIST}" value="${status}" noSelection="['':'']" valueMessagePrefix="invoice.status" />
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
        <g:sortableColumn property="number" params="${params}" title="Number" titleKey="invoice.number" />

        <th><g:message code="invoice.proforma" default="Proforma" /></th>

        <g:sortableColumn property="amount" params="${params}" title="Amount" titleKey="invoice.amount" />

        <g:sortableColumn property="status" params="${params}" title="Status" titleKey="invoice.status" />

        <g:sortableColumn property="date" params="${params}" title="Date" titleKey="invoice.date" />
        </tr>
        </thead>
        <tbody>
        <g:each in="${invoiceInstanceList}" status="i" var="invoiceInstance">
          <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
            <td>${i + params.offset.toInteger() + 1}</td>
            <td><g:link action="show" id="${invoiceInstance.id}">${(invoiceInstance?.number)?invoiceInstance?.number : '_'}</g:link></td>

          <td>${fieldValue(bean: invoiceInstance, field: "proforma")}</td>

          <td class="currencyValue">${formatNumber(number: invoiceInstance.amount, format: "0.00")}</td>

          <td>${message(code: 'invoice.status.'+invoiceInstance.status)}</td>

          <td><g:formatDate date="${invoiceInstance.date}" format="dd/MM/yyyy"/></td>
          </tr>
        </g:each>
        </tbody>
      </table>
    </div>
    <div class="paginateButtons">
      <g:paginate total="${invoiceInstanceTotal}" params="${params}" />
    </div>
  </div>
</body>
</html>
