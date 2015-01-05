create = ->
  menuButton = document.querySelector '#menu-button'

  BuildListener = ->
    menuButton.addEventListener 'click', ClickListener
    undefined

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
  console.log menuButton
  menuButton.addEventListener 'click', ClickListener
setTimeout create,1000
