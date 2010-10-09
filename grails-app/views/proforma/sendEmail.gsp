
<%@ page import="com.vitaflo.innova.Proforma" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title><g:message code="proforma.send" default="Send Proforma" /></title>
  </head>
  <body>
    <div class="nav">
      <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
      <span class="menuButton"><g:link class="list" action="list"><g:message code="proforma.list" default="Proforma List" /></g:link></span>
      <span class="menuButton"><g:link class="create" action="create"><g:message code="proforma.new" default="New Proforma" /></g:link></span>
    </div>
    <div class="body">
      <h1><g:message code="proforma.send" default="Send Proforma" /></h1>
      <g:if test="${flash.message}">
        <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
      </g:if>
      <g:hasErrors>
        <div class="errors">
          <g:renderErrors bean="${proformaInstance}" as="list" />
        </div>
      </g:hasErrors>
      <g:form>
        <g:hiddenField name="id" value="${proformaInstance?.id}" />
        <div class="dialog">
          <table>
            <tbody>
              <tr class="prop">
                <td valign="baseline" class="name" style="vertical-align:middle;"><g:message code="proforma.clientEmail" default="Client email" />:</td>
            <td valign="baseline" style="vertical-align:middle;" class="value ${hasErrors(field: 'clientEmail', 'errors')}">
            <g:textField name="clientEmail" size="40" value="${clientEmail}"/>
            </td>
            <td>
              <div class="buttons">
                <span class="button"><g:actionSubmit class="edit" action="sendProformaEmail" value="${message(code: 'send', 'default': 'send')}" /></span>
              </div>
            </td>
            </tr>
            </tbody>
          </table>
        </div>
        <div class="dialog">
          <table border="1" style="margin-top: 5px;">
            <tbody>
              <tr>
                <td colspan="2"><img src="${resource(dir:'images',file:'innovative.gif')}" alt="Innovative" /></td>
              </tr>
              <tr>
                <td colspan="2" style="text-align:right">Montevideo,<g:formatDate date="${proformaInstance?.createdAt}" format="yyyy-MM-dd HH:mm:ss"/></td>
            </tr>

            <tr>
              <td style="vertical-align:middle">
                INNOVATIVE MEDICINES SA<br/>
                <label>Dirección </label>
                Juan C. Gomez 1445 Ap. 505<br/>
                <label>Código Postal </label>
                11100, Montevideo, Uruguay<br/>
                <label>Tel/Fax </label>
                (598 2) 917 0953<br/>
              </td>
              <td>
                <b>${proformaInstance?.client?.name}</b></b><br />
                <b>${proformaInstance?.client?.address}</b><br/>
                <b>${proformaInstance?.client?.phone}</b><br/>
                <b>${proformaInstance?.client?.email}</b><br/></b>
            <g:if test="${proformaInstance?.patient}">
              <label class="name"><g:message code="proforma.patient" default="Patient" /></label>
              <br/>
${proformaInstance?.patient?.firstName}, ${proformaInstance?.patient?.lastName}<br/>
            </g:if>
            </td>
            </tr>

          </table>
        </div>

        <h4><g:message code="proforma.number"/> ${proformaInstance?.id}</h4>
        <g:if test="${proformaInstance?.details?.size()> 0}">
          <div id="detailListPanel" class="list">
            <table style="margin-top: 5px;" border="1">
              <thead>
                <tr>

                  <th><g:message code="proformaDetail.product" default="Product" /></th>

              <th><g:message code="proformaDetail.quantity" default="Quantity" /></th>

              <th><g:message code="product.price" default="Price" /></th>

              <th><g:message code="proformaDetail.total" default="Total" /></th>
              </tr>
              </thead>
              <tbody>
              <g:each in="${proformaInstance.details}" status="i" var="proformaDetail">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                  <td>${fieldValue(bean:proformaDetail, field: "productName")}</td>

                  <td>${fieldValue(bean:proformaDetail, field: "quantity")}</td>

                  <td class="currencyValue"><g:formatNumber number="${proformaDetail?.price}" format="U\$S 0.00"/></td>

                <td class="currencyValue"><g:formatNumber number="${proformaDetail?.total}" format="U\$S 0.00"/></td>
                </tr>
              </g:each>
              <g:set var="detailsSize" value="${proformaInstance.details.size()}" />
              <tr class="${(detailsSize % 2) == 0?'odd':'even'}" style="border-top:1px solid #ddd">
                <td colspan="3"><g:message code="proforma.totalproducts" default="Total Products" /></td>
              <td class="currencyValue"><g:formatNumber number="${totalDetails}" format="U\$S 0.00"/></td>
              </tr>
              <tr class="${((detailsSize+1) % 2) == 0?'odd':'even'}">
                <td colspan="3"><g:message code="proforma.courier" default="Courier" /></td>
              <td class="currencyValue"><g:formatNumber number="${proformaInstance?.courier}" format="U\$S 0.00"/></td>
              </tr>
              <g:if test="${discountAmount  > 0}">
                <tr class="${((detailsSize+2) % 2) == 0?'odd':'even'}">
                  <td colspan="3" style="color:red"><g:message code="proforma.discountAmount" default="Discount" /> <g:formatNumber number="${proformaInstance?.discount}" format="0.00"/> %</td>
                  <td class="currencyDiscountValue"><g:formatNumber number="${discountAmount}" format="U\$S 0.00"/></td>
                </tr>
              </g:if>
              <tr class="${((detailsSize+3) % 2) == 0?'odd':'even'}">
                <td colspan="2">&nbsp;</td>
                <td><b><g:message code="proforma.totalAmount" default="Total Amount" /></b></td>
                <td class="currencyValue"><b><g:formatNumber number="${totalAmount}" format="U\$S 0.00"/></b></td>
              </tr>
              </tbody>
            </table>
        </g:if>

        <br/>
        <p>US DOLLARS:
        <g:numToWords number="${totalAmount}" lang="en"/>
        (<g:numToWords number="${totalAmount}" lang="es"/>)<br/>
        Sales Terms/Condiciones: 100% advanced payment. 100% pago adelantado.<br/>

        a/c Innovative Medicines SA<br/>
        Account Number/Cuenta Nro: 6410<br/>
        Banco:Santander Uruguay (Swift BSCHUYMM)<br/>
        Corresponsal en dólares<br/>
        Bank of New York, NY (Swift IRVTUS3N)<br/>
        <ul>
          <li>Valid proforma for 30 days. Proforma válida por 30 días.</li>

          <li>No se entregarán productos sin constancia de transferencia o efectivo pago.</li>
        </ul>
        </p>
    </div>
  </g:form>
</div>
</body>
</html>
