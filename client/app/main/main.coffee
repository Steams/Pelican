'use strict'

angular.module 'landerApp'
.config ($stateProvider) ->
  $stateProvider
  .state('main',{
    url: '/'
    templateUrl: 'app/main/index.html'
    controller: ''}
  )
  # .state('main.submit',{
  #   url: 'submit'
  #   templateUrl: 'app/main/partials/editor.html'
  #   controller: 'MainCtrl'}
  # )
  # .state 'main.submit',
  #   url:'/submit'
  #   templateUrl:'app/main/partials/submit.html'
  #   controller: 'MainCtrl'
