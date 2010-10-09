
<%@ page import="com.vitaflo.innova.Proforma" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="proforma.show" default="Show Proforma" /></title>
        <g:javascript>

          function print() {
            window.open("<g:createLink action='printProforma' id='${proformaInstance?.id}'/>","printWindow${proformaInstance?.id}","menubar=1,location=0,resizable=1,scrollbars=1,width=650,height=600,top=50,left=550");
          }
        </g:javascript>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="proforma.list" default="Proforma List" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="proforma.new" default="New Proforma" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="proforma.show" default="Show Proforma" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:form>
                <g:hiddenField name="id" value="${proformaInstance?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="proforma.id" default="Id" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: proformaInstance, field: "id")}</td>
                                
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="proforma.client" default="Client" />:</td>

                                <td valign="top" class="value"><g:link controller="client" action="show" id="${proformaInstance?.client?.id}">${proformaInstance?.client?.encodeAsHTML()}</g:link></td>

                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="proforma.patient" default="Patient" />:</td>

                                <td valign="top" class="value"><g:link controller="patient" action="show" id="${proformaInstance?.patient?.id}">${proformaInstance?.patient?.encodeAsHTML()}</g:link></td>

                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="proforma.status" default="Status" />:</td>

                                <td valign="top" class="value">${message(code: 'proforma.status.list.'+proformaInstance.status)}</td>

                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="proforma.createdAt" default="Created At" />:</td>

                                <td valign="top" class="value"><g:formatDate format="dd-MM-yyyy" date="${proformaInstance?.createdAt}" /></td>

                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="proforma.courier" default="Courier" />:</td>
                                
                                <td valign="top" class="value"><g:formatNumber number="${proformaInstance?.courier}" format="0.00"/></td>
                                
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="proforma.discount" default="Discount" />:</td>

                                <td valign="top" class="value"><g:formatNumber number="${proformaInstance?.discount}"/></td>

                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="proforma.deliveryDate" default="Date of Delivery" />:</td>
                                <td valign="top" class="value"><g:formatDate format="dd-MM-yyyy" date="${proformaInstance?.deliveryDate}" /></td>
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

                            <th><g:message code="proformaDetail.dailyDose" default="Daily Dose" /></th>

                            <th><g:message code="product.price" default="Price" /></th>

                            <th><g:message code="proformaDetail.total" default="Total" /></th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${proformaInstance.details}" status="i" var="proformaDetail">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td>${fieldValue(bean:proformaDetail, field: "productName")}</td>

                            <td>${fieldValue(bean:proformaDetail, field: "quantity")}</td>

                            <td>${fieldValue(bean: proformaDetail, field: "dailyDose")} ${fieldValue(bean: proformaDetail, field: "doseUnit")}</td>

                            <td class="currencyValue"><g:formatNumber number="${proformaDetail?.price}" format="0.00"/></td>

                            <td class="currencyValue"><g:formatNumber number="${proformaDetail?.total}" format="0.00"/></td>
                        </tr>
                    </g:each>
                    <g:set var="detailsSize" value="${proformaInstance.details.size()}" />
                    <tr class="${(detailsSize % 2) == 0?'odd':'even'}" style="border-top:1px solid #ddd">
                        <td colspan="4"><g:message code="proforma.totalproducts" default="Total Products" /></td>
                        <td class="currencyValue"><g:formatNumber number="${totalDetails}" format="0.00"/></td>
                      </tr>
                    <tr class="${((detailsSize+1) % 2) == 0?'odd':'even'}">
                    <td colspan="4"><g:message code="proforma.courier" default="Courier" /></td>
                    <td class="currencyValue"><g:formatNumber number="${proformaInstance?.courier}" format="0.00"/></td>
                    </tr>
                    <tr class="${((detailsSize+2) % 2) == 0?'odd':'even'}">
                    <td colspan="4" style="color:red"><g:message code="proforma.discountAmount" default="Discount" /> <g:formatNumber number="${proformaInstance?.discount}" format="0.00"/> %</td>
                    <td class="currencyDiscountValue"><g:formatNumber number="${discountAmount}" format="0.00"/></td>
                    </tr>
                    <tr class="${((detailsSize+3) % 2) == 0?'odd':'even'}">
                    <td colspan="4"><b><g:message code="proforma.totalAmount" default="Total Amount" /></b></td>
                    <td class="currencyValue"><b><g:formatNumber number="${totalAmount}" format="0.00"/></b></td>
                    </tr>
                   </tbody>
                  </table>
                </div>
                </g:if>
                <div class="buttons">
                    <g:if test="${(proformaInstance?.status == 'Creada') || (proformaInstance?.status == 'Rechazada')}">
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'edit', 'default': 'Edit')}" /></span>
                    </g:if>
                    <g:if test="${proformaInstance?.status == 'Creada'}">
                      <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'delete', 'default': 'Delete')}" onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}');" /></span>
                    </g:if>
                    <span class="button"><g:actionSubmit class="edit" action="proformaEmail" value="${message(code: 'sendEmailToClient', 'default': 'Send to client')}" /></span>
                    <span class="button"><g:link class="printLink" url="#" onclick="print()"><g:message code="proforma.print" default="Print Proforma"/></g:link></span>
                    </div>
            </g:form>
        </div>
    </body>
</html>
