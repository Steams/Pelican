angular.module 'lander.directives.list', []
.directive 'noteList', () ->
  return {
    restrict : 'E'
    scope :true
    replace : true
    templateUrl: 'app/main/notes/noteList.html'
    controller : "viewCtrl"
  }
