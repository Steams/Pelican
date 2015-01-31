angular.module 'lander.directives.communitiesList', []
.directive 'communitiesList', () ->
  return {
    restrict : 'E'
    scope :true
    replace : true
    templateUrl: 'app/main/communities/communitiesList.html'
    controller : "communitiesCtrl"
  }
