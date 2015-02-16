
<%@ page import="com.vitaflo.innova.Patient" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title><g:message code="patient.create" default="Create Patient" /></title>
  <g:javascript library="prototype"/>
  <g:javascript>
    function updateClients(e) {
    var clients = e.responseText.evalJSON();
    $('client.id').options.length=clients.size();
    for(i=0;i < clients.size();i++){
      $('client.id').options[i] = new Option(clients[i].name, clients[i].id);
    }

    }

    function fillInitials() {
      $('initials').value = $('firstName').value.substring(0,1) + $('lastName').value.substring(0,1);
    }

	function handleAdverseEvent() {
		if($("adverseEventReported").checked == true) {
			$("adverseEventDIV").show(); 
		} else {
			$("adverseEventDIV").hide(); 
		}
	}
	
	function handleSimilarProblemsInFamily() {
		if($("similarProblemsInFamily").checked == true) {
			$("similarProblemsInFamilyDIV").show(); 
		} else {
			$("similarProblemsInFamilyDIV").hide(); 
		}
	}
	
  </g:javascript>
</head>
<body>
  <div class="nav">
    <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
    <span class="menuButton"><g:link class="list" action="list"><g:message code="patient.list" default="Patient List" /></g:link></span>
  </div>
  <div class="body">
    <h1><g:message code="patient.create" default="Create Patient" /></h1>
    <g:if test="${flash.message}">
      <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
    </g:if>
    <g:hasErrors bean="${patientInstance}">
      <div class="errors">
        <g:renderErrors bean="${patientInstance}" as="list" />
      </div>
    </g:hasErrors>
    <g:form action="save" method="post" >
      <div class="dialog">
        <table>
          <tbody>

            <tr class="prop">
              <td valign="top" class="name">
                <label for="firstName"><g:message code="patient.firstName" default="First Name" />:</label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'firstName', 'errors')}">
          		<g:textField name="firstName" size="45" maxlength="45" value="${fieldValue(bean: patientInstance, field: 'firstName')}" onChange="fillInitials()"/>
          	</td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="lastName"><g:message code="patient.lastName" default="Last Name" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'lastName', 'errors')}">
          <g:textField name="lastName" size="45" maxlength="45" value="${fieldValue(bean: patientInstance, field: 'lastName')}" onChange="fillInitials()" />

          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="initials"><g:message code="patient.initials" default="Initials" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'initials', 'errors')}">
          <g:textField name="initials" size="5" maxlength="10" value="${fieldValue(bean: patientInstance, field: 'initials')}" />

          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="birth"><g:message code="patient.birth" default="Day of Birth" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'birth', 'errors')}">
          <g:datePicker name="birth" value="${patientInstance?.birth}" precision="day" />

          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="birth"><g:message code="patient.weight" default="Weight" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'weight', 'errors')}">
          <g:textField name="weight" value="${formatNumber(number:patientInstance?.weight,format:'0.00')}" />


          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="phone"><g:message code="patient.phone" default="Phone" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'phone', 'errors')}">
          <g:textField name="phone" size="45" maxlength="45" value="${fieldValue(bean: patientInstance, field: 'phone')}" />
          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="cellphone"><g:message code="patient.cellphone" default="Cellphone" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'cellphone', 'errors')}">
          <g:textField name="cellphone" size="45" maxlength="45" value="${fieldValue(bean: patientInstance, field: 'cellphone')}" />
          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="email"><g:message code="patient.email" default="Email" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'email', 'errors')}">
          <g:textField name="email" size="45" maxlength="45" value="${fieldValue(bean: patientInstance, field: 'email')}" />
          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="motherCellphone"><g:message code="patient.motherCellphone" default="Mother's Cellphone" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'motherCellphone', 'errors')}">
          <g:textField name="motherCellphone" size="45" maxlength="45" value="${fieldValue(bean: patientInstance, field: 'motherCellphone')}" />
          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="fatherCellphone"><g:message code="patient.fatherCellphone" default="Father's Cellphone" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'fatherCellphone', 'errors')}">
          <g:textField name="fatherCellphone" size="45" maxlength="45" value="${fieldValue(bean: patientInstance, field: 'fatherCellphone')}" />
          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="contactName"><g:message code="patient.contactName" default="Contact Name" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'contactName', 'errors')}">
          <g:textField name="contactName" size="45" maxlength="45" value="${patientInstance?.contactName}" />

          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="deliveryAddress"><g:message code="patient.deliveryAddress" default="Delivery Address" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'deliveryAddress', 'errors')}">
          <g:textArea name="deliveryAddress" value="${patientInstance?.deliveryAddress}" maxlength="255" style="width:280;height:70"/>

          </td>
          </tr>


          <tr class="prop">
            <td valign="top" class="name">
              <label for="country"><g:message code="patient.country" default="Country" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'country', 'errors')}">
          <g:select name="country.id" from="${session.countries}" optionKey="id" value="${patientInstance?.country?.id}" onchange="${remoteFunction(controller:'client', action:'searchClientsByCountry',onSuccess:'updateClients(e)', params:'\'country=\'  + this.value')}" />

          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="client"><g:message code="patient.client" default="Client" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'client', 'errors')}">
          <g:select name="client.id" from="${clientList}" optionKey="id" value="${patientInstance?.client?.id}"  />

          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="dose"><g:message code="patient.dose" default="Dose" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'dose', 'errors')}">
              <g:textField name="dose" value="${formatNumber(number:patientInstance?.dose, format:'#.##')}" />
              <g:select name="doseUnit" from="${com.vitaflo.innova.Patient.UNIT_LIST}"  value="${fieldValue(bean: patientInstance, field: 'doseUnit')}" noSelection="['':'']"/>
            </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="pathology"><g:message code="patient.pathology" default="Pathology" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'pathologies', 'errors')}">
            <g:select name="selectedPathologies" from="${pathologyList}" optionKey="id" value="${patientInstance?.pathology?.id}" size="1" noSelection="['':'']"/>
          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="physician"><g:message code="patient.physician" default="Physician" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'physician', 'errors')}">
          <g:textField name="physician" maxlength="255" size="45" value="${fieldValue(bean: patientInstance, field: 'physician')}" />

          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="clinicalStatus"><g:message code="patient.clinicalStatus" default="Clinical Status" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'clinicalStatus', 'errors')}">
          <g:textArea name="clinicalStatus" maxlength="255" value="${fieldValue(bean: patientInstance, field: 'clinicalStatus')}" style="width:280;height:70"/>

          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="observations"><g:message code="patient.observations" default="Observations" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: patientInstance, field: 'observations', 'errors')}">
          <g:textArea name="observations" maxlength="255" value="${fieldValue(bean: patientInstance, field: 'observations')}" style="width:280;height:70"/>

          </td>
          </tr>
          
          <tr class="prop">
              <td valign="top" class="name">
                  <label for="adverseEventReported"><g:message code="patient.adverseEvent" default="Reported Adverse Event" />:</label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'adverseEventReported', 'errors')}">
                  <g:checkBox id="adverseEventReported" name="adverseEventReported" value="${patientInstance?.adverseEventReported}" onChange="handleAdverseEvent()"/>
                  <div id="adverseEventDIV" style="${patientInstance?.adverseEventReported ? '' : 'display:none'}">
                  <g:textArea name="adverseEvent" maxlength="255" value="${fieldValue(bean: patientInstance, field: 'adverseEvent')}" style="width:280;height:70"/>
                  </div>
              </td>
          </tr>

          <tr class="prop">
              <td valign="top" class="name">
                  <label for="similarProblemsInFamily"><g:message code="patient.similarProblemsInFamily" default="Similiar Problems in Family" />:</label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'similarProblemsInFamily', 'errors')}">
                  <g:checkBox id="similarProblemsInFamily" name="similarProblemsInFamily" value="${patientInstance?.similarProblemsInFamily}" onChange="handleSimilarProblemsInFamily()"/>
                  <div id="similarProblemsInFamilyDIV" style="${patientInstance?.similarProblemsInFamily ? '' : 'display:none'}">
                  <g:textArea name="similarProblemsInFamilyDescription" maxlength="255" value="${fieldValue(bean: patientInstance, field: 'similarProblemsInFamilyDescription')}" style="width:280;height:70"/>
                  </div>
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
