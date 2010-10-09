<div class="dialog">
    <table style="margin-top: 5px;">
        <tbody>
          <tr class="prop">
                <td valign="top" class="name">
                    <label for="invoices"><g:message code="purchase.invoices.add.label" default="Invoices" />:</label>
                </td>
          </tr>
          <tr class="prop">
              <td valign="top" class="value ${hasErrors(bean: purchaseInstance, field: 'invoices', 'errors')}">
                  <g:select name="invoiceSelected" from="${com.vitaflo.innova.Invoice.findAllByPurchaseIsNull()}" optionValue="viewPurchase" optionKey="id" value="${invoiceSelected}" />
              </td>
          </tr>
          <tr class="prop">
                <td valign="middle">
                   <span class="button"><g:submitButton class="add" name="addInvoice" onclick="submitAddInvoice()" value="${message(code: 'add', 'default': 'Add')}" /></span>
                </td>
          </tr>
        </tbody>
    </table>
</div>

<g:if test="${purchaseInstance?.invoices?.size()> 0}">

<g:hiddenField name="invoiceToRemove"/>
<div class="list">
    <table style="margin-top: 5px;">
        <thead>
            <tr>
                <th><g:message code="purchase.invoices" default="Invoice"/></th>

                <th><g:message code="invoice.proforma" default="Proforma"/></th>

                <th><g:message code="invoice.amount" default="Amount"/></th>

                <th><g:message code="invoice.status" default="Status"/></th>

                <th><g:message code="invoice.date" default="Date"/></th>

                <th>&nbsp;</th>

            </tr>
        </thead>
        <tbody>
        <g:each in="${purchaseInstance?.invoices}" status="i" var="invoiceInstance">
            <g:hiddenField name="invoicesCommand[${i}]" value="${invoiceInstance.id}"/>
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                <td>${fieldValue(bean: invoiceInstance, field: "number")}</td>

                <td>${fieldValue(bean: invoiceInstance, field: "proforma")}</td>

                <td class="currencyValue">${formatNumber(number: invoiceInstance.amount, format: "0.00")}</td>

                <td>${message(code: 'invoice.status.'+invoiceInstance.status)}</td>

                <td><g:formatDate date="${invoiceInstance.date}" format="dd/MM/yyyy"/></td>

                <td><g:submitButton class="remove" name="removeInvoice" onclick="submitRemoveInvoice(${invoiceInstance.id})" value="${message(code: 'remove', 'default': 'Remove')}" /></td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
</g:if>
