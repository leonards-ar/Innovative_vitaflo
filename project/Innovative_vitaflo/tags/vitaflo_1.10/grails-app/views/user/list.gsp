
<%@ page import="com.vitaflo.innova.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="user.list" default="User List" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="user.new" default="New User" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="user.list" default="User List" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="username" title="Username" titleKey="user.username" />

                            <g:sortableColumn property="lastName" title="Last Name" titleKey="user.lastName" />

                   	    <g:sortableColumn property="firstName" title="First Name" titleKey="user.firstName" />
                            
                   	    
                        
                   	    <g:sortableColumn property="email" title="Email" titleKey="user.email" />
                        

                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${userInstanceList}" status="i" var="userInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "username")}</g:link></td>

                            <td>${fieldValue(bean: userInstance, field: "lastName")}</td>

                            <td>${fieldValue(bean: userInstance, field: "firstName")}</td>


                        
                            <td>${fieldValue(bean: userInstance, field: "email")}</td>
                        
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${userInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
