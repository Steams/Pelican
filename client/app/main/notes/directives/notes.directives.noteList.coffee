angular.module 'lander.directives.noteList', []
.directive 'noteList', () ->
  return {
    restrict : 'E'
    scope :true
    replace : true
    templateUrl: 'app/main/notes/noteList.html'
    controller : "viewCtrl"
  }
