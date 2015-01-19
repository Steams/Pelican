angular.module 'lander.directives.header', []
.directive 'myHeader', () ->
  return {
    restrict : 'E'
#    scope : true
    replace : true
    templateUrl: 'app/main/partials/header.html'
    controller : "MainCtrl"
    link:(scope,el,attrs)->
#      alert('asdas')
  }
