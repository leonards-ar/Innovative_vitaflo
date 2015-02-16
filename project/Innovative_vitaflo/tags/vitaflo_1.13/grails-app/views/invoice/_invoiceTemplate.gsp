<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
      <title>printInvoice</title>
      <style  type="text/css">
        @page {
          size: 210mm 297mm;
        }
      </style>
      
    </head>
    <body>
      <div style="position:absolute;top:7.4cm;left:4.6cm;padding:2px;font-size: 12px;">
          ${clientInstance?.name} / ${patientInstance?.firstName} ${patientInstance?.lastName}<br/>
          ${patientInstance?.deliveryAddress}
     </div>
     <div style="position:absolute;top:10cm;left:4.6cm;padding:2px;font-size: 12px;">
        ${clientInstance?.ivaResponsibleType}
       </div>
       <div style="position:absolute;top:10.8cm;left:4.6cm;padding:2px;font-size: 12px;">
    ${clientInstance?.cuit}
       </div>
       <div style="position:absolute;top:12.5cm;left:4.6cm;padding:2px;font-size: 12px;">
            <g:each in="${proformaInstance.details}" status="i" var="proformaDetail">
              <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td>${fieldValue(bean:proformaDetail, field: "productName")}</td>

                <td>${fieldValue(bean:proformaDetail, field: "quantity")}</td>

                <td>${fieldValue(bean: proformaDetail, field: "dailyDose")} ${fieldValue(bean: proformaDetail, field: "doseUnit")}</td>

                <td class="currencyValue"><g:formatNumber number="${proformaDetail?.price}" format="0.00"/></td>

              <td class="currencyValue"><g:formatNumber number="${proformaDetail?.total}" format="0.00"/></td>
              </tr>
            </g:each>
        
        
       </div>
       
    </body>
</html>
