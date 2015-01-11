'use strict'

angular.module 'landerApp'
.controller 'MainCtrl',['$scope','$resource','$http','$state','$sce',($scope,$resource,$http,$state,$sce) ->

  $scope.holder = {}
  editor =  document.getElementsByClassName('ta-bind')[0]
  Notes = $resource('/api/things/notes/:id',{id:'@id'})
  SubjectNotes = $resource('/api/things/notes/subjects/:id')
  $scope.notes =[]
  $scope.name="Radcliffe Robinson"
  menu = document.querySelector '#menu'
  # $scope.$watch('notes',() -> alert 'hey, myVar has changed!' )

  $scope.getNote = (id)->
#    console.log $scope
#    console.log id
    Notes.get({id:id},(data)->
      console.log 'getting note...'
      content = data.list[0].content
      editor.innerHTML= content
#      console.log $scope.$parent.$$nextSibling
      #  console.log $scope.$parent.$$nextSibling
#       console.log data.list[0]
#       console.log $scope
#       console.log $sce.trustAsHtml(data.list[0].content).valueOf()
      #  $scope.$parent.$$nextSibling.holder.htmlContent = $sce.trustAsHtml(data.content).valueOf()
       #  $scope.$parent.$parent.holder.htmlContent = "asduaisuhdoasjd"
    )
    # console.log note.content

  $scope.openNote =(index)->
    console.log($scope.$parent.$parent.notes)
    editor.innerHTML = $scope.$parent.$parent.notes[index].content
    menu.style.left="-999px"
#    $scope.menuClose()
#  $scope.openNote('54af38dfdc9ef9da1f58084b')

  $scope.loadList = (subject)->
   console.log(subject)
   if subject
     if subject != "all" && subject != "All"
        SubjectNotes.get({id:subject},(data)->
          console.log data.list
          $scope.$parent.notes = data.list
        )
      else
       Notes.query((result)->
         $scope.$parent.notes = result
         console.log result
         $scope.$parent.notes.push({subject:'blank'})
       )

  $scope.submitNote = ->
    console.log 'submiting note...'
    note = new Notes()
    note.title = $scope.submitTitle
    $scope.submitTitle = ''
    note.desc = $scope.submitDesc
    $scope.submitDesc =''
    note.author = $scope.submitAuthor
    $scope.submitAuthor=''
    note.subject = $scope.submitSubject
    $scope.submitSubject = ''
    note.content = $sce.trustAsHtml(document.getElementsByClassName('ta-bind')[0].innerHTML).valueOf()

    note.$save (result)->
      console.log(result)
      $scope.$parent.notes.splice(-1,0,result)


  $scope.createNote =()->
    console.log('hhbiyuyg')
    document.getElementsByClassName('ta-bind')[0].innerHTML = " "



  Notes.query((result)->
    $scope.notes = result
    console.log result
    $scope.notes.push({subject:'blank'})
    $scope.openNote(3)
  )


#
#  $http.get('/api/things').success (awesomeThings) ->
#    $scope.awesomeThings = awesomeThings
#
#
#  $scope.addThing = ->
#    return if $scope.newThing is ''
#    $http.post '/api/things',
#      name: $scope.newThing
#
#    $scope.newThing = ''
#
#  $scope.deleteThing = (thing) ->
#    $http.delete '/api/things/' + thing._id
]
