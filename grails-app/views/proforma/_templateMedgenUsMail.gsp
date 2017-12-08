
<%@ page import="com.vitaflo.innova.Proforma"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title><g:message code="proforma.send" default="Send Proforma" /></title>
</head>
<body>
<div class="nav"><span class="menuButton"><a class="home"
	href="${createLinkTo(dir: '')}"><g:message code="home"
	default="Home" /></a></span> <span class="menuButton"><g:link class="list"
	action="list">
	<g:message code="proforma.list" default="Proforma List" />
</g:link></span> <span class="menuButton"><g:link class="create" action="create">
	<g:message code="proforma.new" default="New Proforma" />
</g:link></span></div>
<div class="body">
<h1><g:message code="proforma.send" default="Send Proforma" /></h1>
<g:if test="${flash.message}">
	<div class="message"><g:message code="${flash.message}"
		args="${flash.args}" default="${flash.defaultMessage}" /></div>
</g:if> <g:hasErrors>
	<div class="errors"><g:renderErrors bean="${proformaInstance}"
		as="list" /></div>
</g:hasErrors> <g:form>
	<g:hiddenField name="id" value="${proformaInstance?.id}" />
	<div class="dialog">
	<table>
		<tbody>
			<tr class="prop">
				<td valign="baseline" class="name" style="vertical-align: middle;">
				  <g:message code="proforma.clientEmail" default="Client email" />:
				</td>
				<td valign="baseline" style="vertical-align: middle;" class="value ${hasErrors(field: 'clientEmail', 'errors')}">
				  <g:textField name="clientEmail" size="40" value="${clientEmail}" />
				</td>
				<td>
					<div class="buttons">
					  <span class="button"><g:actionSubmit	class="edit" action="sendProformaEmail"	value="${message(code: 'send', 'default': 'send')}" /></span>
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
				<td colspan="2"><img
					src="${resource(dir:'images',file:grailsApplication.config.application.logoFile)}"
					alt="${grailsApplication.config.application.name}" /></td>
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
            <td valign="baseline" class="name" style="vertical-align: middle;">
             <g:textField name="line1" size="40" value="${line1}" /><br/>
             <g:textField name="line2" size="40" value="${line2}" /><br/>
             <g:textField name="line3" size="40" value="${line3}" />
           </td>
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
							number="${(proformaDetail?.price*((proformaInstance?.client?.ivaResponsibleType == 'inscripto')?(1/1.21) : 1))}" format="\$ 0.00" /></td>

						<td class="currencyValue"><g:formatNumber
							number="${(proformaDetail?.total*((proformaInstance?.client?.ivaResponsibleType == 'inscripto')?(1/1.21) : 1))}" format="\$ 0.00" /></td>
					</tr>
				</g:each>
				<g:set var="detailsSize" value="${proformaInstance.details.size()}" />
				<tr class="${(detailsSize % 2) == 0?'odd':'even'}" style="border-top: 1px solid #ddd">
					<td colspan="3"><g:message code="proforma.totalproducts" default="Total Products" /></td>
					<td class="currencyValue"><g:formatNumber number="${(totalDetails*((proformaInstance?.client?.ivaResponsibleType == 'inscripto')?(1/1.21) : 1))}" format="\$ 0.00" /></td>
				</tr>
				<g:if test="${proformaInstance?.courier  > 0}">
          <tr class="${((detailsSize+1) % 2) == 0?'odd':'even'}">
            <td colspan="3"><g:message code="proforma.courier" default="Courier" /></td>
            <td class="currencyValue"><g:formatNumber number="${(proformaInstance?.courier*((proformaInstance?.client?.ivaResponsibleType == 'inscripto')?(1/1.21) : 1))}" format="\$ 0.00"/></td>
          </tr>
        </g:if>
				<g:if test="${discountAmount  > 0}">
					<tr class="${((detailsSize+2) % 2) == 0?'odd':'even'}">
						<td colspan="3" style="color: red"><g:message	code="proforma.discountAmount" default="Discount" /> <g:formatNumber	number="${proformaInstance?.discount}" format="0.00" /> %</td>
						<td class="currencyDiscountValue"><g:formatNumber	number="${discountAmount}" format="0.00" />%</td>
					</tr>
				</g:if>
        <g:if test="${proformaInstance?.client?.ivaResponsibleType == 'inscripto'}">
          <tr class="${((detailsSize+3) % 2) == 0?'odd':'even'}">
            <td colspan="3"><g:message code="proforma.iva" default="IVA" args="${ [21] }"/></td>
            <td style="text-align: right"><g:formatNumber number="${(totalAmount*(0.21/1.21))}" format="\$ 0.00" /></td>
          </tr>
       </g:if>
		<tr class="${((detailsSize+4) % 2) == 0?'odd':'even'}">
			<td colspan="3"><g:message code="proforma.totalAmount" default="Total Amount" /></td>
			<td style="text-align: right"><g:formatNumber number="${totalAmount}" format="U\$S 0.00" /></td>
		</tr>

        <tr class="${((detailsSize+5) % 2) == 0?'odd':'even'}">
          <td colspan="3"><b><g:message code="proforma.totalAmount" default="Total Amount" /></b></td>
          <td style="text-align: right"><b><g:formatNumber number="${totalAmount * proformaInstance?.dollarValue}" format="\$ 0.00" /></b></td>
        </tr>
			</tbody>
		</table>
	</g:if>

	<br />

	<p>Importe expresado en d&oacute;lares estadounidenses <g:formatNumber number="${totalAmount}" format="U\$S 0.00" /> a fines impositivos<br/>
		se expresan en pesos <g:formatNumber number="${totalAmount * proformaInstance?.dollarValue}" format="\$ 0.00" /> seg&uacute;n tipo de cambio
		libre vendedor BNA del d&iacute;a <g:formatDate date="${proformaInstance?.createdAt}" format="dd/MM/yyyy"/>
		de <g:formatNumber number="${proformaInstance?.dollarValue}" format="0.00" />.
		<br/><br/>
	</p>

	<p><b>Importe en pesos:</b> <g:numToWords number="${formatNumber(number:totalAmount, format:'0.00')}" lang="es"/><br/>
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
               Oficinas Comerciales : Av. Callao 2094 (3&deg; Derecha)<br/>
               CP 1024 Ciudad de Buenos Aires
            </p>
          </td>
          <td>
            <p>
              Tel/Fax: 3221-7620 al 23<br/>
              E-mail: info@medgen-latam.com<br/>

            </p>
          </td>
        </tr>
      </tbody>
    </table>
    </div>
</g:form>
</div>
</body>
</html>