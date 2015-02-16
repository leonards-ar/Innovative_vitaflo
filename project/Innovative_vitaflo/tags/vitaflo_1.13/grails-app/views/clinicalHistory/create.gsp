
<%@ page import="com.vitaflo.innova.ClinicalHistory" defaultCodec="none"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="clinicalHistory.create" default="Create Clinical History" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="patient" controller="patient" action="list"><g:message code="patients" default="Patients" /></g:link></span>
            <span class="menuButton"><g:link class="list" action="list" id="${clinicalHistoryInstance?.patient?.id}"><g:message code="clinicalHistory.list" default="ClinicalHistory List" /></g:link></span>
        </div>
        <div>
            <h1><g:message code="clinicalHistory.create" default="Create ClinicalHistory" /></h1>
            <h1>${clinicalHistoryInstance?.patient?.lastName}, ${clinicalHistoryInstance?.patient?.firstName}</h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${clinicalHistoryInstance}">
            <div class="errors">
                <g:renderErrors bean="${clinicalHistoryInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <g:hiddenField name="patient" value="${clinicalHistoryInstance?.patient?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="date"><g:message code="clinicalHistory.date" default="Date" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clinicalHistoryInstance, field: 'date', 'errors')}">
                                    <g:datePicker name="date" value="${clinicalHistoryInstance?.date}" precision="day" years="${1990..2020}" />

                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title"><g:message code="clinicalHistory.title" default="Title" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clinicalHistoryInstance, field: 'title', 'errors')}">
                                    <g:textField name="title" size="50" value="${clinicalHistoryInstance?.title}"/>

                                </td>
                            </tr>                        
                            <tr class="prop">
                                <td colspan="2" valign="top" class="value ${hasErrors(bean: clinicalHistoryInstance, field: 'description', 'errors')}">
                                    <!--g:textField name="description" value="${fieldValue(bean: clinicalHistoryInstance, field: 'description')}" /-->
                                    <fckeditor:config
                                            AutoDetectLanguage="false"
                                            ImageDlgHideLink="true"
                                            ImageDlgHideAdvanced="true"
                                            LinkDlgHideAdvanced="true"
                                            SourcePopup="true"
                                            LinkUpload="false"/>
                                    <fckeditor:editor
                                        name="description"
                                        value="${clinicalHistoryInstance?.description}"
                                        width="85%"
                                        height="350"
                                        toolbar="Default"
                                        fileBrowser="default">
                                        ${(clinicalHistoryInstance?.description)?clinicalHistoryInstance?.description.decodeHTML():""}
                                    </fckeditor:editor>

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
