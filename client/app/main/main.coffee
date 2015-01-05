'use strict'

angular.module 'landerApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'main',
    url: '/'
    templateUrl: 'app/main/partials/header.html'
    controller: 'MainCtrl'
