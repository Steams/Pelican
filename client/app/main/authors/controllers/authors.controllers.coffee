'use strict'

angular.module 'landerApp'
.controller 'authorsCtrl',['$scope','$resource','$sce','authorsFactory',($scope,$resource,$sce,authorsFactory) ->

  $scope.authors = ()-> return authorsFactory.authors #keep authors up to date by always checking factory when referecing it
  $scope.selected = ()-> return authorsFactory.selected
  $scope.selectAuthor = (index)-> return authorsFactory.selectAuthor(index)
  $scope.init = ()->
    authorsFactory.indexAuthors()
    $scope.checkLogin()
    $scope.editor =  document.getElementById('editor')
    setTimeout(()->
      $scope.openAuthor 0
    ,30)

  $scope.holder = {}
#  editor =  document.getElementById('editor')
  authors = $resource('/api/things/authors/:id',{id:'@id'})
  Login = $resource('/login')
  CheckLogin = $resource('/loginInfo')
  Subjectauthors = $resource('/api/things/authors/subjects/:id')
  menu = document.querySelector '#menu'

#  $scope.getNote = (id)->
#    authors.get({id:id},(data)->
#      console.log 'getting note...'
#      content = data.list[0].content
#      editor.innerHTML= content
#    )

  $scope.openAuthor =(index)->
    $scope.selectAuthor(index)
  #   console.log('index : '+index)
    console.log('selected now : '+$scope.selected())
    console.log(authorsFactory.selected)
  #   editor =  document.getElementById('editor')
  #   editor.innerHTML = $scope.selected().content
  #   view = {}
  #   view.noteId = $scope.selected().id
  #   view.userName = $scope.name
  #   authorsFactory.view(view);
    # console.log('Viewing note title : '+ $scope.authors()[index].title +'Viewed by : '+view.userName)

    # editor.innerHTML = $scope.authors().find({title:index}).content



  $scope.init()
]