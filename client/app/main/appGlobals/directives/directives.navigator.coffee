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

			$('#navigator').mouseenter ()->
				# alert('asd')
				$('#navigator').attr('hover','true')
			$('#navigator').mouseleave ()->
				# alert('asd')
				$('#navigator').attr('hover','false')
			navOps.each (index)->
				$(this).click (index)->
					# turn off hover
					$('#navigator').attr('hover','false')
					navOpsHolder.attr('show','false')
					navOps.each (index2)->
						$(this).attr('active','false')
					$(this).attr('active','true')

			$('#navigator-menu-button').click ()->
				if(navOpsHolder.attr('show') == 'false')
					navOpsHolder.attr('show','true')
				else
					navOpsHolder.attr('show','false')

			body = document.getElementsByTagName('body')[0]
			bodyEvents = new Hammer(body);

			bodyEvents.on 'swiperight', (ev)->
				if(navOpsHolder.attr('show') == 'false')
					navOpsHolder.attr('show','true')
				else
					navOpsHolder.attr('show','false')

			bodyEvents.on 'tap',(ev)->
				if ev.target.id != 'navigator-options-holder'
					navOpsHolder.attr('show','false')
	}
