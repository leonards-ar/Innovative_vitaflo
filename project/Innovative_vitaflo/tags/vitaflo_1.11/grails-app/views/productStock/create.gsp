
<%@ page import="com.vitaflo.innova.ProductStock" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="productstock.new" default="Create Product Stock" /></title>
        <g:javascript library="prototype" />
        <g:javascript>
          function updatePrice(e) {
            var price = e.responseText.evalJSON().price;
            $('price').value=price;
          }
        </g:javascript>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="productstock.list" default="Product List" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="product.new" default="Create Product" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${productStockInstance}">
            <div class="errors">
                <g:renderErrors bean="${productStockInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="product.name" default="Product" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productStockInstance, field: 'name', 'errors')}">
                                  <g:select name="product.id" from="${com.vitaflo.innova.Product.list([sort:'name', order:'asc'])}" optionKey="id"
                                  value="${productStockInstance?.product?.id}" noSelection="['':'Seleccione...']" onchange="${remoteFunction(controller:'productStock', action:'updatePrice',onSuccess:'updatePrice(e)', params:'\'productId=\'  + this.value')}"/>

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
                                    <label for="price"><g:message code="product.price" default="Price" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productStockInstance, field: 'price', 'errors')}">
                                    <g:textField name="price" value="${productStockInstance?.price}" />

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
                                    <g:datePicker id="x" name="expiredDate" precision="day" noSelection="['':'']" value="${productStockInstance?.expiredDate}" />
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
