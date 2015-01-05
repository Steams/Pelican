angular.module 'lander.directives.header', []
.directive 'myHeader', () ->
  return {
    restrict : 'E'
    scope : {
      username : '='
    }
    replace : true
    transclude : true
    templateUrl: 'app/main/partials/header.html'
    terminal : true
  }
