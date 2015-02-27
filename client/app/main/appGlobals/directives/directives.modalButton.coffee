angular.module 'lander.directives.modalButton', []
.directive 'modalButton', () ->
  return {
    restrict : 'A'
    scope :true
    controller: 'globalCtrl'
    replace : true
    link:(scope,el,attrs)->
      openModal = ()->
        el.unbind()
        el.find('#modal').css('display','flex')
        setTimeout ()->
          el.find('#modal').attr('active','true')
          el.click openModal
        ,300

      el.unbind().bind('click',openModal)
  }
