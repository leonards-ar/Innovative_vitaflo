
<%@ page contentType="text/html" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html">
     <title><g:message code="patientProductStock.notification" default="Running Out of Stock Notification" /></title>
  </head>
  <body>
        <div class="body">
          <h3><g:message code="patientProductStock.notification" default="Running Out of Stock Notification" /></h3>
            <div class="dialog">
                <table style="margin-top: 5px;">
                    <tbody>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="patientProductStock.patient" default="Patient" />:</td>

                            <td valign="top" class="value">${patientProductStockInstance?.patient?.encodeAsHTML()}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="patientProductStock.patient.client" default="Client" />:</td>

                            <td valign="top" class="value"><a href="mailto:${patientProductStockInstance?.patient?.client?.email}">${patientProductStockInstance?.patient?.client?.encodeAsHTML()}</a></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="patientProductStock.product" default="Product" />:</td>

                            <td valign="top" class="value">${patientProductStockInstance?.product?.encodeAsHTML()}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="patientProductStock.runningOutOfStockDate" default="Running Out of Stock Date" />:</td>

                            <td valign="top" class="value"><g:formatDate format="dd-MM-yyyy" date="${patientProductStockInstance?.runningOutOfStockDate}" /></td>

                        </tr>

                    </tbody>
                </table>
            </div>
       </div>
  </body>
</html>
