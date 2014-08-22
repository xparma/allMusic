
<%@ page import="com.allmusic.Song" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'song.label', default: 'Song')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-song" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="track" title="${message(code: 'song.track.label', default: 'Track')}" />
			
				<g:sortableColumn property="album.name" title="${message(code: 'song.album.label', default: 'Album')}" />
			
				<g:sortableColumn property="name" title="${message(code: 'song.name.label', default: 'Name')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${songInstanceList}" status="i" var="songInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${songInstance.id}">${fieldValue(bean: songInstance, field: "track")}</g:link></td>
			
				<td>${fieldValue(bean: songInstance, field: "album")}</td>
			
				<td>${fieldValue(bean: songInstance, field: "name")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${songInstanceCount}" />
	</div>
</section>

</body>

</html>
