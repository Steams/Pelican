'use strict'

angular.module 'landerApp'
.controller 'communitiesCtrl',['$scope','$resource','$sce','communitiesFactory',($scope,$resource,$sce,communitiesFactory) ->

  $scope.communities = ()-> return communitiesFactory.communities #keep communities up to date by always checking factory when referecing it
  $scope.selected = ()-> return communitiesFactory.selected
  $scope.selectCommunity = (index)-> return communitiesFactory.selectNote(index)
  $scope.init = ()->
    communitiesFactory.indexCommunities()
    $scope.checkLogin()
    $scope.editor =  document.getElementById('editor')
    setTimeout(()->
      $scope.openNote 0
    ,30)

  $scope.holder = {}
#  editor =  document.getElementById('editor')
  communities = $resource('/api/things/communities/:id',{id:'@id'})
  Login = $resource('/login')
  CheckLogin = $resource('/loginInfo')
  Subjectcommunities = $resource('/api/things/communities/subjects/:id')
  menu = document.querySelector '#menu'

#  $scope.getNote = (id)->
#    communities.get({id:id},(data)->
#      console.log 'getting note...'
#      content = data.list[0].content
#      editor.innerHTML= content
#    )

  $scope.openNote =(index)->
    $scope.selectCommunty(index)
    console.log('index : '+index)
    console.log('selected now : '+$scope.selected())
    # console.log(communitiesFactory.selected)
    editor =  document.getElementById('editor')
    editor.innerHTML = $scope.selected().content
    view = {}
    view.noteId = $scope.selected().id
    view.userName = $scope.name
    communitiesFactory.view(view);
    # console.log('Viewing note title : '+ $scope.communities()[index].title +'Viewed by : '+view.userName)

    # editor.innerHTML = $scope.communities().find({title:index}).content

  # $scope.likeNote = ()->
  #   console.log('selected :'+ $scope.selected)
  #   editor = document.getElementById('editor')
  #   like = {}
  #   like.noteId = $scope.selected().id
  #   like.userName = $scope.name;
  #   # make service for liking note
  #   if communitiesFactory.like(like) != 500
  #     $scope.selected().likeCount++
  #   # console.log('Liked note title : '+$scope.communities()[index].title+'Liked note User :'+like.userName)

  # $scope.loadList = (subject)->
  #  communitiesFactory.loadList(subject)

  # $scope.submitNote = ->
  #   console.log 'submiting note...'
  #   note = new communities()
  #   note.title = $scope.submitTitle
  #   $scope.submitTitle = ''
  #   note.desc = $scope.submitDesc
  #   $scope.submitDesc =''
  #   note.author = $scope.submitAuthor
  #   $scope.submitAuthor=''
  #   note.subject = $scope.submitSubject
  #   $scope.submitSubject = ''
  #   note.content = $sce.trustAsHtml(document.getElementById('editor').innerHTML).valueOf()
  #   communitiesFactory.submit(note)

  $scope.login = ->
    login = new Login()
    login.username = $scope.username
    login.password = $scope.password
    console.log(login)

    login.$save (result)->
      console.log result
      if result.user.name
        $scope.$parent.name = result.user.name
      else
        alert('user does not exist')


  $scope.checkLogin = ->
    CheckLogin.get({},(data)->
      console.log 'getting login'
      console.log data
      $scope.name = data.user.name)

  # $scope.createNote =()->
  #   console.log('hhbiyuyg')
  #   document.getElementById('editor').innerHTML = " "

  $scope.init()
]