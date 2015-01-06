create = ->

  # Meun________________________________________________________________________
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

  showSearchBar =  ->
    searchBar.style.width = '90%'
    searchButton.style.right = '30px'

  searchButton.addEventListener 'click',showSearchBar
  searchBar.addEventListener 'blur', hideSearchBar

  # Menu settings_______________________________________________________________
  menuSettings = document.querySelector '#menu-settings'
  settingsButton = document.querySelector '#menu-settings-button'
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
          input.style.display='none'
        ,10)
      )
      [].forEach.call(subjectLabels, (label) ->
        label.style.opacity = '0'
        setTimeout(()->
          label.style.display='none'
        ,10)
      )
    ,100)

    menuSettings.style.height = '0px'
    menuSettings.style.borderBottom ='0'
    # menuSettings.style.borderTop ='0'
    setTimeout(()->
      menuSettings.style.display='none'
    ,700)
    menuSettings.setAttribute('on',false)

    undefined

  toggleSettings =->
    if menuSettings.getAttribute('on')=='false'
      showSettings()
    else
      hideSettings()

  settingsButton.addEventListener 'click',toggleSettings

# Menu Button___________________________________________________________________
  menuButton = document.querySelector '#menu-button'

  BuildListener = ->
    menuButton.addEventListener 'click', ClickListener
    undefined

  ClickListener = ->
    if menuButton.getAttribute('on') == 'false'
      setTimeout showMenu, 20

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
      setTimeout hideMenu, 20
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
        menuButton.className = 'menu-button-default-noHover-animation'
        setTimeout callbackTwo,500
        undefined

      menuButton.className = 'menu-button-close-start-animation'
      setTimeout callback,200
      undefined

  console.log menuButton
  menuButton.addEventListener 'click', ClickListener

setTimeout create,1500
