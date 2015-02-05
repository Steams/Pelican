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
			$('#editButton').click ()->
                if($('.content-panel').attr('show') == 'false')
                    $('.content-panel').attr('show','true')
                else
                    $('.content-panel').attr('show','false')
                return undefined
            $('#close-icon').click ()->
#                alert('adsad')
                if($('.content-panel').attr('show') == 'false')
                    $('.content-panel').attr('show','true')
                else
                    $('.content-panel').attr('show','false')
                    
            
			$('#shrink-submit').click ()->
				if($('#search-panel').attr('shrink') == 'false')
					$('#search-panel').attr('shrink','true')
				else
					$('#search-panel').attr('shrink','false')
	}
