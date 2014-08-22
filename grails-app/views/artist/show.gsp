
<%@ page import="com.allmusic.Artist" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'artist.label', default: 'Artist')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-artist" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="artist.albums.label" default="Albums" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${artistInstance.albums}" var="a">
						<li><g:link controller="album" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="artist.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: artistInstance, field: "name")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
