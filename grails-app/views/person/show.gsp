
<%@ page import="com.allmusic.Person" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-person" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="person.firstName.label" default="First Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: personInstance, field: "firstName")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="person.lastName.label" default="Last Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: personInstance, field: "lastName")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="person.address.label" default="Address" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: personInstance, field: "address")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="person.dateBirth.label" default="Date Birth" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${personInstance?.dateBirth}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="person.sex.label" default="Sex" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: personInstance, field: "sexName")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="person.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${personInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="person.email.label" default="Email" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: personInstance, field: "email")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="person.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${personInstance?.lastUpdated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
