<div id="sales_tables">
  <table width="100%">
    <tr>
      <td>
        <table width="10">
          <thead>
          <tr>
            <th><g:message code="salesReportByProduct.report.product" default="Product"/></th>
            <g:each in="${monthList}" status="i" var="date">
              <th><g:formatDate date="${date}" format="MM/yyyy"/></th>
            </g:each>

          </tr>
          </thead>
          <tbody>
          <g:each in="${salesMap}" status="i" var="entry">

            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
              <td>${entry.key}</td>
              <g:each in="${entry.value}" status="j" var="salesInstance">
                <td class="currencyValue">${formatNumber(number: salesInstance?.amount, format: "0.00")}</td>
              </g:each>

            </tr>
          </g:each>

          </tbody>
        </table>
      </td>
    </tr>
    <tr>

      <td>
        <fusioncharts chartType="MSColumn3D" width="900" height="300" SWFPath="${createLinkTo(dir: 'Charts/')}">
          <data><!--[CDATA[<%=sXml%>
      ]]--></data>
        </fusioncharts>

      </td>
    </tr>
  </table>
</div>
<div id="charts">
  <div id="sales_tables">
    <table width="100%">
      <tr>
      <td>
        <table width="10">
          <thead>
          <tr>
            <th><g:message code="salesReportByProduct.report.product" default="Product"/></th>
            <g:each in="${monthList}" status="i" var="date">
              <th><g:formatDate date="${date}" format="M/yyyy"/></th>
            </g:each>

          </tr>
          </thead>
          <tbody>
          <g:each in="${qtyMap}" status="i" var="entry">

            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
              <td>${entry.key}</td>
              <g:each in="${entry.value}" status="j" var="salesInstance">
                <td class="currencyValue">${formatNumber(number: salesInstance?.amount, format: "0")}</td>
              </g:each>

            </tr>
          </g:each>

          </tbody>
        </table>
      </td>
    </tr>

      <tr>
        <td>
          <fusioncharts chartType="MSColumn3D" width="900" SWFPath="${createLinkTo(dir: 'Charts/')}">
            <data><!--[CDATA[<%=qXml%>
          ]]--></data>
          </fusioncharts>

        </td>
      </tr>
    </table>
  </div>

</div>
