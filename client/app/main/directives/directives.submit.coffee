angular.module 'lander.directives.submit', []
.directive 'submission', () ->
  return {
    restrict : 'E'
    scope : true
    replace : true
    templateUrl: 'app/main/partials/submit.html'
    controller : "MainCtrl"
    link:(scope,el,attr)->
      submitDrawerButton = document.getElementById("openSubmitDrawer")
#      submitToolbarButton = document.getElementById("openToolbar")
#      toolbar = document.getElementsByClassName('ta-toolbar')[0]

      expandEditor = ()->
        $('#editor').css('top','0px')
        $('#editor').css('left','0px')
        $('#editor').css('height','100%')
        $('#editor').css('width','100%')
        $('#editor').attr('on','true')

      compressEditor = ()->
        $('#editor').attr('on','false')
        $('#editor').css('top','100px')
        $('#editor').css('left','30px')
        $('#editor').css('height','90%')
        $('#editor').css('width','93%')



      toggleEditorExpand = ()->
        if $('#editor').attr('on')== 'true'
          compressEditor()
        else
          if $('#editor').attr('on')== 'false'
            expandEditor()

      toggleEditorExpandPause= ()->
        if $('#editor').attr('on')== 'true-paused'
          compressEditor()
        else
          if $('#editor').attr('on')== 'false'
            expandEditor()
            $('#editor').attr('on','true-paused')

      pauseCompress = ()->
        if $('#editor').attr('on') != 'true-paused'
          compressEditor()
          $('#editor').attr('on','paused')

      UnPauseCompress = ()->
        if $('#editor').attr('on') != 'true-paused'
          $('#editor').attr('on','false')

      $('#expand-icon').click(toggleEditorExpandPause)
      $('#editor').hover(toggleEditorExpand)

      mq = window.matchMedia("(max-width: 649px)")
      if (matchMedia)
        WidthChange= (mq)->
          if (mq.matches)
            $('#toolbar').css('top','-70px')
          else
#            alert('ouhiuh')
            $('#toolbar').css('top','10px')
        mq.addListener(WidthChange)
        WidthChange(mq)


      $('#editor').click(()->
          console.log($('#toolbar'))
          if (mq.matches)
           $('#toolbar').css('top','0px')
        )

      $('#editor').blur(()->
        if (mq.matches)
         $('#toolbar').css('top','-70px'))

      document.getElementsByClassName('ta-bind')[0].addEventListener 'focus',pauseCompress
      document.getElementsByClassName('ta-bind')[0].addEventListener 'blur',UnPauseCompress
      console.log document.getElementsByClassName('ta-toolbar')[0]
      submitDrawer = document.getElementById("submitDrawer")
      toggleSubmitDrawer = ->
        if submitDrawer.getAttribute('on') =='true'
          submitDrawer.style.width= '0px'
          submitDrawerButton.style.transform='rotate(0deg)'
          submitDrawer.setAttribute('on','false')
        else
          submitDrawer.style.width= '340px'
          submitDrawerButton.style.transform='rotate(180deg)'
          submitDrawer.setAttribute('on','true')

      toggleToolbar = ->
        if submitToolbarButton.getAttribute('on') =='true'
          submitToolbarButton.setAttribute('on','false')
          toolbar.style.width= '0px'
          submitToolbarButton.style.transform='rotate(0deg)'
          setTimeout(()->
            if submitToolbarButton.getAttribute('on') =='false'
              toolbar.style.display ='none'
          ,500)

        else
          toolbar.style.display="block"
          setTimeout(()->
            toolbar.style.width= '250px'
            submitToolbarButton.style.transform='rotate(180deg)'
          ,10)

          submitToolbarButton.setAttribute('on','true')

      submitDrawerButton.addEventListener 'click',toggleSubmitDrawer

      submitToolbarButton.addEventListener 'click',toggleToolbar


  }
