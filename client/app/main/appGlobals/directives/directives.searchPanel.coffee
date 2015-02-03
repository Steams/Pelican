angular.module 'lander.directives.searchPanel', []
.directive 'searchPanel', () ->
	return {
		restrict : 'E'
		# scope :{'heading':'heading'}
		controller: 'globalCtrl'
		replace : true
		transclude:true
		templateUrl: 'app/main/appGlobals/partials/searchPanel.html'
		link:(scope,el,attr)->
			$('#toggle-search-panel').click ()->
				# alert('asd')
				if($('#search-panel').attr('shrink') == 'false')
					$('#search-panel').attr('shrink','true')
				else
					$('#search-panel').attr('shrink','false')
	}
