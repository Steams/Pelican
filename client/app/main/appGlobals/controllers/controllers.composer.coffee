'use strict'

angular.module 'landerApp'
.controller 'composerCtrl',['$scope','$resource','$sce','notesFactory','mainFactory',($scope,$resource,$sce,notesFactory,mainFactory) ->

  $scope.user = ()-> return mainFactory.user

  $scope.submitNote = ->
    console.log 'composerCtrl: Submiting note...'
    note = new Notes()
    note.title = $scope.submitTitle
    $scope.submitTitle = ''
    note.desc = $scope.submitDesc
    $scope.submitDesc =''
    note.author = $scope.user().name
    $scope.submitAuthor=''
    note.subject = $scope.submitSubject
    $scope.submitSubject = ''
    note.tags =$scope.submitTags
    $scope.submitTags =''
    note.content = $sce.trustAsHtml(document.getElementsByClassName('ta-bind')[0].innerHTML).valueOf()
    notesFactory.submit(note)

  $scope.createNote =()->
    console.log('composerCtrl : Creating Blank note...')
    document.getElementsByClassName('ta-bind')[0].innerHTML = " "
]
