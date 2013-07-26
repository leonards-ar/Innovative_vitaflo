
<%@ page import="com.vitaflo.innova.Invoice" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="invoice.create" default="Create Invoice" /></title>
        <g:javascript library="prototype" />
        <g:javascript library="scriptaculous" />
        <g:javascript>  
          var showProductStockLink = '${createLink(action:"showProductStock")}';
        </g:javascript>
        <g:javascript library="invoice"/>
        


    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="invoice.list" default="Invoice List" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="invoice.create" default="Create Invoice" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${invoiceInstance}">
            <div class="errors">
                <g:renderErrors bean="${invoiceInstance}" as="list" />
            </div>
            </g:hasErrors>
            <div id="showStockDetail" style="display:none;position:absolute;top:150;left:80;z-index:10;background:#f7f7f7;"></div>
            <g:form name="createInvoice" action="save" method="post" >
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
                                              noSelection="['null':'Seleccione...']"
                                              onchange="${remoteFunction(controller:'invoice', action:'lookUpAmountProforma',onSuccess:'updateProformaAmount(e)', params:'\'amountProformaId=\'  + this.value')}"

                                    />

                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="date"><g:message code="invoice.date" default="Date" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: invoiceInstance, field: 'date', 'errors')}">
                                    <g:datePicker name="date" value="${invoiceInstance?.date}" precision="day"/>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="amount"><g:message code="invoice.amount" default="Amount" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: invoiceInstance, field: 'amount', 'errors')}">
                                 <g:textField name="amount" value="${formatNumber(number:invoiceInstance?.amount, format: '0.00')}"/>
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
                
      			<div id="detailListPanel" /><g:render template="invoiceDetailList" model="[invoiceDetailList:invoiceDetailList]"/></div>
      			                
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'create', 'default': 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
