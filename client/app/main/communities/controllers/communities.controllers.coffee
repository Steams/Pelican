'use strict'

angular.module 'landerApp'
.controller 'communitiesCtrl',['$scope','$resource','$sce','communitiesFactory',($scope,$resource,$sce,communitiesFactory) ->

  $scope.communities = ()-> return communitiesFactory.communities #keep communities up to date by always checking factory when referecing it
  $scope.selected = ()-> return communitiesFactory.selected
  $scope.selectCommunity = (index)-> return communitiesFactory.selectCommunity(index)
  $scope.init = ()->
    communitiesFactory.indexCommunities()

  $scope.init()
]