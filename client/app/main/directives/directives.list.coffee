angular.module 'lander.directives.list', []
.directive 'list', () ->
  return {
    restrict : 'E'
    scope :true
    replace : true
    templateUrl: 'app/main/partials/list.html'
    controller : "MainCtrl"
  }
