
<%@ page import="com.vitaflo.innova.ProductStock" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="productstock.edit" default="Edit Product Stock" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="productstock.list" default="Product List" /></g:link></span>
            <!--  span class="menuButton"><g:link class="create" action="create"><g:message code="product.new" default="New Product" /></g:link></span-->
        </div>
        <div class="body">
            <h1><g:message code="product.edit" default="Edit Product" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${productStockInstance}">
            <div class="errors">
                <g:renderErrors bean="${productStockInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${productStockInstance?.id}" />
                <g:hiddenField name="version" value="${productStockInstance?.version}" />
                <g:hiddenField name="price" value="${productStockInstance.price}"/>
                <g:hiddenField name="sold" value="${productStockInstance.sold}"/>
                <g:hiddenField name="price" value="${productStockInstance.price}"/>
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="product.name" default="Name" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productStockInstance, field: 'name', 'errors')}">
                                    <g:hiddenField name="name" value="${productStockInstance?.product}" />
                                    ${productStockInstance?.product}

                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="proformaDetail.quantity" default="quantity" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productStockInstance, field: 'quantity', 'errors')}">
                                    <g:textField name="quantity" value="${productStockInstance?.quantity}" />

                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lot"><g:message code="proformaDetail.lot" default="Lot" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productStockInstance, field: 'lot', 'errors')}">
                                    <g:textField name="lot" value="${fieldValue(bean: productStockInstance, field: 'lot')}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="expiredDate"><g:message code="purchase.expiredDate" default="Expired Date" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productStockInstance, field: 'expiredDate', 'errors')}">
                                    <g:datePicker id="expiredDate" name="expiredDate" precision="day" noSelection="['':'']" years="${2011..2050}" value="${productStockInstance?.expiredDate}" />
                                </td>
                            </tr>
                            
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'update', 'default': 'Update')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
