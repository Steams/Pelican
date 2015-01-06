angular.module 'lander.directives.list', []
.directive 'list', () ->
  return {
    restrict : 'E'
    scope : {
      data : '='
    }
    replace : true
    templateUrl: 'app/main/partials/list.html'
    controller : "@"
    name : "controllerName"
  }
