
<%@ page import="com.vitaflo.innova.Pathology" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="pathology.create" default="Create Pathology" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="pathology.list" default="Pathology List" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="pathology.create" default="Create Pathology" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${pathologyInstance}">
            <div class="errors">
                <g:renderErrors bean="${pathologyInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
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
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'create', 'default': 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
