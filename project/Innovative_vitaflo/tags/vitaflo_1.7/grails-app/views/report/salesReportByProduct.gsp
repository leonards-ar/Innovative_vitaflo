<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title><g:message code="report.bar.salesReportByProduct" default="Sales Report By Product"/></title>
  <g:javascript library="prototype"/>
  <g:javascript library="scriptaculous"/>
  <g:javascript library="FusionCharts"/>
  <g:javascript library="FusionChartsDOM"/>
  <g:javascript>
    function updateList(box, product) {
      var element = $('selProductList').value;
      var array = $w(element);
      if(box.checked){

            if(array.indexOf(product) < 0){
              $('selProductList').value += product + ' ';
            } else {
              alert('element exists: ' + product);  
            }
        } else {
          $('selProductList').value = '';
          for(var index = 0; index < array.length; index++){
              if(array[index]!=product){
                  $('selProductList').value += array[index] + ' ';
              }
          }
        }

        $('searchForm').submit();

    }
  </g:javascript>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home"/></a></span>
  <span class="menuButton"><g:link class="report" action="index"><g:message code="innova.bar.report" default="Report"/></g:link></span>
</div>
<div class="body">
  <h1><g:message code="report.bar.salesReportByProduct" default="Sales Report By Product"/></h1>
  <div id="searchBox">
    <g:form
            name="searchForm"
            url="[controller:'report',action:'salesReportByProduct']">
      <table>
        <tr>
          <td>
            <div><g:message code="salesReportByProduct.report.startingDate" default="Starting Date"/></div>
            <g:datePicker name="fromDate" value="${fromDate}" precision="month" years="${2008..2020}"/>
          </td>

          <td>
            <div><g:message code="salesReportByProduct.report.endingDate" default="Ending Date"/></div>
            <g:datePicker name="toDate" value="${toDate}" precision="month" years="${2008..2020}"/>
          </td>

          <td>
            <div><g:message code="proforma.patient"/></div>
            <g:textField id="autocompletePatient" name="patient" value="${patient}"/>
            <div id="patient_choices" class="autocomplete"></div>
            <g:javascript>
            new Ajax.Autocompleter("autocompletePatient", "patient_choices", "${createLink(controller: 'patient', action: 'searchAutocomplete')}",{});
            </g:javascript>
          </td>
          <td>
            <div><g:message code="purchase.supplier"/></div>
            <g:select name="supplier" from="${com.vitaflo.innova.Supplier.list()}" value="${supplier}" noSelection="['':'']"/>
          </td>
          <td>
            <div>&nbsp;</div>
            <span class="button"><g:submitButton name="search" class="save" value="${message(code: 'find', 'default': 'Find')}"/></span>
          </td>
        </tr>
      </table>

      <g:hiddenField name="selProductList" value="${selProductList}"/>
    </g:form>

  </div>
  <br/>
  <div id="searchBox">
    <table>
      <tr>
      <g:each in="${productList}" status="i" var="product">
        <td><g:checkBox name="product${product?.id}" value="${selProductList.split(' ').collect{it.toLong()}.contains(product?.id)}" onclick="updateList(this,'${product?.id}')"/></td>
        <td>${product?.shortName()}</td>
        <g:if test="${( (i+1) % 5) == 0}">
          </tr><tr>
        </g:if>
      </g:each>
      </tr>
    </table>
  </div>

  <br/>

  <div id="saleByProductChart">
    <g:render template="salesByProduct" model="[proformaDetailList:proformaDetailList]"/>
  </div>
</div>
</body>
</html>
