
<%@ page import="com.allmusic.Song" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'song.label', default: 'Song')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-song" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="track" title="${message(code: 'song.track.label', default: 'Track')}" />
			
				<g:sortableColumn property="name" title="${message(code: 'song.name.label', default: 'Name')}" />
			
				<th><g:message code="song.album.label" default="Album" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${songInstanceList}" status="i" var="songInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${songInstance.id}">${fieldValue(bean: songInstance, field: "track")}</g:link></td>
			
				<td>${fieldValue(bean: songInstance, field: "name")}</td>
			
				<td>${fieldValue(bean: songInstance, field: "album")}</td>
			
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
