angular.module 'lander.directives.sortSwitch', []
.directive 'sortSwitch', () ->
	return {
		restrict : 'A'
		link:(scope,el,attr)->
			$('.search-sorting-option').each (index)->
				$(this).click (index)->
					# alert('yigyg')
					$('.search-sorting-option').each (index2)->
						$(this).attr('active','false')
					$(this).attr('active','true')
    # controller : "authorsCtrl"
}