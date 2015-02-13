angular.module 'lander.directives.navigator', []
.directive 'navigatorPanel', () ->
	return {
		restrict : 'E'
		scope :true
		controller: 'globalCtrl'
		replace : true
		templateUrl: 'app/main/appGlobals/partials/navigator.html'
		link:(scope,el,attrs)->
			navOps = $('.navigator-option')
			navOpsHolder = $('#navigator-options-holder')

			navOps.each (index)->
				$(this).click (index)->
					# alert('yigyg')
					navOpsHolder.attr('show','false')
					navOps.each (index2)->
						$(this).attr('active','false')
					$(this).attr('active','true')

			$('#navigator-menu-button').click ()->
				if(navOpsHolder.attr('show') == 'false')
					navOpsHolder.attr('show','true')
				else
					navOpsHolder.attr('show','false')
	}
