package com.vitaflo.innova

class UserController {
    static final ROLE_ADMIN = "ROLE_ADMIN"
    def authenticateService

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 15,  100)

        if (!params.sort) params.sort = "username"
        if (!params.order) params.order = "asc"

        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }

    def create = {
        def userInstance = new User()
        userInstance.properties = params
        return ['userInstance':userInstance]
    }

    def save = {
        def userInstance = new User(params)
        if(params.passwd != null && params.passwd !='') {
            userInstance.passwd = authenticateService.encodePassword(params.passwd)
        }

        if(!params.selectedCountries) {
          userInstance.errors.rejectValue("countries", "user.countries.min.size.message")
        }

        if(!params.selectedAuthorities) {
          userInstance.errors.rejectValue("authorities", "user.roles.min.size.message")
        }

        if(!userInstance.hasErrors() && userInstance.save()) {
            addRoles(userInstance)
            addCountries(userInstance)
            flash.message = "User ${userInstance.id} created"
            redirect(action: show, id: userInstance.id)
        }
        else {
            render view: 'create', model: [userInstance: userInstance]
        }
    }

    def show = {
        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = "user.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "User not found with id ${params.id}"
            redirect(action: "list")
            return
        }

        return [userInstance: userInstance]
    }

    def showProfile = {
        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = "user.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "User not found with id ${params.id}"
            redirect(action: "list")
            return
        }

        return [userInstance: userInstance]
    }
    
    def edit = {
        def userInstance = User.get(params.id)
        if (!userInstance) {
            redirect(controller: "logout")
        }
        else {
            return [userInstance: userInstance]
        }
    }

    def editProfile = {
        def userInstance = User.get(params.id)
        if (!userInstance) {
            redirect(controller: "logout")
        }
        else {
            return [userInstance: userInstance]
        }
    }

    def update = {
        def userInstance = User.get(params.id)

        if (userInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (userInstance.version > version) {
                    
                    userInstance.errors.rejectValue("version", "user.optimistic.locking.failure", "Another user has updated this User while you were editing")
                    render(view: "edit", model: [userInstance: userInstance])
                    return
                }
            }
            def tmpPass = userInstance.passwd
            userInstance.properties = params
            if(tmpPass != params.passwd) {
                userInstance.passwd = authenticateService.encodePassword(params.passwd)
            }

            if(!params.selectedCountries) {
              userInstance.errors.rejectValue("countries", "user.countries.min.size.message")
            }

            if(!params.selectedAuthorities) {
              userInstance.errors.rejectValue("authorities", "user.roles.min.size.message")
            }
          
            if (!userInstance.hasErrors() && userInstance.save()) {
                Country.findAll().each {userInstance.removeFromCountries(it)}
                Role.findAll().each {userInstance.removeFromAuthorities(it)}
                addCountries(userInstance)
                addRoles(userInstance)
                
                flash.message = "user.updated"
                flash.args = [params.id]
                flash.defaultMessage = "User ${params.id} updated"
                redirect(action: "show", id: userInstance.id)
            }
            else {
                render(view: "edit", model: [userInstance: userInstance])
            }
        }
        else {
            redirect(controller: "logout")
        }
    }

  def updateProfile = {
      def userInstance = User.get(params.id)

      if (userInstance) {
          if (params.version) {
              def version = params.version.toLong()
              if (userInstance.version > version) {

                  userInstance.errors.rejectValue("version", "user.optimistic.locking.failure", "Another user has updated this User while you were editing")
                  render(view: "editProfile", model: [userInstance: userInstance])
                  return
              }
          }
          def tmpPass = userInstance.passwd
          userInstance.properties = params
          if(tmpPass != params.passwd) {
              userInstance.passwd = authenticateService.encodePassword(params.passwd)
          }

          if (!userInstance.hasErrors() && userInstance.save()) {
            if(isAdmin(userInstance)){
              Country.findAll().each {userInstance.removeFromCountries(it)}
              Role.findAll().each {userInstance.removeFromAuthorities(it)}
              addCountries(userInstance)
              addRoles(userInstance)
            }
              flash.message = "user.updated"
              flash.args = [params.id]
              flash.defaultMessage = "User ${params.id} updated"
              redirect(action: "showProfile", id: userInstance.id)
          }
          else {
              render(view: "editProfile", model: [userInstance: userInstance])
          }
      }
      else {
          redirect(controller: "logout")
      }
  }

    private void addRoles(person) {
        for (String key in params.selectedAuthorities) {
            person.addToAuthorities(Role.findById(key))
        }
    }

    private void addCountries(person){
        for(String key: params.selectedCountries) {
            person.addToCountries(Country.findById(key))
        }
       
    }

    private boolean isAdmin(person) {
        for(role in person.authorities){
            if(role.authority == ROLE_ADMIN) return true
        }
        return false;
    }

}
