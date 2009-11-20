
<%@ page import="com.vitaflo.innova.Purchase" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="purchase.create" default="Create Purchase" /></title>
        <g:javascript library="prototype" />
        <script type="text/javascript" language="JavaScript">
          function submitRemoveInvoice(index)
          {
            document.purchaseForm.action = 'removeInvoiceForCreate';
            document.purchaseForm.invoiceToRemove.value= index;
            document.purchaseForm.submit();
          }

          function submitAddInvoice()
          {
            document.purchaseForm.action = 'addInvoiceForCreate';
            document.purchaseForm.submit();
          }

          function updateExpireDateValue(e)
          {
            var auxDate = new Date(e.responseText)
            document.purchaseForm.expireDate_day.value = auxDate.getDate();
            document.purchaseForm.expireDate_month.value =  auxDate.getMonth()+1;
            document.purchaseForm.expireDate_year.value = auxDate.getFullYear();
          }

        </script>

    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="purchase.list" default="Purchase List" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="purchase.create" default="Create Purchase" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${purchaseInstance}">
            <div class="errors">
                <g:renderErrors bean="${purchaseInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form name="purchaseForm" action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="codeNumber"><g:message code="purchase.codeNumber" default="Code Number" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: purchaseInstance, field: 'codeNumber', 'errors')}">
                                    <g:textField name="codeNumber" value="${fieldValue(bean: purchaseInstance, field: 'codeNumber')}" />

                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="supplier"><g:message code="purchase.supplier" default="Supplier" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: purchaseInstance, field: 'supplier', 'errors')}">
                                    <g:select name="supplier.id" from="${com.vitaflo.innova.Supplier.list()}"
                                              noSelection="${['null':message(code:'noselect')]}"
                                              optionKey="id" value="${purchaseInstance?.supplier?.id}"
                                              onchange="${remoteFunction(controller:'purchase', action:'updateExpireDate',onSuccess:'updateExpireDateValue(e)', 
                                                    params:'\'supplierId=\'+ this.value+\'&creationDate_day=\'+document.purchaseForm.creationDate_day.value+\'&creationDate_month=\'+document.purchaseForm.creationDate_month.value+\'&creationDate_year=\'+document.purchaseForm.creationDate_year.value')}"
                                              />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="creationDate"><g:message code="purchase.creationDate" default="Date of issue" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: purchaseInstance, field: 'creationDate', 'errors')}">
                                    <g:datePicker id="creationDate" precision="day" name="creationDate" value="${purchaseInstance?.creationDate}"  />

                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="expireDate"><g:message code="purchase.expireDate" default="Expire Date" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: purchaseInstance, field: 'expireDate', 'errors')}">
                                    <g:datePicker precision="day" name="expireDate" value="${purchaseInstance?.expireDate}"  />

                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="amount"><g:message code="purchase.amount" default="Amount" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: purchaseInstance, field: 'amount', 'errors')}">
                                    <g:textField name="amount" value="${fieldValue(bean: purchaseInstance, field: 'amount')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="status"><g:message code="purchase.status" default="Status" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: purchaseInstance, field: 'status', 'errors')}">
                                    <g:select disabled="true" name="status" from="${purchaseInstance.constraints.status.inList}" value="${purchaseInstance.status}" valueMessagePrefix="purchase.status"  />

                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <g:render template="invoicePurchase" model="[purchaseInstance:purchaseInstance]"/>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'create', 'default': 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
