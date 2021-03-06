<%@ page import="com.vitaflo.innova.Proforma" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="proforma.create" default="Create Proforma"/></title>
  <g:javascript library="prototype"/>
  <g:javascript library="popup"/>

  <g:javascript>
    function submitForm(name)
    {
    document.editProforma.action = name;
    document.editProforma.submit();
    }

    function submitDeleteForm(){
    if (confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}')) {
    submitForm('delete');
    } else {
    return false;
    }
    }

    function updateComponents(e) {
    var client = e.responseText.evalJSON().client;

    if (client != null) {
    for (i = 0; i < $('client.id').options.length; i++) {
    if ($('client.id').options[i].value == client) {
    $('client.id').options[i].selected = true;
    break;
    }
    }
    } else {
    $('client.id').options.selectedIndex = 0;
    }

    $('addDailyDose').value = e.responseText.evalJSON().dose;

    var units = e.responseText.evalJSON().doseUnit;

    if (units != null) {
    for (i = 0; i < $('addDoseUnit').options.length; i++) {
    if ($('addDoseUnit').options[i].value == units) {
    $('addDoseUnit').options[i].selected = true;
    break;
    }
    }
    } else {
    $('addDoseUnit').options.selectedIndex = 0;
    }

    }

    function updateAddPrice(e)
    {
    document.getElementById('addPrice').value = e.responseText;
    }

    function updateProformaDetailsPrice(e, index)
    {
    document.getElementById('prices['+index+']').value = e.responseText;
    }

  </g:javascript>
</head>
<body>
  <div class="nav">
    <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home"/></a></span>
    <span class="menuButton"><g:link class="list" action="list"><g:message code="proforma.list" default="Proforma List"/></g:link></span>
  </div>

  <!--cotizacion-dolar.com.ar
120x125px classic CD--> <div id="cardumen" style="display:none; position:absolute; border: 1px solid
rgb(90, 90, 90); background: rgb(176, 180, 160) none repeat scroll 0%
50%; text-align: center; width:
120px; height: 75px; line-height: 100%;" align="center">
<a target="_blank" href="http://www.dolarhoy.com/" alt="DolarHoy" title="DolarHoy.com" >
<img src="http://www.dolaronline.com/" border="0" alt="DolarHoy.com">
</a> 
</div> <!-- fin c�digo -->
  <div class="body">
  
    <h1><g:message code="proforma.create" default="Create Proforma"/></h1>
    <g:if test="${flash.message}">
      <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}"/></div>
    </g:if>
    <g:hasErrors bean="${proformaInstance}">
      <div class="errors">
        <g:renderErrors bean="${proformaInstance}" as="list"/>
      </div>
    </g:hasErrors>
    <g:form action="save" method="post">
      <div class="dialog">
        <table>
          <tbody>

            <tr class="prop">
              <td valign="top" class="name">
                <label for="patient"><g:message code="proforma.patient" default="Patient"/>:</label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: proformaInstance, field: 'patient', 'errors')}">
          <g:select name="patient.id" from="${patients}" optionKey="id" value="${proformaInstance?.patient?.id}"
                    noSelection="${['null':message(code:'noselect')]}"
                    onchange="${remoteFunction(controller:'proforma', action:'lookUpClient',onSuccess:'updateComponents(e)', params:'\'patientId=\'  + this.value')}"/>
          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="client"><g:message code="proforma.client" default="Client"/>:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: proformaInstance, field: 'client', 'errors')}">
          <g:select name="client.id" from="${clients}" optionKey="id" value="${proformaInstance?.client?.id}"/>
          </td>
          </tr>

         <tr class="prop">
           <td valign="top" class="name">
             <label for="courier"><g:message code="proforma.courier" default="Courier"/>:</label>
           </td>
           <td valign="top" class="value ${hasErrors(bean: proformaInstance, field: 'courier', 'errors')}">
         <g:textField name="courier" value="${formatNumber(number:proformaInstance?.courier, format:'0.00')}"/>
         </td>
         </tr>


          <tr class="prop">
            <td valign="top" class="name">
              <label for="discount"><g:message code="proforma.discount" default="Discount"/>:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: proformaInstance, field: 'discount', 'errors')}">
          <g:textField name="discount" value="${formatNumber(number:proformaInstance?.discount)}"/>

          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="donation"><g:message code="proforma.donation" default="Donation"/>:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: proformaInstance, field: 'donation', 'errors')}">
          <g:checkBox name="donation" value="${proformaInstance.donation}"/>
          </td>
          </tr>
          <g:if test="${grailsApplication.config.application.name != 'Innovative'}">
          <tr class="prop">
            <td valign="top" class="name">
              <label for="dollarValue"><g:message code="proforma.dollarValue" default="Dollar Value"/>:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: proformaInstance, field: 'dollarValue', 'errors')}">
          <g:textField name="dollarValue" value="${formatNumber(number:proformaInstance?.dollarValue, format:'0.00')}" />
           <a onmouseover="ShowContent('cardumen'); return true;" onmouseout="HideContent('cardumen'); return true;" href="javascript:ShowContent('cardumen')">
           <g:message code="proforma.dollar.cotiz" default="Show Dollar Value"/>
           </a>          
          </td>
          </tr>          
          </g:if>          
          <tr class="prop">
            <td valign="top" class="name">
              <label for="destinationAirport"><g:message code="proforma.destinationAirport" default="Port of Discharge"/>:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: proformaInstance, field: 'destinationAirport', 'errors')}">
          <g:textField name="destinationAirport" value="${proformaInstance.destinationAirport}" />
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="deliveryDate"><g:message code="proforma.deliveryDate" default="Date of delivery" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: proformaInstance, field: 'deliveryDate', 'errors')}">
          <g:datePicker default="none" noSelection="${['':message(code:'noselect.dash')]}" name="deliveryDate" value="${proformaInstance?.deliveryDate}" precision="day" years="${Calendar.instance.get(Calendar.YEAR)..Calendar.instance.get(Calendar.YEAR) + 5}" />
          </td>
          </tr>
          <tr class="prop">
            <td valign="top" class="name">
              <label for="paymentConditions"><g:message code="proforma.paymentcondition" default="Payment Conditions" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: proformaInstance, field: 'paymentConditions', 'errors')}">
            <g:textField name="paymentConditions" value="${proformaInstance?.paymentConditions}" />
          </td>
          </tr>                    
          </tbody>
        </table>
      </div>

      <div id="detailListPanel"><g:render template="proformaDetailList" model="[proformaDetailList:proformaDetailList]"/></div>

      <div class="buttons">
        <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'create', 'default': 'Create')}"/></span>
      </div>
    </g:form>
  </div>
</body>
</html>
