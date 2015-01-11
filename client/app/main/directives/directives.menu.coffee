angular.module 'lander.directives.menu', []
.directive 'menu', () ->
  return {
    restrict : 'E'
    scope :true
    replace : true
    templateUrl: 'app/main/partials/menu.html'
    controller : "MainCtrl"
    link :(scope,el,attrs)->
      menu = document.querySelector '#menu'
      showMenu = ->
        menu.style.left = "0px"

      hideMenu = ->
        menu.style.left="-999px"

      searchBar = document.querySelector '#filter'
      searchButton = document.querySelector '#search-icon'

      hideSearchBar = ->
        if searchBar.value == ''
          searchBar.style.width = '0px'
          searchButton.style.right = '200px'
          setTimeout(()->
            searchBar.style.display = 'none'
          ,500)


      showSearchBar =  ->
        searchBar.style.display = 'block'
        setTimeout(()->
          searchBar.style.width = '90%'
          searchBar.focus()
          searchButton.style.right = '30px'
        ,10)


      searchButton.addEventListener 'click',showSearchBar
      searchBar.addEventListener 'blur', hideSearchBar

      # Menu settings_______________________________________________________________
      menuSettings = document.querySelector '#menu-settings'
      settingsButton = document.querySelector '#menu-settings-button'
      settingsClose = document.querySelector '#menu-settings-close'
      subjectInputs = document.querySelectorAll '.subject-input'
      subjectLabels = document.querySelectorAll '.subject-label'

      showSettingsElementsLabels = ->
        [].forEach.call(subjectLabels, (label) ->
          label.style.display='block'
          setTimeout(()->
            label.style.opacity = '1'
          ,10)
        )

      showSettingsElementsInputs = ->
        [].forEach.call(subjectInputs, (input) ->
          input.style.display='block'
          setTimeout(()->
            input.style.opacity = '1'
          ,10)
        )
      showSettingsElements = ->
        showSettingsElementsInputs()
        showSettingsElementsLabels()


      showSettings = ->
        menuSettings.style.display='block'
        setTimeout(()->
          menuSettings.style.height = '200px'
          menuSettings.style.borderBottom ='4px solid #5eb793'
          # menuSettings.style.borderTop ='5px solid #5eb793'
          menuSettings.setAttribute('on',true)
          setTimeout(showSettingsElements,500)
        ,20)


        undefined

      hideSettings = ->
        setTimeout(()->
          [].forEach.call(subjectInputs, (input) ->
            input.style.opacity = '0'
            setTimeout(()->
              if menuSettings.getAttribute('on') =='false'
                input.style.display='none'
            ,10)
          )
          [].forEach.call(subjectLabels, (label) ->
            label.style.opacity = '0'
            setTimeout(()->
              if menuSettings.getAttribute('on') =='false'
                label.style.display='none'
            ,10)
          )
        ,100)

        menuSettings.style.height = '0px'
        menuSettings.style.borderBottom ='0'
        # menuSettings.style.borderTop ='0'
        setTimeout(()->
          if menuSettings.getAttribute('on') =='false'
            menuSettings.style.display='none'
        ,500)
        menuSettings.setAttribute('on',false)

        undefined

      toggleSettings =->
        if menuSettings.getAttribute('on')=='false'
          showSettings()
        else
          hideSettings()

      settingsButton.addEventListener 'click',toggleSettings
      settingsClose.addEventListener 'click',toggleSettings

      # Menu Button___________________________________________________________________
      menuButton = document.querySelector '#menu-button'
      menuButton.addEventListener 'click', ()->
        console.log menuButton.getAttribute('on')
        if menuButton.getAttribute('on') != 'true'
          setTimeout hideMenu, 20
        else
          setTimeout showMenu, 20
  }
