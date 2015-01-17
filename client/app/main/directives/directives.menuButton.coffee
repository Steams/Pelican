angular.module 'lander.directives.menuButton', []
.directive 'menuButton',() ->
  return {
    restrict : 'A'
    scope :true
    link : ($scope,el,attrs)->

      $scope.menuClose = ->
        $('#menu-button').trigger('click')

      addState = (element,state)->
        element.setAttribute(state.name,state.value)
        console.log element

      DeleteAndRecreateElement= (element,tag,id,curentStates,child) ->
        parent = element.parent()
        console.log parent
        element.remove()
        element = document.createElement tag
        element.id = id

        curentStates.forEach (state)->
          addState(element,state)

        element.appendChild(child)
#        parent.appendChild(element)
        document.getElementById('header-holder').appendChild(element)
        build = new Event 'build'
        element.addEventListener 'build', BuildListener
        element.dispatchEvent build

      BuildListener = ()->
        $('#menu-button').click(ClickListener)
        undefined

      ClickListener = ()->
        if $('#menu-button').attr('on') == 'false'
#          alert('on is false')
#          $('#menu-button').attr 'on','true'
          $('#menu-button').attr('on',"true")
#          setTimeout showMenu, 10
  #        add event listener for menubutton in the menu directive and then show function there
          $('#menu-button').attr('class','menu-button-close-start-animation')

          playCloseAnimation = ->
            $('#menu-button').attr('class','menu-button-close-end-animation')
            icon = document.createElement 'h1'
            icon.className='fa fa-book'
            setTimeout( ()->
              $('#menu-button').attr 'class','menu-button-close-hover-animation'

              ,500)
#            st2 = setTimeout DeleteAndRecreateElement(
#                $('#menu-button'),'div','menu-button',
#                [
#                  {name:'class',value:'menu-button-close-hover-animation'},
#                  {name:'on',value:'true'},
#                  {name:'menuButton',value:''}
#                ],
#                icon
#            ),1000
#            undefined
#            st2()
          st1 = setTimeout playCloseAnimation,200
          st1()

        else
#          alert('on not false')
#          setTimeout hideMenu, 20
  #        do hide menu fron menu directive
          $('#menu-button').attr 'on','false'
          playReturnToNormalAnimation = ->
            $('#menu-button').attr('class','menu-button-default-noHover-animation')
            setTimeout( ()->
              $('#menu-button').attr 'class','menu-button-default-animation'

              ,500)
#            icon = document.createElement 'h1'
#            icon.className='fa fa-book'
#            st2 = setTimeout DeleteAndRecreateElement(
#              $('#menu-button'),'div','menu-button',
#                [
#                  {name:'class',value:'menu-button-default-animation'},
#                  {name:'on',value:'false'},
#                  {name:'menuButton',value:''}
#                ],
#                icon
#              ),1000
#            undefined
#
#            st2()

          $('#menu-button').attr('class','menu-button-close-start-animation')
          st1 = setTimeout playReturnToNormalAnimation,200
          st1()
#          $('#menu-button').attr('on',"false")
          console.log el
          undefined
      $('#menu-button').click(ClickListener)
  }
