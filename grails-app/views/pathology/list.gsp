
<%@ page import="com.vitaflo.innova.Pathology" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="pathology.list" default="Pathology List" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <g:ifAnyGranted role="ROLE_ADMIN">
              <span class="menuButton"><g:link class="create" action="create"><g:message code="pathology.new" default="New Pathology" /></g:link></span>
            </g:ifAnyGranted>
        </div>
        <div class="body">
            <h1><g:message code="pathology.list" default="Pathology List" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	    <g:sortableColumn property="name" title="Name" titleKey="pathology.name" />
                        
                   	    <g:sortableColumn property="minDose" title="Min Dose" titleKey="pathology.minDose" />
                        
                   	    <g:sortableColumn property="maxDose" title="Max Dose" titleKey="pathology.maxDose" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${pathologyInstanceList}" status="i" var="pathologyInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${pathologyInstance.id}">${pathologyInstance?.name}</g:link></td>
                        
                            <td>${formatNumber(number:pathologyInstance?.minDose, format:"0.00")}</td>
                        
                            <td>${formatNumber(number:pathologyInstance?.maxDose, format:"0.00")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${pathologyInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
