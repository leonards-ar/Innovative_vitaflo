
<%@ page import="com.vitaflo.innova.Proforma" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title><g:message code="proforma.list" default="Proforma List" /></title>
  <g:javascript library="prototype" />
  <g:javascript library="scriptaculous" />
  <export:resource/>
  <g:javascript>

    var listStatus=new Array();
      listStatus['Aprobada']='${message(code:'proforma.status.list.Aprobada')}';
      listStatus['Anulada']='${message(code:'proforma.status.list.Anulada')}';
      listStatus['Rechazada']='${message(code:'proforma.status.list.Rechazada')}';
      listStatus['Creada']='${message(code:'proforma.status.list.Creada')}';
    
      function updateComponents(e){

      var status = e.responseText.evalJSON().status;
      var proformaId = e.responseText.evalJSON().proformaId;

      if(status != 'Creada' && status != 'Rechazada'){
        $('pepe' + proformaId).update(listStatus[status]);
      }

    }
  </g:javascript>

</head>
<body>
  <div class="nav">
    <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
    <span class="menuButton"><g:link class="create" action="create"><g:message code="proforma.new" default="New Proforma" /></g:link></span>
  </div>
  <div class="body">
    <h1><g:message code="proforma.list" default="Proforma List" /></h1>
    <div id="searchBox">
      <g:form
        name="searchForm"
        url="[controller:'proforma',action:'list']">
        <table>
          <tr>
            <td></td>
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
            <div><g:message code="proforma.status"/> </div>
            <g:select name="status" from="${com.vitaflo.innova.Proforma.STATUS_LIST}" value="${status}" noSelection="['':'']" valueMessagePrefix="proforma.status.list"/>
          </td>
          <td>
            <div><g:message code="patient.country"/> </div>
          <g:select name="selectedCountry" from="${session?.countries}" optionKey="code" optionValue="name" noSelection="['':'']" value="${selectedCountry}"/>
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
        <g:sortableColumn property="id" title="Id" titleKey="proforma.id" params="${params}"/>

        <th><g:message code="proforma.client" default="Client" /></th>

        <th><g:message code="proforma.patient" default="Patient" /></th>

        <g:sortableColumn property="status" title="Status" titleKey="proforma.status" params="${params}" />

        <g:sortableColumn property="createdAt" title="Created At" titleKey="proforma.createdAt" params="${params}" />

        </tr>
        </thead>
        <tbody>
        <g:each in="${proformaInstanceList}" status="i" var="proformaInstance">
          <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
            <td>${i + params.offset.toInteger() + 1}</td>
            <td><g:link action="show" id="${proformaInstance.id}">${fieldValue(bean: proformaInstance, field: "id")}</g:link></td>

          <td>${proformaInstance?.client}</td>

          <td>${proformaInstance?.patient}</td>

          <g:if test="${(proformaInstance?.status == 'Creada') || (proformaInstance?.status == 'Rechazada')}">
            <td><div id="pepe${proformaInstance.id}"><g:select name="proformaStatus" from="${com.vitaflo.innova.Proforma.STATUS_LIST}" value="${proformaInstance.status}" noSelection="['':'']" valueMessagePrefix="proforma.status.list"
                        onchange="${remoteFunction (controller:'proforma', id:proformaInstance.id, action:'updateStatus', params:'\'proformaStatus=\' + this.value')}"/>
                </div>
            </td>

          </g:if>
          <g:else>

          <td>${message(code: 'proforma.status.list.'+proformaInstance.status)}</td>
          </g:else>
          <td><g:formatDate format="dd-MM-yyyy" date="${proformaInstance.createdAt}" /></td>

          </tr>
        </g:each>
        </tbody>
      </table>
    </div>
    <div class="paginateButtons">
      <g:paginate total="${proformaInstanceTotal}" params="${params}"/>
    </div>
    <div class="buttons">
    <export:formats formats="['excel']" params="${params}"/>
    </div>    
  </div>
</body>
</html>