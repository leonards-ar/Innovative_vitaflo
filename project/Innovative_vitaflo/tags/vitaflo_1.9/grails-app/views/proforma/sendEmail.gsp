<g:render template="${grailsApplication.config.application.template + 'Mail'}" model="[proformaInstance:proformaInstance,totalDetails:totalDetails,
                totalAmount:totalAmount, discountAmount: discountAmount, clientEmail:clientEmail]"/>