angular.module 'lander.directives.searchPanel', []
.directive 'searchPanel', () ->
	return {
		restrict : 'E'
		controller: 'globalCtrl'
		replace : true
		transclude:true
		templateUrl: 'app/main/appGlobals/partials/searchPanel.html'
		link:(scope,el,attr)->
			editButton = $('#editButton')
			contentPanel = $('.content-panel')
			closeButton = $('#close-icon')
			shrinkButton = $('#shrink-submit')
			searchPanel = $('#search-panel')
			menuSettingsButton = $('#menu-settings-button')
			menuSettingsPanel = $('#menu-settings')

			editButton.click ()->
				if(contentPanel.attr('show') == 'false')
					contentPanel.attr('show','true')
				else
					contentPanel.attr('show','false')

			closeButton.click ()->
				if(contentPanel.attr('show') == 'false')
					contentPanel.attr('show','true')
				else
					contentPanel.attr('show','false')

			shrinkButton.click ()->
				if(searchPanel.attr('shrink') == 'false')
					searchPanel.attr('shrink','true')
				else
					searchPanel.attr('shrink','false')

			menuSettingsButton.click ()->
				if(menuSettingsPanel.attr('show') == 'false')
					menuSettingsPanel.attr('show','true')
				else
					menuSettingsPanel.attr('show','false')
	}
