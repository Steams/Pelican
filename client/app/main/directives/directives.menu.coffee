angular.module 'lander.directives.menu', []
.directive 'menu', () ->
  return {
    restrict : 'E'
    scope :true
    replace : true
    templateUrl: 'app/main/partials/menu.html'
    controller : "MainCtrl"
  }
