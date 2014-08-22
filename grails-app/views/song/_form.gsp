<%@ page import="com.allmusic.Song" %>



			<div class="${hasErrors(bean: songInstance, field: 'track', 'error')} required">
				<label for="track" class="control-label"><g:message code="song.track.label" default="Track" /><span class="required-indicator">*</span></label>
				<div>
					<g:field class="form-control" name="track" type="number" min="1" max="100" value="${songInstance.track}" required=""/>
					<span class="help-inline">${hasErrors(bean: songInstance, field: 'track', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: songInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="song.name.label" default="Name" /></label>
				<div>
					<g:textField class="form-control" name="name" maxlength="50" value="${songInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: songInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: songInstance, field: 'album', 'error')} required">
				<label for="album" class="control-label"><g:message code="song.album.label" default="Album" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="album" name="album.id" from="${com.allmusic.Album.list()}" optionKey="id" required="" value="${songInstance?.album?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: songInstance, field: 'album', 'error')}</span>
				</div>
			</div>

