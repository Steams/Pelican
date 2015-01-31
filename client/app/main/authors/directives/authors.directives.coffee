angular.module 'lander.directives.authorsList', []
.directive 'authorsList', () ->
  return {
    restrict : 'E'
    scope :true
    replace : true
    templateUrl: 'app/main/authors/authorsList.html'
    controller : "authorsCtrl"
  }
