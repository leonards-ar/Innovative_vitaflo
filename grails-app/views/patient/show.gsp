
<%@ page import="com.vitaflo.innova.Patient"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title><g:message code="patient.show" default="Show Patient" /></title>
</head>
<body>
<div class="nav"><span class="menuButton"><a class="home"
	href="${createLinkTo(dir: '')}"><g:message code="home"
	default="Home" /></a></span> <span class="menuButton"><g:link class="list"
	action="list">
	<g:message code="patient.list" default="Patient List" />
</g:link></span> <span class="menuButton"><g:link class="create" action="create">
	<g:message code="patient.new" default="New Patient" />
</g:link></span></div>
<div class="body">
<h1><g:message code="patient.show" default="Show Patient" /></h1>
<g:if test="${flash.message}">
	<div class="message"><g:message code="${flash.message}"
		args="${flash.args}" default="${flash.defaultMessage}" /></div>
</g:if> <g:form>
	<g:hiddenField name="id" value="${patientInstance?.id}" />
	<div class="dialog">
	<table>
		<tbody>

			<tr class="prop">
				<td valign="top" class="name"><g:message
					code="patient.firstName" default="First Name" />:</td>

				<td valign="top" class="value">
				${fieldValue(bean: patientInstance, field: "firstName")}
				</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message
					code="patient.lastName" default="Last Name" />:</td>

				<td valign="top" class="value">
				${fieldValue(bean: patientInstance, field: "lastName")}
				</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message
					code="patient.initials" default="Initials" />:</td>

				<td valign="top" class="value">
				${fieldValue(bean: patientInstance, field: "initials")}
				</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="patient.birth"
					default="Birth" />:</td>

				<td valign="top" class="value"><g:formatDate
					date="${patientInstance?.birth}" format="dd/MM/yyyy" /></td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="patient.weight"
					default="Weight" />:</td>

				<td valign="top" class="value">
				${fieldValue(bean: patientInstance, field: "weight")}
				</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="patient.phone"
					default="Phone" />:</td>

				<td valign="top" class="value">
				${fieldValue(bean: patientInstance, field: "phone")}
				</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message
					code="patient.contactName" default="Contact Name" />:</td>

				<td valign="top" class="value">
				${fieldValue(bean: patientInstance, field: "contactName")}
				</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message
					code="patient.deliveryAddress" default="Delivery Address" />:</td>

				<td valign="top" class="value">
				${fieldValue(bean: patientInstance, field: "deliveryAddress")}
				</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="patient.country"
					default="Country" />:</td>

				<td valign="top" class="value">
				${patientInstance?.country?.encodeAsHTML()}
				</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="patient.client"
					default="Client" />:</td>

				<td valign="top" class="value"><g:link controller="client"
					action="show" id="${patientInstance?.client?.id}">
					${patientInstance?.client?.encodeAsHTML()}
				</g:link></td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="patient.dose"
					default="Dose" />:</td>

				<td valign="top" class="value">
				${fieldValue(bean: patientInstance, field: "dose")} ${fieldValue(bean: patientInstance, field: "doseUnit")}
				</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message
					code="patient.dosePerWeight" default="Dose per Weight" />:</td>

				<td valign="top" class="value">
				${formatNumber(number:patientInstance.getDosePerWeight(), format:'0.00')}
				${fieldValue(bean: patientInstance, field: "doseUnit")}/kg </td>
				<g:if test="${ !patientInstance.isRegularDose() }">
					<tr class="prop">
						<td colspan="2" valign="top" class="name"><g:message
							code="patient.doseWarning"
							args="${[patientInstance?.pathology?.minDose,patientInstance?.pathology?.maxDose ] }" /></td>
				</g:if>
			</tr>
			<tr class="prop">
				<td valign="top" class="name"><g:message
					code="patient.pathology" default="Pathology" />:</td>

				<td valign="top" class="value">
				${patientInstance?.pathology?.toStringWithDose()}
				</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message
					code="patient.physician" default="Physician" />:</td>

				<td valign="top" class="value">
				${fieldValue(bean: patientInstance, field: "physician")}
				</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message
					code="patient.clinicalStatus" default="Clinical Status" />:</td>

				<td valign="top" class="value">
				${fieldValue(bean: patientInstance, field: "clinicalStatus")}
				</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message
					code="patient.adverseEvent" default="Adverse Event" />:</td>

				<td valign="top" class="value">
				${fieldValue(bean: patientInstance, field: "adverseEvent")}
				</td>

			</tr>
			<tr>
				<td colspan="3">
				<table>
					<thead>
						<tr>
							<th><g:message code="patient.product" default="Product" /></th>
							<th><g:message code="patient.lastOrderedDate"
								default="Last Ordered Date" /></th>
							<th><g:message code="patient.deadline" default="Deadline" /></th>
							<th>&nbsp;</th>
						</tr>
					</thead>
					<tbody>

						<g:each in="${productStockList}" status="i"	var="patientProductStock">

              
							<tr class="${productIndicator[i]}">
								<td valign="top" class="value">
								${patientProductStock?.product?.encodeAsHTML()}
								</td>
								<td valign="top" class="value"><g:formatDate
									date="${patientProductStock?.startDate}"
									format="dd/MM/yyyy" /></td>
								<td valign="top" class="value"><g:formatDate
									date="${patientProductStock?.runningOutOfStockDate}"
									format="dd/MM/yyyy" /></td>
							</tr>
						</g:each>
					</tbody>
				</table>
				</td>
			</tr>
		</tbody>
	</table>
	</div>
	<div class="buttons"><span class="button"><g:actionSubmit
		class="edit" action="edit"
		value="${message(code: 'edit', 'default': 'Edit')}" /></span> <span
		class="button"><g:actionSubmit class="delete" action="delete"
		value="${message(code: 'delete', 'default': 'Delete')}"
		onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}');" /></span>
	</div>
</g:form></div>
</body>
</html>
