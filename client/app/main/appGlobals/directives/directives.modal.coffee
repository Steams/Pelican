angular.module 'lander.directives.modal', []
.directive 'modal', () ->
  return {
    restrict : 'E'
    replace : true
    transclude:true
    templateUrl: 'app/main/appGlobals/partials/modal.html'
    link:(scope,el,attrs)->

      closeModal = ()->
        $('.modal').attr('active','false')
        setTimeout ()->
          $('.modal').css('display','none')
        ,300

      $('.closeModal').unbind('click').click closeModal
  }
