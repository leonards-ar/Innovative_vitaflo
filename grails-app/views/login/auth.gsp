<head>
  <meta name='layout' content='main' />
  <link rel="stylesheet" href="${resource(dir:'css',file:grailsApplication.config.application.cssFile)}" />
  <title>${grailsApplication.config.application.name}</title>
</head>

<body>
  <div class="nav">&nbsp;</div>
  <div id="loginBox" class="loginBox">
    <g:if test='${flash.message}'>
      <div class='login_message'><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
    </g:if>
    <form action='${postUrl}' method='POST' id='loginForm' >
      <p>
      <div class="form_label"><g:message code="user.username"/></div>
      <g:textField name='j_username' id='j_username' value='${request.remoteUser}' />
      </p>
      <p>
      <div class="form_label"><g:message code="user.password"/></div>
      <g:passwordField name='j_password' id='j_password' />
      </p>
      <p>
      <div class="form_label"><g:message code="login.rememberme"/>  </div>
      <input type='checkbox' class='chk' name='_spring_security_remember_me' id='remember_me'

             <g:if test='${hasCookie}'>checked='checked'</g:if> />

      </p>
      <p>
        <input type='submit' class="button" value='${message(code: 'login', 'default': 'Login')}' />
      </p>
    </form>
  </div>

  <script type='text/javascript'>
  <!--
  (function(){
          document.forms['loginForm'].elements['j_username'].focus();
  })();
  // -->
  </script>
</body>
