angular.module 'lander.directives.navigator', []
.directive 'navigatorPanel', () ->
	return {
		restrict : 'E'
		scope :true
		controller: 'globalCtrl'
		replace : true
		templateUrl: 'app/main/appGlobals/partials/navigator.html'
		link:(scope,el,attrs)->
            $('.navigator-option').each (index)->
                $(this).click (index)->
                    # alert('yigyg')
                    $('#navigator-options-holder').attr('show','false')
                    $('.navigator-option').each (index2)->
                        $(this).attr('active','false')
                    $(this).attr('active','true')
					# scope.setHeading($(this).attr('name'))
					# alert(scope.heading)
            $('#navigator-menu-button').click ()->
#                alert('asds')
#                if($('#content-panel').attr('show') == 'false')
#                    $('#content-panel').attr('show','true')
#                else
#                    $('#content-panel').attr('show','false')
                if($('#navigator-options-holder').attr('show') == 'false')
                    $('#navigator-options-holder').attr('show','true')
                else
                    $('#navigator-options-holder').attr('show','false')
#            $('#menu-settings-button').click ()->
#                alert('awsds')
#                $('#content-panel').attr('show','true')
	}
