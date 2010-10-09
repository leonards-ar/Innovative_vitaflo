
<%@ page contentType="text/html" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html">
    <title><g:message code="proforma.notification" default="Proforma Notification" /></title>
  </head>
  <body>
    <div style="background: #fff;color: #333;font: 11px verdana, arial, helvetica, sans-serif;">
      <h3><g:message code="proforma.notification" default="Proforma Notification"/></h3>
      <div style="padding: 5px 0;">
        <table border="1" style="margin-top: 5px;">
          <tbody>
            <tr>
              <td colspan="2"><img src="${request.getScheme()}://${request.getServerName()}:${request.getServerPort()}${resource(dir:'images',file:grailsApplication.config.application.logoFile)}" alt="${grailsApplication.config.application.name}" /></td>
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
        <div id="detailListPanel" style="border-collapse: collapse;">
          <table style="margin-top: 5px;" border="1">
            <thead>
              <tr>

                <td style="background: #fff url(../images/skin/shadow.jpg);color: #666;font-size: 11px;font-weight: bold;line-height: 17px;padding: 2px 6px;">
            <g:message code="proformaDetail.product" default="Product" />
            </td>

            <td style="background: #fff url(../images/skin/shadow.jpg);color: #666;font-size: 11px;font-weight: bold;line-height: 17px;padding: 2px 6px;">
            <g:message code="proformaDetail.quantity" default="Quantity" />
            </td>

            <td style="background: #fff url(../images/skin/shadow.jpg);color: #666;font-size: 11px;font-weight: bold;line-height: 17px;padding: 2px 6px;">
            <g:message code="product.price" default="Price" />
            </td>

            <td style="background: #fff url(../images/skin/shadow.jpg);color: #666;font-size: 11px;font-weight: bold;line-height: 17px;padding: 2px 6px;">
            <g:message code="proformaDetail.total" default="Total" />
            </td>
            </tr>
            </thead>
            <tbody>
            <g:each in="${proformaInstance.details}" status="i" var="proformaDetail">
              <tr style="${(i % 2) == 0 ? 'background: #f7f7f7;' : 'background: #fff;'}">

                <td>${fieldValue(bean:proformaDetail, field: "productName")}</td>

                <td>${fieldValue(bean:proformaDetail, field: "quantity")}</td>

                <td style="text-align:right"><g:formatNumber number="${proformaDetail?.price}" format="U\$S 0.00"/></td>

              <td style="text-align:right"><g:formatNumber number="${proformaDetail?.total}" format="U\$S 0.00"/></td>
              </tr>
            </g:each>
            <g:set var="detailsSize" value="${proformaInstance.details.size()}" />
            <tr style="${(detailsSize % 2) == 0?'background: #f7f7f7;':'background: #fff;'}" style="border-top:1px solid #ddd">
              <td colspan="3"><g:message code="proforma.totalproducts" default="Total Products" /></td>
            <td style="text-align:right"><g:formatNumber number="${totalDetails}" format="U\$S 0.00"/></td>
            </tr>
            <tr style="${((detailsSize+1) % 2) == 0?'background: #f7f7f7;':'background: #fff;'}">
              <td colspan="3"><g:message code="proforma.courier" default="Courier" /></td>
            <td style="text-align:right"><g:formatNumber number="${proformaInstance?.courier}" format="U\$S 0.00"/></td>
            </tr>
            <g:if test="${discountAmount  > 0}">
              <tr style="${((detailsSize+2) % 2) == 0?'background: #f7f7f7;':'background: #fff;'}">
                <td colspan="3" style="color:red"><g:message code="proforma.discountAmount" default="Discount" /> <g:formatNumber number="${proformaInstance?.discount}" format="0.00"/> %</td>
              <td style="color:red;text-align:right"><g:formatNumber number="${discountAmount}" format="U\$S 0.00"/></td>
              </tr>
            </g:if>
            <tr style="${((detailsSize+3) % 2) == 0?'background: #f7f7f7;':'background: #fff;'}">
              <td colspan="2">&nbsp;</td>
              <td><b><g:message code="proforma.totalAmount" default="Total Amount" /></b></td>
              <td style="text-align:right"><b><g:formatNumber number="${totalAmount}" format="U\$S 0.00"/></b></td>
            </tr>
            </tbody>
          </table>
      </g:if>

      <br/>
      <p>US DOLLARS:
      <g:numToWords number="${totalAmount}" lang="en"/>
      (<g:numToWords number="${totalAmount}" lang="es"/>)<br/>
      <g:if test="${proformaInstance.patient?.country?.code == 'BR' || proformaInstance.client?.country?.code == 'BR'}">
        Sales Condition: Letter of credit at sight, irrevocable, confirmed  and  issued by a first class bank. <br/>
        Incoterm: Incoterms CPT. (Paraná, Brazil).<br/><br/>
        Manufacturer: APOTEKET AB <br/>
        Distributer: INNOVATIVE MEDICINES SA<br/>
        Juan C. Gomez 1445 Ap. 505<br/>
        Tel./Fax: (+ 598 2) 917 0953<br/>
        Montevideo - Uruguay <br/><br/>
        Port of Loading/Airport of Departure: Any port of Sweden. <br/>
        Port of Discharge/Airport of destination: ${proformaInstance?.destinationAirport} <br/><br/>
        NCM 30.04.90.99<br/><br/>
      </g:if>
      <g:else>
        Sales Terms/Condiciones: 100% advanced payment. 100% pago adelantado.<br/>
      </g:else>

      a/c Innovative Medicines SA<br/>
      Account Number/Cuenta Nro: 6410<br/>
      Banco:Santander Uruguay (Swift BSCHUYMM)<br/>
      Corresponsal en dólares<br/>
      Bank of New York, NY (Swift IRVTUS3N)<br/>
      <ul>
        <li>Valid proforma for 30 days. Proforma válida por 30 días.</li>

        <li>No se entregarán productos sin constancia de transferencia o efectivo pago.</li>
      </ul>
      <g:if test="${proformaInstance.patient?.country?.code == 'BR' || proformaInstance.client?.country?.code == 'BR'}">
        Peso Líquido, 60 caps = 15,84 gr (Vary 5 % +/-)</br>
      </g:if>
    </p>
  </div>
</div>
</body>
</html>
