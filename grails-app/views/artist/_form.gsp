<%@ page import="com.allmusic.Artist" %>



			<div class="${hasErrors(bean: artistInstance, field: 'albums', 'error')} ">
				<label for="albums" class="control-label"><g:message code="artist.albums.label" default="Albums" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${artistInstance?.albums?}" var="a">
    <li><g:link controller="album" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="album" action="create" params="['artist.id': artistInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'album.label', default: 'Album')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: artistInstance, field: 'albums', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: artistInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="artist.name.label" default="Name" /></label>
				<div>
					<g:textField class="form-control" name="name" value="${artistInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: artistInstance, field: 'name', 'error')}</span>
				</div>
			</div>

