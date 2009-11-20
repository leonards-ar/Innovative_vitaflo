
<%@ page import="com.vitaflo.innova.Supplier" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="supplier.list" default="Supplier List" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
             <g:ifAnyGranted role="ROLE_ADMIN">
              <span class="menuButton"><g:link class="create" action="create"><g:message code="supplier.new" default="New Supplier" /></g:link></span>
             </g:ifAnyGranted>
        </div>
        <div class="body">
            <h1><g:message code="supplier.list" default="Supplier List" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                                                
                   	    <g:sortableColumn property="name" title="Name" titleKey="supplier.name" />
                                                
                   	    <g:sortableColumn property="contact" title="Contact" titleKey="supplier.contact" />
                        
                   	    <g:sortableColumn property="phone" title="Phone" titleKey="supplier.phone" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${supplierInstanceList}" status="i" var="supplierInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                                
                            <td><g:link action="show" id="${supplierInstance.id}">${fieldValue(bean: supplierInstance, field: "name")}</g:link></td>
                                                
                            <td>${fieldValue(bean: supplierInstance, field: "contact")}</td>
                        
                            <td>${fieldValue(bean: supplierInstance, field: "phone")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${supplierInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
