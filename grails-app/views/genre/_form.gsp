<%@ page import="com.allmusic.Genre" %>



			<div class="${hasErrors(bean: genreInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="genre.name.label" default="Name" /></label>
				<div>
					<g:textField class="form-control" name="name" maxlength="25" value="${genreInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: genreInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: genreInstance, field: 'albumes', 'error')} ">
				<label for="albumes" class="control-label"><g:message code="genre.albumes.label" default="Albumes" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${genreInstance?.albumes?}" var="a">
    <li><g:link controller="album" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="album" action="create" params="['genre.id': genreInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'album.label', default: 'Album')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: genreInstance, field: 'albumes', 'error')}</span>
				</div>
			</div>

