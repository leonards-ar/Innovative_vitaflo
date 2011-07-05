<html>
  <head>
    <title>${grailsApplication.config.application.name}</title>
    <meta name="layout" content="main" />
  </head>
  <body>
    <div class="nav">
      <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
      <g:ifAnyGranted role="ROLE_REPORT,ROLE_ACCOUNTANT">
        <span class="menuButton"><g:link class="report" controller="report" action="consolidatedReport"><g:message code="report.bar.consolidatedReport"/></g:link></span>
      </g:ifAnyGranted>
      <g:ifAnyGranted role="ROLE_REPORT">
        <span class="menuButton"><g:link class="chart" controller="report" action="salesReport"><g:message code="report.bar.salesReport"/></g:link></span>
      </g:ifAnyGranted>
      <g:ifAnyGranted role="ROLE_REPORT">
        <span class="menuButton"><g:link class="chart" controller="report" action="salesReportByProduct"><g:message code="report.bar.salesReportByProduct"/></g:link></span>
      </g:ifAnyGranted>
    </div>
  </body>
</html>
