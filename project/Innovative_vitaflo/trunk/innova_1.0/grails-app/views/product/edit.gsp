
<%@ page import="com.vitaflo.innova.Product" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="product.edit" default="Edit Product" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="product.list" default="Product List" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="product.new" default="New Product" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="product.edit" default="Edit Product" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${productInstance}">
            <div class="errors">
                <g:renderErrors bean="${productInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${productInstance?.id}" />
                <g:hiddenField name="version" value="${productInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="product.name" default="Name" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${productInstance?.name}" />

                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="product.comercialName" default="Comercial Name" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'comercialName', 'errors')}">
                                    <g:textField name="comercialName" value="${productInstance?.comercialName}" />

                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="presentation"><g:message code="product.presentation" default="Presentation" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'presentation', 'errors')}">
                                    <g:textField name="presentation" value="${fieldValue(bean: productInstance, field: 'presentation')}" />
                                    <g:select name="doseUnit" from="${com.vitaflo.innova.Product.UNIT_LIST}" value="${fieldValue(bean: productInstance, field: 'doseUnit')}" noSelection="['':'']"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="price"><g:message code="product.price" default="Price" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'price', 'errors')}">
                                    <g:textField name="price" value="${fieldValue(bean: productInstance, field: 'price')}" />

                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="supplier"><g:message code="product.supplier" default="Supplier" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'supplier', 'errors')}">
                                    <g:select name="supplier.id" from="${com.vitaflo.innova.Supplier.list()}" optionKey="id" value="${productInstance?.supplier?.id}"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="drug"><g:message code="product.drug" default="Drug" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'drug', 'errors')}">
                                    <g:select name="drug.id" from="${com.vitaflo.innova.Drug.list()}" optionKey="id" value="${productInstance?.drug?.id}"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="product.description" default="Description" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" value="${productInstance?.description}" rows="7" cols="40"/>

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
