angular.module 'lander.directives.modal', []
.directive 'modal', () ->
	return {
		restrict : 'E'
		# scope :true
		# controller: 'globalCtrl'
		replace : true
		transclude:true
		templateUrl: 'app/main/appGlobals/partials/modal.html'
		link:(scope,el,attrs)->

			closeModal = ()->
				$('#modal').attr('active','false')
				setTimeout ()->
					$('#modal').css('display','none')
				,300

			$('#modal-closeButton').unbind('click').click closeModal
	}