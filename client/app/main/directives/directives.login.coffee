angular.module 'lander.directives.login', []
.directive 'login', () ->
  return {
    restrict : 'E'
    # scope : true
    replace : true
    templateUrl: 'app/main/partials/login.html'
    # controller : ""
    link :(scope,el,attr)->
      console.log 'asdas'
      alert('asdas')
#    alert('lhouj')
#    console.log('kvrwxcvbnm')
#    activateItem = ()->
#      alert('iiygyg')
#      this.attr(active)
#   $(".login-list-item-title").each(()->this.click(activateItem()))

  }
