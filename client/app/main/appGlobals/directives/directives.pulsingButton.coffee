angular.module 'lander.directives.pulsingButton',[]
.directive 'pulsingButton', ($document)->
  return{
    restrict:'A'
    scope:true
    link:(scope,element,attr)->

#     Show button on mouse scroll down 30 unit/pings, hide when mouse moves up
      trackMouseY = 0 #tracks how often the mouse has moved down
      currentMouseY = 0
      lastMouseY = 0

      toggleButton = ()->
        if trackMouseY > 20 #if mouse has moved down 30 times show button and reset tracker
          trackMouseY = 20
          element[0].style.top = '85px'
          setTimeout(()->
            element[0].style.top = '70px'
          , 270
          )
          setDimensions('50px','50px')
        else
          if trackMouseY < 0
            trackMouseY = 0

            if element[0].style.top != '-70px'
              element[0].style.top = '85px'
              setTimeout(()->
                element[0].style.top = '-70px'
                setDimensions('1px','1px')
              , 270
              )

      $document.on 'mousemove',(event)->
        #sets lastmouse to what used to be the current position, then updates the current position
        lastMouseY = currentMouseY
        currentMouseY = event.pageY

        # console.log 'current mouse: ' + currentMouseY + 'last mouse: ' + lastMouseY

        if currentMouseY > lastMouseY && currentMouseY != lastMouseY  #if mouse moves down
          trackMouseY--
          # console.log 'track: ' + trackMouseY
        else #if mouse moves up
          if  currentMouseY < lastMouseY
            trackMouseY++
            # console.log 'track: ' + trackMouseY
        toggleButton()

      setDimensions = (height,width)->
        element[0].style.height = height
        element[0].style.width =  width
        element[0].style.lineHeight = height

      growAnticipation = ()->
        setDimensions('45px','45px')

      grow = ()->
        setDimensions('54px','54px')

      shrinkRecoil =()->
        undefined

      shrink =()->
        setDimensions('50px','50px')

      pulse = ()->
        grow()
        setTimeout shrink,200

      pulseTwice = ()->
        pulse()
        setTimeout pulse,300

      setInterval pulseTwice,2000
  }
