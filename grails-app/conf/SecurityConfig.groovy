security {

  // see DefaultSecurityConfig.groovy for all settable/overridable properties

  active = true

  loginUserDomainClass = "User"
  authorityDomainClass = "Role"
  requestMapClass = "RequestMap"

  //Default User
  security.defaultRole = "ROLE_USER"
  /**
   * useRequestMapDomainClass to false, so the application will not use the domain class
   * we’ve created
   */
  useRequestMapDomainClass = false

  // Sets the URL permissions
  requestMapString = """
    CONVERT_URL_TO_LOWERCASE_BEFORE_COMPARISON
    PATTERN_TYPE_APACHE_ANT
    /home/**=ROLE_ADMIN,ROLE_USER,ROLE_ACCOUNTANT,ROLE_REPORT
    /auditlog/list=ROLE_ADMIN
    /user/show=ROLE_ADMIN
    /user/edit=ROLE_ADMIN
    /user/list=ROLE_ADMIN
    /user/create=ROLE_ADMIN
    /user/showprofile=ROLE_ADMIN,ROLE_USER
    /user/editprofile=ROLE_ADMIN,ROLE_USER
    /client/**=ROLE_ADMIN,ROLE_USER
    /client/create=ROLE_ADMIN,ROLE_USER
    /client/edit=ROLE_ADMIN,ROLE_USER
    /drug/**=ROLE_ADMIN,ROLE_USER
    /login/**=IS_AUTHENTICATED_ANONYMOUSLY
    /patient/**=ROLE_ADMIN,ROLE_USER
    /patient/create=ROLE_ADMIN,ROLE_USER
    /patient/edit=ROLE_ADMIN,ROLE_USER
    /product/**=ROLE_ADMIN,ROLE_USER
    /proforma/**=ROLE_ADMIN,ROLE_USER
    /proforma/create=ROLE_ADMIN,ROLE_USER
    /proforma/edit=ROLE_ADMIN,ROLE_USER
    /supplier/**=ROLE_ADMIN,ROLE_USER
    /invoice/**=ROLE_ADMIN,ROLE_USER
    /invoice/create=ROLE_ADMIN,ROLE_USER
    /invoice/edit=ROLE_ADMIN,ROLE_USER
    /purchase/**=ROLE_ADMIN,ROLE_USER
    /purchase/create=ROLE_ADMIN,ROLE_USER
    /purchase/edit=ROLE_ADMIN,ROLE_USER
    /report/**=ROLE_REPORT,ROLE_ACCOUNTANT
    /report/consolidatedreport=ROLE_REPORT,ROLE_ACCOUNTANT
    /**/create=ROLE_ADMIN
    /**/edit=ROLE_ADMIN
    /emails/**=ROLE_ADMIN, ROLE_USER
    /index = IS_AUTHENTICATED_ANONYMOUSLY
    /error = IS_AUTHENTICATED_ANONYMOUSLY
    /**=IS_AUTHENTICATED_ANONYMOUSLY
    """

  useSecurityEventListener = true


  onInteractiveAuthenticationSuccessEvent = {e, appCtx ->
    com.vitaflo.innova.User.withTransaction {
        //def user = com.vitaflo.innova.User.findByUsername(e.source.principal.username)
        def c = com.vitaflo.innova.User.createCriteria();
        def user = c.get{
            fetchMode("countries", org.hibernate.FetchMode.EAGER)
            eq('username', e.source.principal.username)
        }
        def attr = org.springframework.web.context.request.RequestContextHolder?.getRequestAttributes()
        attr.session.countries = user.countries.sort {it.name}
    }
  }


}
