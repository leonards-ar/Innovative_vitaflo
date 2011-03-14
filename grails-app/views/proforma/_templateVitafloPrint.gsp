
<%@ page import="com.vitaflo.innova.Proforma" %>
<html>
  <head>
    <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
    <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
    <link rel="stylesheet" href="${createLinkTo(dir:'css',file:grailsApplication.config.application.cssFile)}" type="text/css" media="screen" charset="utf-8">
        <style type="text/css">
          @media print {
            .print {
            display:none}
            }
          }
          </style>

          <g:javascript library="application" />
          <title><g:message code="proforma.print" default="Print Proforma" /></title>
  </head>
  <body>
    <div class="body">
      <div class="dialog">
        <table border="1" style="margin-top: 5px;">
          <tbody>
            <tr>
              <td colspan="2"><img src="${resource(dir:'images',file:grailsApplication.config.application.logoFile)}" alt="${grailsApplication.config.application.name}" /></td>
            </tr>
            <tr>
      <td  style="vertical-align: middle;text-align: right">Buenos Aires, <g:formatDate
          date="${proformaInstance?.createdAt}" format="yyyy-MM-dd HH:mm:ss" /></td>
      </tr>
      <tr>
      <td>
       <table>
        <tbody>
        <tr class="prop">

        <g:if test="${printAction=='preview'}">
        <g:form url="[controller:'proforma',action:'printProforma']">
          <g:hiddenField name="id" value="${proformaInstance?.id}" />
          <td valign="baseline" class="name" style="vertical-align: middle;">
            <table>
            <tr>
	            <td>
			          <g:textField name="line1" size="40" value="${line1}" /><br/>
			          <g:textField name="line2" size="40" value="${line2}" /><br/>
			          <g:textField name="line3" size="40" value="${line3}" />
		          </td>
		          <td valign="baseline" class="name" style="vertical-align: middle;">
					      <span class="button"><g:submitButton name="printProforma" class="print" value="${message(code: 'preview', 'default': 'Preview')}" /></span>
              </td>
          </tr>
      </table>
      </td>
    </g:form>	          
          
        </g:if>
        <g:else>
          <td valign="baseline" class="name" style="vertical-align: middle;">
          ${line1}<br/>
          ${line2}<br/>
          ${line3}
         </td>
        </g:else>           
          </tr>
         </tbody>
       </table>           
      </td>      
      </tr>
  </table>
  </div>

  <h4 style="text-align:center"><g:message code="proforma.number" /> ${proformaInstance?.id}
  </h4>
  <g:if test="${proformaInstance?.details?.size()> 0}">
    <div id="detailListPanel" class="list">
    <table style="margin-top: 5px;" border="1">
      <thead>
        <tr>

          <th><g:message code="proformaDetail.product" default="Product" /></th>

          <th><g:message code="proformaDetail.quantity"
            default="Quantity" /></th>

          <th><g:message code="product.price" default="Price" /></th>

          <th><g:message code="proformaDetail.total" default="Total" /></th>
        </tr>
      </thead>
      <tbody>
        <g:each in="${proformaInstance.details}" status="i"
          var="proformaDetail">
          <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

            <td>
            ${fieldValue(bean:proformaDetail, field: "productName")}
            </td>

            <td>
            ${fieldValue(bean:proformaDetail, field: "quantity")}
            </td>

            <td class="currencyValue"><g:formatNumber
              number="${(proformaDetail?.price*((proformaInstance?.client?.ivaResponsibleType == 'inscripto')?(1/1.21) : 1))}" format="U\$S 0.00" /></td>

            <td class="currencyValue"><g:formatNumber
              number="${(proformaDetail?.total*((proformaInstance?.client?.ivaResponsibleType == 'inscripto')?(1/1.21) : 1))}" format="U\$S 0.00" /></td>
          </tr>
        </g:each>
        <g:set var="detailsSize" value="${proformaInstance.details.size()}" />
        <tr class="${(detailsSize % 2) == 0?'odd':'even'}" style="border-top: 1px solid #ddd">
          <td colspan="3"><g:message code="proforma.totalproducts" default="Total Products" /></td>
          <td class="currencyValue"><g:formatNumber number="${(totalDetails*((proformaInstance?.client?.ivaResponsibleType == 'inscripto')?(1/1.21) : 1))}" format="U\$S 0.00" /></td>
        </tr>
        <g:if test="${proformaInstance?.courier  > 0}">
          <tr class="${((detailsSize+1) % 2) == 0?'odd':'even'}">
            <td colspan="3"><g:message code="proforma.courier" default="Courier" /></td>
            <td class="currencyValue"><g:formatNumber number="${(proformaInstance?.courier*((proformaInstance?.client?.ivaResponsibleType == 'inscripto')?(1/1.21) : 1))}" format="U\$S 0.00"/></td>
          </tr>
        </g:if>
        <g:if test="${discountAmount  > 0}">
          <tr class="${((detailsSize+2) % 2) == 0?'odd':'even'}">
            <td colspan="3" style="color: red"><g:message code="proforma.discountAmount" default="Discount" /> <g:formatNumber  number="${proformaInstance?.discount}" format="0.00" /> %</td>
            <td class="currencyDiscountValue"><g:formatNumber number="${discountAmount}" format="0.00" />%</td>
          </tr>
        </g:if>
        <g:if test="${proformaInstance?.client?.ivaResponsibleType == 'inscripto'}">
          <tr class="${((detailsSize+3) % 2) == 0?'odd':'even'}">
            <td colspan="3"><g:message code="proforma.iva" default="IVA" args="${ [21] }"/></td>
            <td style="text-align: right"><g:formatNumber number="${(totalAmount*0.21)}" format="U\$S 0.00" /></td>
          </tr>
       </g:if>
        <tr class="${((detailsSize+4) % 2) == 0?'odd':'even'}">
          <td colspan="3"><g:message code="proforma.totalAmount" default="Total Amount" /></td>
          <td style="text-align: right"><g:formatNumber number="${totalAmount}" format="U\$S 0.00" /></td>
        </tr>
        <tr class="${((detailsSize+5) % 2) == 0?'odd':'even'}">
          <td colspan="3"><b><g:message code="proforma.totalAmount" default="Total Amount" /></b></td>
          <td style="text-align: right"><b><g:formatNumber number="${(totalAmount*proformaInstance?.dollarValue)}" format="\$ 0.00" /></b></td>
        </tr>
      </tbody>
    </table>
  </g:if>

  <br />
  <p>Importe expresado en d&oacute;lares estadounidenses <g:formatNumber number="${totalAmount}" format="U\$S 0.00" /> a fines impositivos<br/>
     se expresan en pesos <g:formatNumber number="${(totalAmount*proformaInstance?.dollarValue)}" format="\$ 0.00" /> seg&uacute;n tipo de cambio
     libre vendedor BNA del d&iacute;a <g:formatDate date="${proformaInstance?.createdAt}" format="dd/MM/yyyy"/>
     de <g:formatNumber number="${proformaInstance?.dollarValue}" format="0.00" />.
     <br/><br/>
     <b>Importe en pesos:</b> <g:numToWords number="${formatNumber(number:totalAmount*proformaInstance?.dollarValue, format:'0.00')}" lang="es"/><br/>
     <b>Condiciones de pago:</b> 100% pago a 20 d&iacute;as.<br/><br/>
      
    Banco: Galicia Sucursal.<br/>
    N&deg; de cuenta: <b>4266-6 127-9</b><br />
    CBU: <b>0070127920000004266695</b><br/><br/>
    </p>
    <table border="0">
      <tbody>
        <tr>
          <td>
            <p>
               Vitaflo Buenos Aires SA<br/>
               Cabello 3627 (5&deg; A)<br/>
               CP 1425 Ciudad de Buenos Aires
            </p>
          </td>
          <td>
            <p>
              Tel/Fax: 4807-0999/4809-0549<br/>
              E-mail: info@vitaflo-latam.com<br/>
              Web: www.vitaflo-latam.com 
            </p>
          </td>
        </tr>
      </tbody>
    </table>

  </div>
  <br/></br>
  <g:if test="${printAction!='preview'}">
    <input type="button" class="print" onclick="window.print()" value="${message(code: 'print', 'default': 'Print')}" />  
  </g:if>
  <input type="button" class="print" onclick="window.close()" value="${message(code: 'close', 'default': 'Close')}" />

</div>
</body>
</html>
