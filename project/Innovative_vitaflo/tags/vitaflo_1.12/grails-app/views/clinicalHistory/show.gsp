        
<%@ page import="com.vitaflo.innova.ClinicalHistory" defaultCodec="none" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="clinicalHistory.show" default="Show ClinicalHistory" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="patient" controller="patient" action="list"><g:message code="patients" default="Patients" /></g:link></span>
            <span class="menuButton"><g:link class="list" action="list" id="${clinicalHistoryInstance?.patient?.id}"><g:message code="clinicalHistory.list" default="ClinicalHistory List" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create" id="${clinicalHistoryInstance?.patient?.id}"><g:message code="clinicalHistory.new" default="New ClinicalHistory" /></g:link></span>
        </div>
        <div>
            <h1><g:message code="clinicalHistory.show" default="Show ClinicalHistory" /></h1>
            <h1>${clinicalHistoryInstance?.patient?.lastName}, ${clinicalHistoryInstance?.patient?.firstName}</h1>

            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:form>
                <g:hiddenField name="id" value="${clinicalHistoryInstance?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="clinicalHistory.date" default="Date" />:</td>
                                
                                <td valign="top" class="value"><g:formatDate date="${clinicalHistoryInstance?.date}" format="dd/MM/yyyy" /></td>
                                
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="clinicalHistory.title" default="Title" />:</td>

                                <td valign="top" class="value">${clinicalHistoryInstance?.title}</td>

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
                                    LinkUpload="false"
                                    ForcePasteAsPlainText="true"
                                    ToolbarStartExpanded="false"/>
                                <fckeditor:editor
                                    name="description"
                                    value="${clinicalHistoryInstance?.description}"
                                    width="85%"
                                    height="350"
                                    toolbar="Default"
                                    fileBrowser="default">
                                    ${clinicalHistoryInstance?.description.decodeHTML()}
                                </fckeditor:editor>
                                </td>
                          </tr>

                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'edit', 'default': 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'delete', 'default': 'Delete')}" onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
