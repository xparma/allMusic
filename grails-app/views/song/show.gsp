
<%@ page import="com.allmusic.Song" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'song.label', default: 'Song')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-song" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="song.track.label" default="Track" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: songInstance, field: "track")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="song.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: songInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="song.album.label" default="Album" /></td>
				
				<td valign="top" class="value"><g:link controller="album" action="show" id="${songInstance?.album?.id}">${songInstance?.album?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
