angular.module 'lander.directives.submit', []
.directive 'submission', () ->
  return {
    restrict : 'E'
    scope : {
      data : '='
    }
    replace : true
    templateUrl: 'app/main/partials/submit.html'
    controller : "@"
  name : "controllerName"
  }
