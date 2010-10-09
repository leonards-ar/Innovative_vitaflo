
<%@ page import="com.vitaflo.innova.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="user.show" default="Show User" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="user.list" default="User List" /></g:link></span>
            <g:ifAnyGranted role="ROLE_ADMIN">
              <span class="menuButton"><g:link class="create" action="create"><g:message code="user.new" default="New User" /></g:link></span>
            </g:ifAnyGranted>
        </div>
        <div class="body">
            <h1><g:message code="user.show" default="Show User" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:form>
                <g:hiddenField name="id" value="${userInstance?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>                  

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="user.firstName" default="First Name" />:</td>

                                <td valign="top" class="value">${fieldValue(bean: userInstance, field: "firstName")}</td>

                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="user.lastName" default="Last Name" />:</td>

                                <td valign="top" class="value">${fieldValue(bean: userInstance, field: "lastName")}</td>

                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="user.username" default="Username" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: userInstance, field: "username")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="user.email" default="Email" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: userInstance, field: "email")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="user.countries" default="Countries" />:</td>
                                
                                <td  valign="top" style="text-align: left;" class="value">
                                    <ul>
                                    <g:each in="${userInstance?.countries?.sort{it.name}}" var="countryInstance">
                                        <li>${countryInstance.encodeAsHTML()}</li>
                                    </g:each>
                                    </ul>
                                </td>
                                
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="user.roles" default="Roles" />:</td>

                                <td  valign="top" style="text-align: left;" class="value">
                                    <ul>
                                    <g:each in="${userInstance?.authorities}" var="roleInstance">
                                        <li>${roleInstance.encodeAsHTML()}</li>
                                    </g:each>
                                    </ul>
                                </td>

                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="user.enabled" default="Enabled" />:</td>
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "enabled")}</td>
				</tr>
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'edit', 'default': 'Edit')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
