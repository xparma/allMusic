
<%@ page import="com.allmusic.Favorites" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'favorites.label', default: 'Favorites')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-favorites" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="favorites.artist.label" default="Artist" /></td>
				
				<td valign="top" class="value"><g:link controller="artist" action="show" id="${favoritesInstance?.artist?.id}">${favoritesInstance?.artist?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="favorites.person.label" default="Person" /></td>
				
				<td valign="top" class="value"><g:link controller="person" action="show" id="${favoritesInstance?.person?.id}">${favoritesInstance?.person?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="favorites.stars.label" default="Stars" /></td>
				  
				<td valign="top" class="value">
                                    <div ng-controller="editStarsController" ng-init="init(${favoritesInstance as  grails.converters.JSON})">
                                    {{json.stars}}
                                        <input type="number" name="estrellas" min="1" max="5" size="1" maxlength="1" ng-model="val" ng-hide="custom" value="{{json.stars}}" />
                                        <button class="btn btn-primary" type="submit" ng-hide="custom" ng-click="guardar()">Guardar</button>
                                        <button class="btn btn-primary" startstop type="button" ng-click="custom=!custom">Editar</button>
                                    </div>
                                </td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="favorites.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${favoritesInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="favorites.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${favoritesInstance?.lastUpdated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>