
<%@ page import="com.vitaflo.innova.Proforma" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="proforma.addBatch" default="Add batch code" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="show" controller="invoice" action="show" id="${addBatchCmd.invoiceId}"><g:message code="invoice.show" default="Show invoice" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="proforma.addBatch" default="Add batch code" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${proformaInstance}">
            <div class="errors">
                <g:renderErrors bean="${proformaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form>
                <g:hiddenField name="id" value="${proformaInstance?.id}" />
                <g:hiddenField name="invoiceId" value="${addBatchCmd.invoiceId}" />
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" colspan="2"><h4><g:message code="proforma" default="Proforma"/></h4></td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="proforma.id" default="Id" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: proformaInstance, field: "id")}</td>
                                
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="proforma.client" default="Client" />:</td>

                                <td valign="top" class="value">${fieldValue(bean: proformaInstance, field: "client")}</td>

                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="proforma.patient" default="Patient" />:</td>

                                <td valign="top" class="value">${fieldValue(bean: proformaInstance, field: "patient")}</td>

                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="proforma.status" default="Status" />:</td>

                                <td valign="top" class="value">${message(code: 'proforma.status.list.'+proformaInstance.status)}</td>

                            </tr>

                        </tbody>
                    </table>
                </div>

                <g:if test="${proformaInstance?.details?.size()> 0}">
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
                    <g:each in="${proformaInstance.details}" status="i" var="proformaDetail">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td>${fieldValue(bean:proformaDetail, field: "productName")}</td>

                            <td>${fieldValue(bean:proformaDetail, field: "quantity")}</td>

                            <td valign="top" class="value">
                              <g:textField name="batchNumbers[${i}]" value="${addBatchCmd.batchNumbers[i]}"/>
                            </td>
                        </tr>
                    </g:each>
                   </tbody>
                  </table>
                </div>
                </g:if>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="edit" action="updateBatch" value="${message(code: 'update', 'default': 'Update')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
