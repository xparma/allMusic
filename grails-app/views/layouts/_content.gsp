<div id="Content" class="container">
	<!-- Main menu in one row (e.g., controller entry points -->
	<g:if test="${!layout_nomainmenu}">
		<g:render template="/_menu/menubar"/>
	</g:if>
	
	<!-- Secondary menu in one row (e.g., actions for current controller) -->
	<g:if test="${!layout_nosecondarymenu}">
		<g:render template="/_menu/submenubar"/>														
	</g:if>

	<!-- print system messages (infos, warnings, etc) - not validation errors -->
	<g:if test="${flash.message && !layout_noflashmessage}">
		<div class="alert alert-info">${flash.message}</div>
	</g:if>
        
        <g:if test="${flash.error}">
           <div class="alert alert-danger" style="display: block">${flash.error}</div>
        </g:if>
        <g:if test="${flash.success}">
           <div class="alert alert-success" style="display: block">${flash.success}</div>
        </g:if>
        <g:if test="${flash.warn}">
           <div class="alert alert-warning" style="display: block">${flash.warn}</div>
        </g:if>



	<!-- Show page's content -->
	<g:layoutBody />
	<g:pageProperty name="page.body" />
</div>
