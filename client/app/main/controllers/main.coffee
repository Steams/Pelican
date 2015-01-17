'use strict'

angular.module 'landerApp'
.config ($stateProvider) ->
  $stateProvider
  .state('main',{
    url: '/'
    templateUrl: 'app/main/index.html'
    controller: ''}
#  adding controller above might fix/break scoping problems
  )
  .state('main.submit',{
     url: 'submit'
     templateUrl: 'app/main/submit.html'
     controller: 'MainCtrl'}
  )
  .state('main.login',{
     url:'login'
     templateUrl:'app/main/partials/login.html'
     controller: 'MainCtrl'}
  )
