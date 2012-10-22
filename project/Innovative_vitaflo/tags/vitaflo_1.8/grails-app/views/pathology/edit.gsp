
<%@ page import="com.vitaflo.innova.Pathology" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="pathology.edit" default="Edit Pathology" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="pathology.list" default="Pathology List" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="pathology.new" default="New Pathology" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="pathology.edit" default="Edit Pathology" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${pathologyInstance}">
            <div class="errors">
                <g:renderErrors bean="${pathologyInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${pathologyInstance?.id}" />
                <g:hiddenField name="version" value="${pathologyInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="pathology.name" default="Name" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pathologyInstance, field: 'name', 'errors')}">
                                    <g:textField size="50" name="name" value="${pathologyInstance?.name}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="minDose"><g:message code="pathology.minDose" default="Min Dose" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pathologyInstance, field: 'minDose', 'errors')}">
                                    <g:textField name="minDose" value="${formatNumber(number:pathologyInstance?.minDose, format:'0.00')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="maxDose"><g:message code="pathology.maxDose" default="Max Dose" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pathologyInstance, field: 'maxDose', 'errors')}">
                                    <g:textField name="maxDose" value="${formatNumber(number:pathologyInstance?.maxDose, format:'0.00')}" />

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
