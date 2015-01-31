angular.module 'lander.directives.viewNotesTemplate', []
.directive 'viewNotesTemplate', () ->
  return {
    restrict : 'E'
    scope : true
    replace : true
    templateUrl: 'app/main/partials/viewNotesTemplate.html'
    controller : "MainCtrl"
}