angular.module 'lander.directives.eventsList', []
.directive 'eventsList', () ->
  return {
    restrict : 'E'
    scope :true
    replace : true
    templateUrl: 'app/main/events/eventsList.html'
    controller : "eventsCtrl"
  }
