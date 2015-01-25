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
    link:(scope,element,attr)->
      element.on 'mousemove',(event)->
#        console.log element
#        console.log element[0].firstChild.style.backgroundPositionX
#        console.log 'offset left: ' +element[0].offsetLeft
#        console.log 'offset Top: ' +element[0].offsetTop
        offsetX = event.pageX - element[0].offsetLeft
        offsetY = event.pageY - element[0].offsetTop - 60
#        console.log 'X: '+offsetX+' Y: '+ offsetY
        element[0].firstChild.style.backgroundPositionX = 'Calc(50% - ' + offsetX/15 + 'px)'
        element[0].firstChild.style.backgroundPositionY = 'Calc(50% - ' + offsetY/15 + 'px)'
        element[0].firstChild.offsetLeft +=offsetX
        element[0].firstChild.offsetTop +=offsetY

  }
