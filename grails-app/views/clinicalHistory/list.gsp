
<%@ page import="com.vitaflo.innova.ClinicalHistory" defaultCodec="none"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="clinicalHistory.list" default="ClinicalHistory List" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="patient" controller="patient" action="list"><g:message code="patients" default="Patients" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create" id="${patient}"><g:message code="clinicalHistory.new" default="New ClinicalHistory" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="clinicalHistory.list" default="ClinicalHistory List" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <h1>${patientName} </h1>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="date" title="Date" titleKey="clinicalHistory.date" />

                            <th><g:message code="clinicalHistory.title" default="Title" /></th>

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${clinicalHistoryInstanceList}" status="i" var="clinicalHistoryInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${clinicalHistoryInstance.id}" params="${[patient:patient]}"><g:formatDate date="${clinicalHistoryInstance.date}" format="dd/MM/yyyy"/></g:link></td>
                        
                            <td>${clinicalHistoryInstance?.title}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${clinicalHistoryInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
