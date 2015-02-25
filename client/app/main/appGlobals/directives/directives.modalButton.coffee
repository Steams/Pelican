angular.module 'lander.directives.modalButton', []
.directive 'modalButton', () ->
	return {
		restrict : 'A'
		scope :true
		controller: 'globalCtrl'
		replace : true
		link:(scope,el,attrs)->
			console.log 'BOOTING MODAL'
			openModal = ()->
				# alert 'asd'
				el.unbind()
				el.find('#modal').css('display','flex')
				setTimeout ()->
					$('#modal').attr('active','true')
					el.click openModal
				,300

			el.unbind().bind('click',openModal)
	}