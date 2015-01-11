angular.module 'lander.directives.menuButton', []
.directive 'menuButton',() ->
  return {
    restrict : 'A'
    scope :{}
    link : (scope,el,attrs)->
      addState = (element,state)->
#        alert('asdas')
        element.setAttribute(state.name,state.value)

      DeleteAndRecreateElement= (element,tag,id,curentStates,child) ->
        parent = element.NodentNode
        parent.removeChild elementlement
        element = document.createElement tag
        element.id = id

        curentStates.forEach (state)->
          addState(element,state)

        element.appendChild(child)
        parent.appendChild(element)

        build = new Event 'build'
        element.addEventListener 'build', BuildListener
        element.dispatchEvent build

      BuildListener = ()->
        $('#menu-button').click(ClickListener)
        undefined

      ClickListener = ()->
        if $('#menu-button').attr('on') == 'false'
#          alert('on is false')
          $('#menu-button').attr('on',"true")
#          setTimeout showMenu, 10
  #        add event listener for menubutton in the menu directive and then show function there
          $('#menu-button').attr('class','menu-button-close-start-animation')

          playCloseAnimation = ->
            $('#menu-button').attr('class','menu-button-close-end-animation')
            icon = document.createElement 'h1'
            icon.className='fa fa-book'
            setTimeout DeleteAndRecreateElement(
                el,'div','menu-button',
                [
                  {name:'class',value:'menu-button-close-hover-animation'},
                  {name:'on',value:'true'},
                  {name:'menuButton',value:''}
                ],
                icon
            ),200
            undefined
          setTimeout playCloseAnimation,200

        else
#          alert('on not false')
#          setTimeout hideMenu, 20
  #        do hide menu fron menu directive
          playReturnToNormalAnimation = ->
            $('#menu-button').attr('class','menu-button-default-noHover-animation')
            setTimeout DeleteAndRecreateElement(
              el,'div','menu-button',
                [
                  {name:'class',value:'menu-button-default-animation'},
                  {name:'on',value:'false'},
                  {name:'menuButton',value:''}
                ],
                icon
              ),500
            undefined

          $('#menu-button').attr('class','menu-button-close-start-animation')
          setTimeout playReturnToNormalAnimation,200
          $('#menu-button').attr('on',"false")
          console.log el
          undefined
      $('#menu-button').click(ClickListener)
  }
