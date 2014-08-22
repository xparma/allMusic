<%@ page import="com.allmusic.Album" %>



			<div class="${hasErrors(bean: albumInstance, field: 'artist', 'error')} required">
				<label for="artist" class="control-label"><g:message code="album.artist.label" default="Artist" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="artist" name="artist.id" from="${com.allmusic.Artist.list()}" optionKey="id" required="" value="${albumInstance?.artist?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: albumInstance, field: 'artist', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: albumInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="album.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="name" required="" value="${albumInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: albumInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: albumInstance, field: 'release', 'error')} ">
				<label for="release" class="control-label"><g:message code="album.release.label" default="Release" /></label>
				<div>
					<bs:datePicker name="release" precision="day"  value="${albumInstance?.release}" default="none" noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: albumInstance, field: 'release', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: albumInstance, field: 'label', 'error')} ">
				<label for="label" class="control-label"><g:message code="album.label.label" default="Label" /></label>
				<div>
					<g:textField class="form-control" name="label" value="${albumInstance?.label}"/>
					<span class="help-inline">${hasErrors(bean: albumInstance, field: 'label', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: albumInstance, field: 'genre', 'error')} ">
				<label for="genre" class="control-label"><g:message code="album.genre.label" default="Genre" /></label>
				<div>
					<g:select class="form-control" id="genre" name="genre.id" from="${com.allmusic.Genre.list()}" optionKey="id" value="${albumInstance?.genre?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: albumInstance, field: 'genre', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: albumInstance, field: 'songs', 'error')} ">
				<label for="songs" class="control-label"><g:message code="album.songs.label" default="Songs" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${albumInstance?.songs?}" var="s">
    <li><g:link controller="song" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="song" action="create" params="['album.id': albumInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'song.label', default: 'Song')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: albumInstance, field: 'songs', 'error')}</span>
				</div>
			</div>

