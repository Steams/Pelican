angular.module 'lander.directives.list', []
.directive 'list', () ->
  return {
    restrict : 'E'
    scope :true
    replace : true
    templateUrl: 'app/main/partials/noteList.html'
    controller : "viewCtrl"
  }
