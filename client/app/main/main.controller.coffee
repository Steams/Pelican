'use strict'

angular.module 'landerApp'
.controller 'MainCtrl', ($scope, $http) ->
  $scope.awesomeThings = []
  $scope.name="Radcliffe Robinson"
  $http.get('/api/things').success (awesomeThings) ->
    $scope.awesomeThings = awesomeThings


  $scope.addThing = ->
    return if $scope.newThing is ''
    $http.post '/api/things',
      name: $scope.newThing

    $scope.newThing = ''

  $scope.deleteThing = (thing) ->
    $http.delete '/api/things/' + thing._id

  menuButton = document.querySelector('#menu-button')

  BuildListener = ->
    menuButton.addEventListener 'click', ClickListener

  ClickListener = ->
    if menuButton.getAttribute('on') == 'false'
      menuButton.className = 'menu-button-close-start-animation'

      callbackTwo = ->
        menuButton.className = 'menu-button-close-hover-animation'
        parent = menuButton.parentNode
        parent.removeChild menuButton
        menuButton = document.createElement 'div'
        menuButton.id= 'menu-button'
        menuButton.setAttribute 'class','menu-button-close-hover-animation'
        menuButton.setAttribute 'on','true'
        icon = document.createElement 'h1'
        icon.className='fa fa-book'
        menuButton.appendChild(icon)
        parent.appendChild(menuButton)
        build = new Event 'build'
        menuButton.addEventListener 'build', BuildListener

        menuButton.dispatchEvent build

      callback = ->
        menuButton.className = 'menu-button-close-end-animation'
        setTimeout callbackTwo,500

      setTimeout callback,200

      menuButton.setAttribute('on',true)
    else
      callbackTwo = ->
        parent = menuButton.parentNode
        parent.removeChild menuButton
        menuButton = document.createElement 'div'
        menuButton.id= 'menu-button'
        menuButton.setAttribute 'class', 'menu-button-default-animation'
        menuButton.setAttribute 'on','false'
        icon = document.createElement 'h1'
        icon.className='fa fa-book'
        menuButton.appendChild(icon)
        parent.appendChild(menuButton)
        build = new Event 'build'
        menuButton.addEventListener 'build', BuildListener
        menuButton.dispatchEvent build
        menuButton.setAttribute('on',false)

      callback = ->
        menuButton.className = 'menu-button-default-animation'
        setTimeout callbackTwo,220

      menuButton.className = 'menu-button-close-start-animation'

      setTimeout callback,200


  menuButton.addEventListener 'click', ClickListener
