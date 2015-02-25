angular.module 'lander.directives.note', []
.directive 'note', () ->
	return {
		restrict : 'E'
		replace : true
		templateUrl: 'app/main/notes/note.html'
		link: (scope,el,attr)->
			contentPanel = $('.content-panel')

			showContentPanel = ()->
				if contentPanel.attr('show') == 'false'
					contentPanel.attr('show','true')
				else
					contentPanel.attr('show','false')

			activateNote = ()->
				showContentPanel()
				$('.note-details-holder').attr('active','false')
				el.children('.note-details-holder').attr('active','true')

			el.bind 'click',activateNote
			return undefined
	}
