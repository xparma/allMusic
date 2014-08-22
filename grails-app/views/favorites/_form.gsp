<%@ page import="com.allmusic.Favorites" %>



			<div class="${hasErrors(bean: favoritesInstance, field: 'artist', 'error')} required">
				<label for="artist" class="control-label"><g:message code="favorites.artist.label" default="Artist" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="artist" name="artist.id" from="${com.allmusic.Artist.list()}" optionKey="id" required="" value="${favoritesInstance?.artist?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: favoritesInstance, field: 'artist', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: favoritesInstance, field: 'person', 'error')} required">
				<label for="person" class="control-label"><g:message code="favorites.person.label" default="Person" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="person" name="person.id" from="${com.allmusic.Person.list()}" optionKey="id" required="" value="${favoritesInstance?.person?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: favoritesInstance, field: 'person', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: favoritesInstance, field: 'stars', 'error')} ">
				<label for="stars" class="control-label"><g:message code="favorites.stars.label" default="Stars" /></label>
				<div>
					<g:select class="form-control" name="stars" from="${1..5}" class="range" value="${fieldValue(bean: favoritesInstance, field: 'stars')}" noSelection="['': '']"/>
					<span class="help-inline">${hasErrors(bean: favoritesInstance, field: 'stars', 'error')}</span>
				</div>
			</div>

