angular.module 'lander.directives.notebooksList', []
.directive 'notebooksList', () ->
  return {
    restrict : 'E'
    scope :true
    replace : true
    templateUrl: 'app/main/notebooks/notebooksList.html'
    controller : "notebooksCtrl"
  }
