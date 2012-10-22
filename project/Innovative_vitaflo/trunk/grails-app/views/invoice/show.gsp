
<%@ page import="com.vitaflo.innova.Invoice" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="invoice.show" default="Show Invoice" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="invoice.list" default="Invoice List" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="invoice.new" default="New Invoice" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="invoice.show" default="Show Invoice" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:form>
                <g:hiddenField name="id" value="${invoiceInstance?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>                                                    
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="invoice.number" default="Number" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: invoiceInstance, field: "number")}</td>                                
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="invoice.proforma" default="Proforma" />:</td>

                                <td valign="top" class="value"><g:link controller="proforma" action="show" id="${invoiceInstance?.proforma?.id}">${invoiceInstance?.proforma?.encodeAsHTML()}</g:link></td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="invoice.date" default="Date" />:</td>
                                
                                <td valign="top" class="value"><g:formatDate date="${invoiceInstance?.date}" format="dd/MM/yyyy" /></td>                             
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="invoice.amount" default="Amount" />:</td>
                                
                                <td valign="top" class="value">${formatNumber(number: invoiceInstance.amount, format: "0.00")}</td>                              
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="invoice.status" default="Status" />:</td>
                                
                                <td valign="top" class="value">${message(code: 'invoice.status.'+invoiceInstance.status)}</td>                            
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="invoice.deliveryDate" default="Date of delivery" />:</td>

                                <td valign="top" class="value"><g:formatDate date="${invoiceInstance?.deliveryDate}" format="dd/MM/yyyy" /></td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="invoice.createdAt" default="Created At" />:</td>
                                
                                <td valign="top" class="value"><g:formatDate date="${invoiceInstance?.createdAt}" format="dd/MM/yyyy" /></td>                                
                            </tr>
                                                        
                        </tbody>
                    </table>
                </div>

                <g:if test="${invoiceInstance?.proforma?.details?.size()> 0}">
                <div id="detailListPanel" class="list">
                  <table style="margin-top: 5px;">
                    <thead>
                        <tr>
                            <th><g:message code="proformaDetail.product" default="Product" /></th>

                            <th><g:message code="proformaDetail.quantity" default="Quantity" /></th>

                            <th><g:message code="proformaDetail.lot" default="Batch Number" /></th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${invoiceInstance.proforma.details}" status="i" var="proformaDetail">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td>${fieldValue(bean:proformaDetail, field: "productName")}</td>

                            <td>${fieldValue(bean:proformaDetail, field: "quantity")}</td>

                            <td>${fieldValue(bean:proformaDetail, field: "lot")}</td>
                        </tr>
                    </g:each>
                   </tbody>
                  </table>
                </div>
                </g:if>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'edit', 'default': 'Edit')}" /></span>
                    <g:if test="${invoiceInstance?.status == 'Pendiente'}">
                      <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'delete', 'default': 'Delete')}" onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}');" /></span>
                    </g:if>
                    <span class="menuButton"><g:link class="create" controller="proforma" action="addBatch" id="${invoiceInstance?.proforma?.id}" params="[invoiceId:invoiceInstance.id]"><g:message code="proforma.addBatch" default="Add Batch"/></g:link></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
