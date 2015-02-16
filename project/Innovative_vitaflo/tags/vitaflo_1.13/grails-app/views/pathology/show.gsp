
<%@ page import="com.vitaflo.innova.Pathology" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="pathology.show" default="Show Pathology" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="pathology.list" default="Pathology List" /></g:link></span>
            <g:ifAnyGranted role="ROLE_ADMIN">
              <span class="menuButton"><g:link class="create" action="create"><g:message code="pathology.new" default="New Pathology" /></g:link></span>
            </g:ifAnyGranted>
        </div>
        <div class="body">
            <h1><g:message code="pathology.show" default="Show Pathology" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:form>
                <g:hiddenField name="id" value="${pathologyInstance?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="pathology.name" default="Name" />:</td>
                                
                                <td valign="top" class="value">${pathologyInstance?.name}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="pathology.minDose" default="Min Dose" />:</td>
                                
                                <td valign="top" class="value">${formatNumber(number:pathologyInstance?.minDose, format:"0.00")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="pathology.maxDose" default="Max Dose" />:</td>
                                
                                <td valign="top" class="value">${formatNumber(number:pathologyInstance?.maxDose, format:"0.00")}</td>
                                
                            </tr>
                            
                        </tbody>
                    </table>
                </div>
                <g:ifAnyGranted role="ROLE_ADMIN">                
	                <div class="buttons">
	                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'edit', 'default': 'Edit')}" /></span>
	                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'delete', 'default': 'Delete')}" onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}');" /></span>
	                </div>
                </g:ifAnyGranted>
            </g:form>
        </div>
    </body>
</html>
