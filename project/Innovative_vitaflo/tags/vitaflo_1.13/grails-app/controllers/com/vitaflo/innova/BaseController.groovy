package com.vitaflo.innova

class BaseController {
    static final def SESSION_KEY_PREFIX = '_List'

    protected rememberListState(stateParams) {
            // get (or initialize) session state params
            def sessionKey = SESSION_KEY_PREFIX + controllerName
            def sessionStateParams = session[sessionKey] = (session[sessionKey] ?: [:])
            // store state params and its values in params and session object
            // (1) use params (2) or use session (3) otherwise use default value
            stateParams.each { k, v ->
                params[k] = sessionStateParams[k] = (params[k] ?: (sessionStateParams[k] ?: v))
            }
     }

    protected clearListState() {
        def keysToRemove = []
        session.getAttributeNames().each { k ->
            if(k?.toString().startsWith(SESSION_KEY_PREFIX)) {
                keysToRemove.add(k);
            }
        }

        keysToRemove.each { l ->
            session.removeAttribute(l)
        }
    }
}
