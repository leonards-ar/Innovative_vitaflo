
<%@ page import="com.vitaflo.innova.Purchase" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="purchase.list" default="Purchase List" /></title>
        <g:javascript library="scriptaculous" />
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="purchase.new" default="New Purchase" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="purchase.list" default="Purchase List" /></h1>
    <div id="searchBox">
      <g:form
        name="searchForm"
        url="[controller:'purchase',action:'list']">
        <table>
          <tr>
            <td>
              <div><g:message code="purchase.codeNumber"/> </div>
          <g:textField name="codeNumber" value="${codeNumber}" />
          </td>
          <td>
            <div><g:message code="purchase.supplier"/> </div>
          <g:textField id="autocompleteSupplier" name="supplier" value="${supplier}" />
          <div id="supplier_choices" class="autocomplete"></div>
          <g:javascript>
            new Ajax.Autocompleter("autocompleteSupplier", "supplier_choices", "${createLink(controller:'supplier', action:'searchAutocomplete')}",{});
          </g:javascript>
          </td>
          <td>
            <div><g:message code="proforma.status"/> </div>
            <g:select name="status" from="${com.vitaflo.innova.Purchase.STATUS_LIST}" value="${status}" noSelection="['':'']" valueMessagePrefix="purchase.status"/>
          </td>
          <td>
            <div>&nbsp;</div>
            <span class="button"><g:submitButton name="search" class="save" value="${message(code: 'find', 'default': 'Find')}" /></span>
          </td>
          </tr>
        </table>

      </g:form>

    </div>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                          <th>&nbsp;</th>
                   	    <g:sortableColumn property="codeNumber" title="Code Number" titleKey="purchase.codeNumber" params="${params}" />

                   	    <th><g:message code="purchase.supplier" default="Supplier" /></th>

                   	    <g:sortableColumn property="expireDate" title="Expire Date" titleKey="purchase.expireDate" params="${params}"/>
                        
                   	    <g:sortableColumn property="amount" title="Amount" titleKey="purchase.amount" params="${params}"/>
                        
                   	    <g:sortableColumn property="status" title="Status" titleKey="purchase.status" params="${params}"/>
                                           	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${purchaseInstanceList}" status="i" var="purchaseInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td>${i + params.offset.toInteger() + 1}</td>
                            <td><g:link action="show" id="${purchaseInstance.id}">${(purchaseInstance?.codeNumber)?purchaseInstance?.codeNumber : '_'}</g:link></td>
                        
                            <td>${fieldValue(bean: purchaseInstance, field: "supplier")}</td>

                            <td><g:formatDate date="${purchaseInstance.expireDate}" format="dd/MM/yyyy" /></td>
                        
                            <td class="currencyValue"><g:formatNumber number="${purchaseInstance?.amount}" format="0.00"/></td>
                        
                            <td>${message(code: 'purchase.status.'+purchaseInstance?.status)}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${purchaseInstanceTotal}" params="${params}"/>
            </div>
        </div>
    </body>
</html>
