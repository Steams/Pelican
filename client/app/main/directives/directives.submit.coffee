angular.module 'lander.directives.submit', []
.directive 'submission', () ->
  return {
    restrict : 'E'
    scope : true
    replace : true
    templateUrl: 'app/main/partials/submit.html'
    controller : "MainCtrl"
  }
