package com.vitaflo.innova
import org.codehaus.groovy.grails.plugins.orm.auditable.AuditLogEvent

class AuditLogController extends BaseController {

    def list = {
        rememberListState([max: 15, offset: 0, sort: 'lastUpdated', order: 'desc'])

        def query = {
            if(params.actor) {
                like('actor', '%' + params.actor + '%')
            }
            if(params.eventName){
                eq('eventName', params.eventName)
            }
            if(params.object){
                eq('className', params.object)
            }
            if(params.objectId){
                eq('persistedObjectId', params.objectId?.toLong())
            }
        }

        def criteria = AuditLogEvent.createCriteria()

        def total = criteria.count(query)

        def records = AuditLogEvent.withCriteria {
            maxResults(params.max?.toInteger())
            firstResult(params.offset?.toInteger())
            order(params.sort, params.order)

            if(params.actor) {
                like('actor', '%' + params.actor + '%')
            }
            if(params.eventName){
                eq('eventName', params.eventName)
            }
            if(params.object){
                eq('className', params.object)
            }
            if(params.objectId){
                eq('persistedObjectId', params.objectId?.toLong())
            }
        }

        [auditLogRecordInstanceList: records, auditLogRecordTotal: total, actor: params.actor, eventName: params.eventName, object: params.object, objectId: params.objectId]

    }

    def searchAutocomplete = {
        def users = User.withCriteria{
            or{
                like('lastName', '%' + params.actor + '%')
                like('firstName', '%' + params.actor + '%')
                like('username', '%' + params.actor + '%')
            }
        }

        StringBuffer idList = new StringBuffer()
        idList.append('<ul>')

        users?.each{u -> idList.append('<li>' + u + '</li>')}

        idList.append('</ul>')

        render idList.toString()
    }
}
