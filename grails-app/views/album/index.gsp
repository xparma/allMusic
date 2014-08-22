
<%@ page import="com.allmusic.Album" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'album.label', default: 'Album')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-album" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="album.artist.label" default="Artist" /></th>
			
				<g:sortableColumn property="name" title="${message(code: 'album.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="release" title="${message(code: 'album.release.label', default: 'Release')}" />
			
				<g:sortableColumn property="label" title="${message(code: 'album.label.label', default: 'Label')}" />
			
				<th><g:message code="album.genre.label" default="Genre" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${albumInstanceList}" status="i" var="albumInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${albumInstance.id}">${fieldValue(bean: albumInstance, field: "artist")}</g:link></td>
			
				<td>${fieldValue(bean: albumInstance, field: "name")}</td>
			
				<td><g:formatDate date="${albumInstance.release}" /></td>
			
				<td>${fieldValue(bean: albumInstance, field: "label")}</td>
			
				<td>${fieldValue(bean: albumInstance, field: "genre")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${albumInstanceCount}" />
	</div>
</section>

</body>

</html>
