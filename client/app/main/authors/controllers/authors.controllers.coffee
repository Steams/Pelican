'use strict'

angular.module 'landerApp'
.controller 'authorsCtrl',['$scope','$resource','$sce','authorsFactory','$location',($scope,$resource,$sce,authorsFactory,$location) ->

  $scope.openAuthorNotes = (index,name)->
    $location.url(['authors/'+name])
    # $location.search('author',name)
    
  $scope.authors = ()-> return authorsFactory.authors
  $scope.selected = ()-> return authorsFactory.selected
  $scope.selectAuthor = (name)-> return authorsFactory.selectAuthor(name)
  $scope.init = ()->
    authorsFactory.indexAuthors()

  $scope.openAuthor =(name)->
    $scope.selectAuthor(name)
    # console.log('selected now : '+$scope.selected())
    # console.log(authorsFactory.selected)

  $scope.init()
]
