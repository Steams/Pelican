angular.module 'home.directives.home', []
.controller 'homeCtrl',['$scope',($scope)->
  $scope.columnOne = [
    {header:'Shannon',color:'green'},
    {header:'second header',color:'purple'},
    {header:'third header',color:'green'}
    {header:'forth header',color:'purple'}
  ]

  $scope.columnTwo = [
    {header:'Uwi Mona',color:'green'},
    {header:'Utech',color:'orange'},
    {header:'College name',color:'black'}
    {header:'College name',color:'purple'}
  ]


  $scope.columnThree = [
    {header:'Log In',color:'green'},
    {header:'Development Team',color:'orange'},
    {header:'More about Lander',colo:'black'}
#    {header:'forth header',color:'purple'}
  ]
]

.directive 'home', () ->
  return {
  restrict : 'E'
#    scope : true
  replace : true
  templateUrl: 'app/main/home/home.html'
  controller : "homeCtrl"
  link:(scope,el,attrs)->
#      alert('asdas')
  }

.directive 'homeListItem', ()->
  return{
    restrict : 'E'
    replace : true
    templateUrl : 'app/main/home/listItem.html'
    controller : 'homeCtrl'
  }
