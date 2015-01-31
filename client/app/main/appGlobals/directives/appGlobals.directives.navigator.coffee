angular.module 'lander.directives.navigator', []
.directive 'navigatorPanel', () ->
  return {
    restrict : 'E'
    scope :true
    replace : true
    templateUrl: 'app/main/appGlobals/partials/navigator.html'
    # controller : "authorsCtrl"
  }
