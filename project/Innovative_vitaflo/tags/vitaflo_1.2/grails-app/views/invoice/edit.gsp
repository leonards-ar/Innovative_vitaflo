
<%@ page import="com.vitaflo.innova.Invoice" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="invoice.edit" default="Edit Invoice" /></title>
        <g:javascript library="prototype" />
          <script type="text/javascript" language="JavaScript">
          function updateProformaAmount(e)
          {
            document.editInvoice.amount.value = e.responseText;
          }

          function submitForm(name)
          {
            document.editInvoice.action = name;
            document.editInvoice.submit();
          }

          function submitDeleteForm()
          {
           if (confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}'))
           {
             submitForm('delete');
           }else{
             return false;
           }
          }
        </script>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="invoice.list" default="Invoice List" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="invoice.new" default="New Invoice" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="invoice.edit" default="Edit Invoice" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${invoiceInstance}">
            <div class="errors">
                <g:renderErrors bean="${invoiceInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form name="editInvoice" method="post" >
                <g:hiddenField name="id" value="${invoiceInstance?.id}" />
                <g:hiddenField name="version" value="${invoiceInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="number"><g:message code="invoice.number" default="Number" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: invoiceInstance, field: 'number', 'errors')}">
                                    <g:textField name="number" value="${fieldValue(bean: invoiceInstance, field: 'number')}" />

                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="proforma"><g:message code="invoice.proforma" default="Proforma" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: invoiceInstance, field: 'proforma', 'errors')}">
                                    <g:select name="proforma.id" from="${proformasToSelect}" optionKey="id" 
                                              value="${invoiceInstance?.proforma?.id}"
                                              noSelection="['':'Seleccione...']"
                                              onchange="${remoteFunction(controller:'invoice', action:'lookUpAmountProforma',onSuccess:'updateProformaAmount(e)', params:'\'amountProformaId=\'  + this.value')}"
                                    />

                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="date"><g:message code="invoice.date" default="Date" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: invoiceInstance, field: 'date', 'errors')}">
                                    <g:datePicker name="date" value="${invoiceInstance?.date}" precision="day"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="amount"><g:message code="invoice.amount" default="Amount" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: invoiceInstance, field: 'amount', 'errors')}">
                                    <g:textField name="amount" value="${formatNumber(number:invoiceInstance?.amount, format:'0.00')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="status"><g:message code="invoice.status" default="Status" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: invoiceInstance, field: 'status', 'errors')}">
                                    <g:select name="status" from="${invoiceInstance.constraints.status.inList}" value="${invoiceInstance.status}" valueMessagePrefix="invoice.status"  />

                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="deliveryDate"><g:message code="invoice.deliveryDate" default="Date of delivery" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: invoiceInstance, field: 'deliveryDate', 'errors')}">
                                    <g:datePicker default="none" noSelection="${['':message(code:'noselect.dash')]}" name="deliveryDate" value="${invoiceInstance?.deliveryDate}" precision="day" years="${2007..2015}" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="update" class="save" value="${message(code: 'update', 'default': 'Update')}" onclick="submitForm('update')"/></span>
                    <g:if test="${invoiceInstance?.status == 'Pendiente'}">
                      <span class="button"><g:submitButton name="delete" class="delete" value="${message(code: 'delete', 'default': 'Delete')}" onclick="return submitDeleteForm()"/></span>
                    </g:if>
                </div>
            </g:form>
        </div>
    </body>
</html>
