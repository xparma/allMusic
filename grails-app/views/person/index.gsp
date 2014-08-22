
<%@ page import="com.allmusic.Person" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-person" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="firstName" title="${message(code: 'person.firstName.label', default: 'First Name')}" />
			
				<g:sortableColumn property="lastName" title="${message(code: 'person.lastName.label', default: 'Last Name')}" />
			
				<g:sortableColumn property="address" title="${message(code: 'person.address.label', default: 'Address')}" />
			
				<g:sortableColumn property="dateBirth" title="${message(code: 'person.dateBirth.label', default: 'Date Birth')}" />
			
				<g:sortableColumn property="sex" title="${message(code: 'person.sex.label', default: 'Sex')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'person.dateCreated.label', default: 'Date Created')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${personInstanceList}" status="i" var="personInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${personInstance.id}">${fieldValue(bean: personInstance, field: "firstName")}</g:link></td>
			
				<td>${fieldValue(bean: personInstance, field: "lastName")}</td>
			
				<td>${fieldValue(bean: personInstance, field: "address")}</td>
			
				<td><g:formatDate date="${personInstance.dateBirth}" /></td>
			
				<td>${fieldValue(bean: personInstance, field: "sexName")}</td>
			
				<td><g:formatDate date="${personInstance.dateCreated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${personInstanceCount}" />
	</div>
</section>

</body>

</html>
