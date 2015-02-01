angular.module 'lander.directives.navigator', []
.directive 'navigatorPanel', () ->
	return {
		restrict : 'E'
		scope :true
		replace : true
		templateUrl: 'app/main/appGlobals/partials/navigator.html'
		link:(scope,el,attrs)->
			$('.navigator-option').each (index)->
				$(this).click (index)->
					# alert('yigyg')
					$('.navigator-option').each (index2)->
						$(this).attr('active','false')
					$(this).attr('active','true')
	}
