<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<div>
  <h1><g:message code="invoice.show" default="Show Invoice" /></h1>


  <table>
    <tbody>
      <tr class="prop">
        <td valign="top" class="name"><g:message code="invoice.number" default="Number" />:</td>

    <td valign="top" class="value">${fieldValue(bean: invoiceInstance, field: "number")}</td>
    </tr>

    <tr class="prop">
      <td valign="top" class="name"><g:message code="invoice.proforma" default="Proforma" />:</td>

    <td valign="top" class="value">${invoiceInstance?.proforma?.encodeAsHTML()}</td>
    </tr>

    <tr class="prop">
      <td valign="top" class="name"><g:message code="invoice.date" default="Date" />:</td>

    <td valign="top" class="value"><g:formatDate date="${invoiceInstance?.date}" format="dd/MM/yyyy" /></td>
    </tr>

    <tr class="prop">
      <td valign="top" class="name"><g:message code="invoice.amount" default="Amount" />:</td>

    <td valign="top" class="value">${formatNumber(number: invoiceInstance.amount, format: "0.00")}</td>
    </tr>

    <tr class="prop">
      <td valign="top" class="name"><g:message code="invoice.status" default="Status" />:</td>

    <td valign="top" class="value">${message(code: 'invoice.status.'+invoiceInstance.status)}</td>
    </tr>

    <tr class="prop">
      <td valign="top" class="name"><g:message code="invoice.deliveryDate" default="Date of delivery" />:</td>

    <td valign="top" class="value"><g:formatDate date="${invoiceInstance?.deliveryDate}" format="dd/MM/yyyy" /></td>
    </tr>

    <tr class="prop">
      <td valign="top" class="name"><g:message code="invoice.createdAt" default="Created At" />:</td>

    <td valign="top" class="value"><g:formatDate date="${invoiceInstance?.createdAt}" format="dd/MM/yyyy" /></td>
    </tr>

    </tbody>
  </table>

  <g:if test="${invoiceInstance?.proforma?.details?.size()> 0}">
    <div id="detailListPanel">
      <table style="margin-top: 5px;">
        <thead>
          <tr>
            <th><g:message code="proformaDetail.product" default="Product" /></th>

        <th><g:message code="proformaDetail.quantity" default="Quantity" /></th>

        <th><g:message code="proformaDetail.lot" default="Batch Number" /></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${invoiceInstance.proforma.details}" status="i" var="proformaDetail">
          <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

            <td>${fieldValue(bean:proformaDetail, field: "productName")}</td>

            <td>${fieldValue(bean:proformaDetail, field: "quantity")}</td>

            <td>${fieldValue(bean:proformaDetail, field: "lot")}</td>
          </tr>
        </g:each>
        </tbody>
      </table>
    </div>
  </g:if>

</div>

