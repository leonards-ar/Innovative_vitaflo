<html>
  <head>
    <title><g:layoutTitle default="Grails" /></title>
    <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
    <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
  <g:layoutHead />
  <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'vitaflo.css')}" type="text/css" media="screen" charset="utf-8">
  <g:javascript library="application" />
</head>
<body>
  <div id="spinner" class="spinner" style="display:none;">
    <img src="${resource(dir:'images',file:'spinner.gif')}" alt="Spinner" />
  </div>
  <div class="logo"><img src="${resource(dir:'images',file:'innovative.gif')}" alt="Innovative" />

      <p>  </p>
      <div class="welcomeBox">
        <g:isLoggedIn>
          <g:link controller="user" action="showProfile" id="${loggedInUserInfo(field:'id')}"><g:message code="login.bar.profile"/></g:link> | <g:link controller="logout"><g:message code="logout"/></g:link>
          <br/><br/>
          <g:message code="login.bar.welcomeback" args="${[loggedInUserInfo(field:'username')]}"/>
        </g:isLoggedIn>
        <br/><br/>
        <g:if test="${params.controller == 'home' || params.controller == 'login'}">
       <span>
          <g:link controller="${params.controller?params.controller:'home'}" action="${params.action}" id="${params.id}" params="[lang:'en']" class="menuButton"><g:message code="language.english"/></g:link>
        </span>
        <span>
          <g:link controller="${params.controller?params.controller:'home'}" action="${params.action}" id="${params.id}" params="[lang:'es']" class="menuButton"><g:message code="language.spanish"/></g:link>
        </span>
        <!--span>
          <g:link controller="${params.controller}" action="${params.action}" id="${params.id}" params="[lang:'pt_BR']" class="menuButton"><g:message code="language.portuguese"/></g:link>
        </span-->
        </g:if>
      </div>
  </div>
<g:layoutBody/>
</body>
</html>