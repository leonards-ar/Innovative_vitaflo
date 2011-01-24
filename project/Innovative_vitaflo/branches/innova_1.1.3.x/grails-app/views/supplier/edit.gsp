
<%@ page import="com.vitaflo.innova.Supplier" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="supplier.edit" default="Edit Supplier" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="supplier.list" default="Supplier List" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="supplier.new" default="New Supplier" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="supplier.edit" default="Edit Supplier" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${supplierInstance}">
            <div class="errors">
                <g:renderErrors bean="${supplierInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${supplierInstance?.id}" />
                <g:hiddenField name="version" value="${supplierInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="supplier.name" default="Name" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: supplierInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${fieldValue(bean: supplierInstance, field: 'name')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="supplier.email" default="Email" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: supplierInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${fieldValue(bean: supplierInstance, field: 'email')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="contact"><g:message code="supplier.contact" default="Contact" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: supplierInstance, field: 'contact', 'errors')}">
                                    <g:textField name="contact" value="${fieldValue(bean: supplierInstance, field: 'contact')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="phone"><g:message code="supplier.phone" default="Phone" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: supplierInstance, field: 'phone', 'errors')}">
                                    <g:textField name="phone" value="${fieldValue(bean: supplierInstance, field: 'phone')}" />

                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="deliveryPeriod"><g:message code="supplier.deliveryPeriod" default="Delivery Period" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: supplierInstance, field: 'deliveryPeriod', 'errors')}">
                                    <g:textField name="deliveryPeriod" value="${fieldValue(bean: supplierInstance, field: 'deliveryPeriod')}" />

                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="paymentConditionPeriod"><g:message code="supplier.paymentConditionPeriod" default="Payment Condition Period" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: supplierInstance, field: 'paymentConditionPeriod', 'errors')}">
                                    <g:textField name="paymentConditionPeriod" value="${fieldValue(bean: supplierInstance, field: 'paymentConditionPeriod')}" />
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'update', 'default': 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'delete', 'default': 'Delete')}" onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
