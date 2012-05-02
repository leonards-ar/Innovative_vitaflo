<div>
  <h1><g:message code="purchase.show" default="Show Purchase" /></h1>

    <table>
      <tbody>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="purchase.codeNumber" default="Code Number" />:</td>

      <td valign="top" class="value">${fieldValue(bean: purchaseInstance, field: "codeNumber")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="purchase.supplier" default="Supplier" />:</td>

      <td valign="top" class="value">${purchaseInstance?.supplier?.encodeAsHTML()}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="purchase.creationDate" default="Date of issue" />:</td>

      <td valign="top" class="value"><g:formatDate format="dd/MM/yyyy" date="${purchaseInstance?.creationDate}" /></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="purchase.expireDate" default="Expire Date" />:</td>

      <td valign="top" class="value"><g:formatDate format="dd/MM/yyyy" date="${purchaseInstance?.expireDate}" /></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="purchase.amount" default="Amount" />:</td>

      <td valign="top" class="value"><g:formatNumber number="${purchaseInstance?.amount}" format="0.00"/></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="purchase.status" default="Status" />:</td>

      <td valign="top" class="value">${message(code: 'purchase.status.'+purchaseInstance?.status)}</td>

      </tr>
      </tbody>
    </table>

  <g:if test="${purchaseInstance?.invoices?.size()> 0}">
    <div>
      <table style="margin-top: 5px;">
        <thead>
          <tr>
        <g:sortableColumn property="number" title="Number" titleKey="purchase.invoices" />

        <th><g:message code="invoice.proforma" default="Proforma" /></th>

        <g:sortableColumn property="amount" title="Amount" titleKey="invoice.amount" />

        <g:sortableColumn property="status" title="Status" titleKey="invoice.status" />

        <g:sortableColumn property="date" title="Date" titleKey="invoice.date" />
        </tr>
        </thead>
        <tbody>
        <g:each in="${purchaseInstance?.invoices}" status="i" var="invoiceInstance">
          <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
            <td>${fieldValue(bean: invoiceInstance, field: "number")}</td>

            <td>${fieldValue(bean: invoiceInstance, field: "proforma")}</td>

            <td class="currencyValue">${formatNumber(number: invoiceInstance.amount, format: "0.00")}</td>

            <td>${message(code: 'invoice.status.'+invoiceInstance.status)}</td>

            <td><g:formatDate date="${invoiceInstance.date}" format="dd/MM/yyyy"/></td>
          </tr>
        </g:each>
        </tbody>
      </table>
    </div>
  </g:if>
</div>
