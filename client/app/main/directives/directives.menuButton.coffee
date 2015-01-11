#angular.module 'lander.directives.menuButton', []
#.directive 'menuButton',() ->
#  return {
#    restrict : 'A'
#    scope :{}
#    link : (scope,el,attrs)->
#      console.log el
#      console.log attrs
#      console.log 'hcchyrdt'
#
#      addState = (element,state)->
#        element.setAttribute(state.name,state.value)
#
#      DeleteAndRecreateElement= (element,tag,id,curentStates,child) ->
#        alert($scope.on)
#        parent = element.parentNode
#        parent.removeChild element
#        element = document.createElement tag
#        element.id = id
#
#        curentStates.forEach (state)->
#          addState(element,state)
#
#        element.appendChild(child)
#        parent.appendChild(element)
#
#        build = new Event 'build'
#        element.addEventListener 'build', BuildListener
#        element.dispatchEvent build
#
#      BuildListener = ()->
#        el.bind 'click', ClickListener
#        undefined
#
#      ClickListener = ()->
#        if attrs.on == 'false'
##          setTimeout showMenu, 10
#  #        add event listener for menubutton in the menu directive and then show function there
#          el[0].className = 'menu-button-close-start-animation'
#
#          playCloseAnimation = ->
#            el[0].className = 'menu-button-close-end-animation'
#            icon = document.createElement 'h1'
#            icon.className='fa fa-book'
#
#            tm = ()->
#              setTimeout DeleteAndRecreateElement(
#                  el[0],'div','menu-button',
#                  [
#                    {name:'class',value:'menu-button-close-hover-animation'},
#                    {name:'on',value:'true'},
#                    {name:'menuButton',value:''}
#                  ],
#                  icon
#              ),8000
#              undefined
#            tm()
##both set timeouts share timer, make them seperate vars to fix...maybe
#          setTimeout playCloseAnimation,200
#
#          el[0].attributes.on.value = "true"
#        else
##          setTimeout hideMenu, 20
#  #        do hide menu fron menu directive
#          playReturnToNormalAnimation = ->
#            el.className = 'menu-button-default-noHover-animation'
#            setTimeout DeleteAndRecreateElement(
#                el,'div','menu-button',
#                [
#                  {name:'class',value:'menu-button-default-animation'},
#                  {name:'on',value:'false'},
#                  {name:'menuButton',value:''}
#                ],
#                icon
#              ),500
#            undefined
#
#          el[0].className = 'menu-button-close-start-animation'
#          setTimeout playReturnToNormalAnimation,200
#          el[0].attributes.on.value = "false"
#          console.log el
#          undefined
#      el.bind 'click', ClickListener
#  }
