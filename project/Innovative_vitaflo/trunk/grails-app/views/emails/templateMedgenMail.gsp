
<%@ page contentType="text/html"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<title><g:message code="proforma.notification"
	default="Proforma Notification" /></title>
</head>
<body>
<div
	style="background: #fff; color: #333; font: 11px verdana, arial, helvetica, sans-serif;">
<h3><g:message code="proforma.notification"
	default="Proforma Notification" /></h3>
<div style="padding: 5px 0;">
<table border="1" style="margin-top: 5px;">
	<tbody>
		<tr>
			<td colspan="2"><img
				src="${request.getScheme()}://${request.getServerName()}:${request.getServerPort()}${resource(dir:'images',file:grailsApplication.config.application.logoFile)}"
				alt="${grailsApplication.config.application.name}" /></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: right">Buenos Aires, <g:formatDate
				date="${proformaInstance?.createdAt}" format="yyyy-MM-dd HH:mm:ss" /></td>
		</tr>

      <tr>
      <td>
       <table>
        <tbody>
          <tr style="padding: 5px;">
            <td valign="baseline" style="vertical-align: middle;text-align: left;width: 15%;white-space: nowrap;">
             ${line1}<br/>
             ${line2}<br/>
             ${line3}
           </td>
          </tr>
         </tbody>
       </table>           
      </td>      
      </tr>
</table>
</div>

<h4><g:message code="proforma.number" /> ${proformaInstance?.id}
</h4>
<g:if test="${proformaInstance?.details?.size()> 0}">
	<div id="detailListPanel" style="border-collapse: collapse;">
	<table style="margin-top: 5px;" border="1">
		<thead>
			<tr>

				<td
					style="background: #fff url(../images/skin/shadow.jpg); color: #666; font-size: 11px; font-weight: bold; line-height: 17px; padding: 2px 6px;">
				<g:message code="proformaDetail.product" default="Product" /></td>

				<td
					style="background: #fff url(../images/skin/shadow.jpg); color: #666; font-size: 11px; font-weight: bold; line-height: 17px; padding: 2px 6px;">
				<g:message code="proformaDetail.quantity" default="Quantity" /></td>

				<td
					style="background: #fff url(../images/skin/shadow.jpg); color: #666; font-size: 11px; font-weight: bold; line-height: 17px; padding: 2px 6px;">
				<g:message code="product.price" default="Price" /></td>

				<td
					style="background: #fff url(../images/skin/shadow.jpg); color: #666; font-size: 11px; font-weight: bold; line-height: 17px; padding: 2px 6px;">
				<g:message code="proformaDetail.total" default="Total" /></td>
			</tr>
		</thead>
		<tbody>
			<g:each in="${proformaInstance.details}" status="i" var="proformaDetail">
				<tr
					style="${(i % 2) == 0 ? 'background: #f7f7f7;' : 'background: #fff;'}">

					<td>
					${fieldValue(bean:proformaDetail, field: "productName")}
					</td>

					<td>
					${fieldValue(bean:proformaDetail, field: "quantity")}
					</td>

					<td style="text-align: right">
					 <g:formatNumber	number="${(proformaDetail?.price*((proformaInstance?.client?.ivaResponsibleType == 'inscripto')?(1/1.21) : 1))}" format="U\$S 0.00" />
					</td>

					<td style="text-align: right">
					 <g:formatNumber number="${(proformaDetail?.total*((proformaInstance?.client?.ivaResponsibleType == 'inscripto')?(1/1.21) : 1))}" format="U\$S 0.00" />
				  </td>
				</tr>
			</g:each>
			<g:set var="detailsSize" value="${proformaInstance.details.size()}" />
			<tr style="${(detailsSize % 2) == 0?'background: #f7f7f7;':'background: #fff;'}; border-top:1px solid #ddd">
				<td colspan="3">
				  <g:message code="proforma.totalproducts" default="Total Products" />
				</td>
				<td style="text-align: right">
				  <g:formatNumber number="${(totalDetails*((proformaInstance?.client?.ivaResponsibleType == 'inscripto')?(1/1.21) : 1))}" format="U\$S 0.00" />
			  </td>
			</tr>
      <g:if test="${proformaInstance?.courier  > 0}">
        <tr style="${((detailsSize+1) % 2) == 0?'background: #f7f7f7;':'background: #fff;'}" style="border-top:1px solid #ddd">
          <td colspan="3">
            <g:message code="proforma.courier" default="Courier" />
          </td>
          <td style="text-align: right">
            <g:formatNumber number="${(proformaInstance?.courier *((proformaInstance?.client?.ivaResponsibleType == 'inscripto')?(1/1.21) : 1))}" format="U\$S 0.00" />
          </td>
        </tr>
     </g:if>			
     <g:if test="${discountAmount  > 0}">
        <tr style="${((detailsSize+2) % 2) == 0?'background: #f7f7f7;':'background: #fff;'}">
          <td colspan="3" style="color: red">
            <g:message code="proforma.discountAmount" default="Discount" /> 
            <g:formatNumber number="${proformaInstance?.discount}" format="0.00" /> %</td>
          <td style="color: red; text-align: right"><g:formatNumber
            number="${discountAmount}" format="U\$S 0.00" /></td>
        </tr>
      </g:if>			
      <g:if test="${proformaInstance?.client?.ivaResponsibleType == 'inscripto'}">
        <tr class="${((detailsSize+3) % 2) == 0?'background: #f7f7f7;':'background: #fff;'}">
          <td colspan="3"><g:message code="proforma.iva" default="IVA" args="${ [21] }"/></td>
          <td style="text-align: right"><g:formatNumber number="${(totalAmount*(0.21/1.21))}" format="U\$S 0.00" /></td>
        </tr>
      </g:if>     			
			<tr style="${((detailsSize+4) % 2) == 0?'background: #f7f7f7;':'background: #fff;'}">
				<td colspan="3"><g:message code="proforma.totalAmount" default="Total Amount" /></td>
				<td style="text-align: right"><g:formatNumber number="${totalAmount}" format="U\$S 0.00" /></td>
			</tr>
      <tr style="${((detailsSize+5) % 2) == 0?'background: #f7f7f7;':'background: #fff;'}">
        <td colspan="3"><g:message code="proforma.totalAmount" default="Total Amount" /></td>
        <td style="text-align: right"><b><g:formatNumber number="${(totalAmount*proformaInstance?.dollarValue)}" format="\$ 0.00" /></b></td>
      </tr>
		</tbody>
	</table>
</g:if> <br />
    <p><b>Importe en pesos:</b> <g:numToWords number="${formatNumber(number:totalAmount*proformaInstance?.dollarValue, format:'0.00')}" lang="es"/><br/>
     <b>Condiciones de pago:</b> 100% pago a ${proformaInstance?.paymentConditions} d&iacute;as. Los precios de la presente pro-forma estar&aacute;n<br/>
        vigentes hasta 30 d&iacute;as posteriores a la fecha de su emisi&oacute;n.<br/><br/>
                
        Banco: Galicia Sucursal.<br/>
        N&deg; de cuenta corriente: <b>7148-2 127-0</b><br />
      CBU: <b>0070127920000007148200</b><br/><br/>
      CUIT: 30-71219099-6
    </p>
    <table border="0">
      <tbody>
        <tr>
          <td>
            <p>
               MEDGEN SA <br/>
               Oficinas Comerciales : Cabello 3627 (5&deg; A)<br/>
               CP 1425 Ciudad de Buenos Aires
            </p>
          </td>
          <td>
            <p>
              Tel/Fax: 4807-0999/4809-0969<br/>
              E-mail: info@medgen-latam.com<br/>

            </p>
          </td>
        </tr>
      </tbody>
    </table>
    
</div>

</body>
</html>
