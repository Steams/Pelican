'use strict'

angular.module 'landerApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'main',
    url: '/'
    templateUrl: 'app/main/index.html'
    controller: 'MainCtrl'
