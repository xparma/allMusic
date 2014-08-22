
<%@ page import="com.allmusic.Favorites" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'favorites.label', default: 'Favorites')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-favorites" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="favorites.artist.label" default="Artist" /></th>
			
				<th><g:message code="favorites.person.label" default="Person" /></th>
			
				<g:sortableColumn property="stars" title="${message(code: 'favorites.stars.label', default: 'Stars')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'favorites.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'favorites.lastUpdated.label', default: 'Last Updated')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${favoritesInstanceList}" status="i" var="favoritesInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${favoritesInstance.id}">${fieldValue(bean: favoritesInstance, field: "artist")}</g:link></td>
			
				<td>${fieldValue(bean: favoritesInstance, field: "person")}</td>
			
				<td>${fieldValue(bean: favoritesInstance, field: "stars")}</td>
			
				<td><g:formatDate date="${favoritesInstance.dateCreated}" formatName="default.datetime.format"/></td>
			
				<td><g:formatDate date="${favoritesInstance.lastUpdated}"/></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${favoritesInstanceCount}" />
	</div>
</section>

</body>

</html>
