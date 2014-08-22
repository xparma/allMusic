
<%@ page import="com.allmusic.Album" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'album.label', default: 'Album')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-album" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="album.artist.label" default="Artist" /></td>
				
				<td valign="top" class="value"><g:link controller="artist" action="show" id="${albumInstance?.artist?.id}">${albumInstance?.artist?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="album.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: albumInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="album.release.label" default="Release" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${albumInstance?.release}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="album.label.label" default="Label" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: albumInstance, field: "label")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="album.genre.label" default="Genre" /></td>
				
				<td valign="top" class="value"><g:link controller="genre" action="show" id="${albumInstance?.genre?.id}">${albumInstance?.genre?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="album.songs.label" default="Songs" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<tsj:sortAndForeach in="${albumInstance.songs}" var="s" sort="${["track","name"]}">
						<li><g:link controller="song" action="show" id="${s.id}">${s.track} - ${s?.encodeAsHTML()}</g:link></li>
					</tsj:sortAndForeach>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
