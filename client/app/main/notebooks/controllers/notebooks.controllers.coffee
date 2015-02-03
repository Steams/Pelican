'use strict'

angular.module 'landerApp'
.controller 'notebooksCtrl',['$scope','$resource','$sce','notebooksFactory',($scope,$resource,$sce,notebooksFactory) ->

  $scope.notebooks = ()-> return notebooksFactory.notebooks #keep notebooks up to date by always checking factory when referecing it
  $scope.selected = ()-> return notebooksFactory.selected
  $scope.selectNotebook = (index)-> return notebooksFactory.selectNotebook(index)
  $scope.init = ()->
    notebooksFactory.indexNotebooks()

  $scope.init()
]