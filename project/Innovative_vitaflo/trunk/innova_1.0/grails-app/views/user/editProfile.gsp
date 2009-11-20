
<%@ page import="com.vitaflo.innova.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="user.edit" default="Edit User" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
        </div>
        <div class="body">
            <h1><g:message code="user.edit" default="Edit User" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${userInstance}">
            <div class="errors">
                <g:renderErrors bean="${userInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${userInstance?.id}" />
                <g:hiddenField name="version" value="${userInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="firstName"><g:message code="user.firstName" default="First Name" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'firstName', 'errors')}">
                                    <g:textField name="firstName" value="${userInstance?.firstName}" />

                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastName"><g:message code="user.lastName" default="Last Name" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'lastName', 'errors')}">
                                    <g:textField name="lastName" value="${userInstance?.lastName}" />

                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="username"><g:message code="user.username" default="Username" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'username', 'errors')}">
                                    <g:textField name="username" value="${userInstance?.username}" />

                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password"><g:message code="user.password" default="Password" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'password', 'errors')}">
                                    <g:passwordField name="passwd" size="40" value="${userInstance?.passwd}" />

                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="user.email" default="Email" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${userInstance?.email}" />

                                </td>
                            </tr>

                            <g:ifAllGranted role="ROLE_ADMIN">
                              <tr class="prop">
                                  <td valign="top" class="name">
                                      <label for="countries"><g:message code="user.countries" default="Countries" />:</label>
                                  </td>
                                  <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'countries', 'errors')}">
                                      <g:select name="selectedCountries"
                                            from="${com.vitaflo.innova.Country.list()}"
                                            size="5" multiple="yes" optionKey="id"
                                            value="${userInstance?.countries?.id}" />
                                  </td>
                              </tr>
                            </g:ifAllGranted>

                            <g:ifAllGranted role="ROLE_ADMIN">
                              <tr class="prop">
                                  <td valign="top" class="name">
                                      <label for="authorities"><g:message code="user.roles" default="Roles" />:</label>
                                  </td>
                                  <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'authorities', 'errors')}">
                                      <g:select name="selectedAuthorities"
                                            from="${com.vitaflo.innova.Role.list()}"
                                            size="3" multiple="yes" optionKey="id"
                                            value="${userInstance?.authorities?.id}" />
                                  </td>
                              </tr>
                            </g:ifAllGranted>

                            <g:if test="${userInstance.username != loggedInUserInfo(field:'username')}">
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastName"><g:message code="user.enabled" default="Enabled" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'lastName', 'errors')}">
                                    <g:checkBox name="enabled" value="${userInstance?.enabled}" />
                                </td>
                            </tr>
                            </g:if>

                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="updateProfile" value="${message(code: 'update', 'default': 'Update')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
