'use strict'

angular.module 'landerApp'
.controller 'eventsCtrl',['$scope','$resource','$sce','eventsFactory',($scope,$resource,$sce,eventsFactory) ->

  $scope.events = ()-> return eventsFactory.events
  $scope.selected = ()-> return eventsFactory.selected
  $scope.selectEvent = (index)-> return eventsFactory.selectEvent(index)
  $scope.init = ()->
    eventsFactory.indexEvents()

  $scope.init()
]
