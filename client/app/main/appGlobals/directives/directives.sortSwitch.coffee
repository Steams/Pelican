angular.module 'lander.directives.sortSwitch', []
.directive 'sortSwitch', () ->
	return {
		restrict : 'A'
		link:(scope,el,attr)->
			sortOps = $('.search-sorting-option')
			sortOps.each (index)->
				$(this).click (index)->
					sortOps.each (index2)->
						$(this).attr('active','false')
					$(this).attr('active','true')
}