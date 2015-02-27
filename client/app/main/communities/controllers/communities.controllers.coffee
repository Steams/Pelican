'use strict'

angular.module 'landerApp'
.controller 'communitiesCtrl',['$scope','$resource','$sce','communitiesFactory',($scope,$resource,$sce,communitiesFactory) ->

  $scope.communities = ()-> return communitiesFactory.communities
  $scope.selected = ()-> return communitiesFactory.selected
  $scope.selectCommunity = (name)-> return communitiesFactory.selectCommunity(name)
  $scope.init = ()->
    communitiesFactory.indexCommunities()

  $scope.init()
]
