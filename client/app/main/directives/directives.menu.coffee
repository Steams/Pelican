angular.module 'lander.directives.menu', []
.directive 'menu', () ->
  return {
    restrict : 'E'
    scope : {
      data : '='
    }
    replace : true
    templateUrl: 'app/main/partials/menu.html'
  }
