angular.module 'lander.directives.expandingPanel', []
.directive 'expandingPanel', () ->
  return {
    restrict : 'A'
    link:($scope,el,attr)->
      create = ->
        # alert('asdasd')
        expandEditor = ()->
          if $('#editor').attr('on')!='paused' && $('#editor').attr('on')!='true-paused'
            $('#editor').css('top','0px')
            $('#editor').css('left','0px')
            $('#editor').css('height','100%')
            $('#editor').css('width','100%')
            $('#editor').attr('on','true')

        compressEditor = ()->
          if $('#editor').attr('on')!='paused' && $('#editor').attr('on')!='true-paused'
            $('#editor').attr('on','false')
            $('#editor').css('top','100px')
            $('#editor').css('left','30px')
            $('#editor').css('height','90%')
            $('#editor').css('width','93%')



        toggleEditorExpand = ()->
          if $('#editor').attr('on')== 'true' || $('#editor').attr('on')== 'true-paused'
            # $('#editor').attr('on','true')
            # alert('asd')
            compressEditor()
          else
            if $('#editor').attr('on')== 'false'
              expandEditor()

        toggleEditorExpandPause= ()->
          if $('#editor').attr('on')== 'true-paused'
            # alert('ad')
            $('#editor').attr('on','true')
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
#        $('#editor').hover(toggleEditorExpand)
        $('#editor').mouseenter(expandEditor)
        $('#editor').mouseleave(compressEditor)
  #      mq = window.matchMedia("(max-width: 649px)")
        # mqm = window.matchMedia("(max-width: 900px)")
  #       submitDrawer = document.getElementById("submitDrawer")
  #       if (matchMedia)
  #         WidthChange= (mq)->
  #           if (mq.matches)
  #             console.log('under 900')
  #             mqs = window.matchMedia("(max-width: 649px)")
  #             $('#toolbar').css('top','10px')
  #             if (mqs.matches)
  #               console.log('under 900 andunder 649')
  #               $('#toolbar').css('top','-70px')
  #             else
  #               console.log('under 900 and NOT under 649')
  #               $('#toolbar').css('top','10px')
  #             submitDrawer.style.top= '-500px'
  #             submitDrawer.setAttribute('on','false')
  #             submitDrawer.style.height= 'auto'
  # #            submitDrawer.style.width= $('#logo').width()


  #           else
  #             console.log('over 900')
  # #            mqs = window.matchMedia("(max-width: 649px)")
  # ##            if (mqs.matches)
  # #           $('#toolbar').css('top','10px')
  #             submitDrawer.style.top= '0px'
  #             submitDrawer.setAttribute('on','true')
  #             submitDrawer.style.height= '100%'

          # mqm.addListener(WidthChange)
          # WidthChange(mqm)

  #       mq = window.matchMedia("(max-width: 649px)")
  #       if (matchMedia)
  #         WidthChangeSmall= (mq)->
  #           if (mq.matches)
  #             console.log('under 649')
  #             $('#submitDrawer').attr('class','')
  #             $('#toolbar').css('top','-70px')
  # #            $('#submitDrawer').width($('#submission-holder').width())
  #           else
  #             console.log('over 649')
  #             $('#submitDrawer').attr('class','col-xs-3')
  #             $('#toolbar').css('top','0px')

  #         mq.addListener(WidthChangeSmall)
  #         WidthChangeSmall(mq)

  #       $('#editor').click(()->
  #           console.log($('#toolbar'))
  #           if (mq.matches)
  #            $('#toolbar').css('top','0px')
  #         )

  #       $('#editor').blur(()->
  #         if (mq.matches)
  #          $('#toolbar').css('top','-70px'))

        document.getElementById('editor').addEventListener 'focus',pauseCompress
        document.getElementById('editor').addEventListener 'blur',UnPauseCompress


        # toggleSubmitDrawer = ->
        #   if submitDrawer.getAttribute('on') =='true'
        #     if (mqm.matches)
        #       submitDrawer.style.top= '-500px'
        #     else
        #       submitDrawer.style.width= '0px'

        #     submitDrawerButton.style.transform='rotate(0deg)'
        #     submitDrawer.setAttribute('on','false')
        #   else
        #     if (mqm.matches)
        #        submitDrawer.style.top= '0px'
        #     else
        #       submitDrawer.style.width= '340px'

        #     submitDrawerButton.style.transform='rotate(180deg)'
        #     submitDrawer.setAttribute('on','true')
  #
  #      toggleToolbar = ->
  #        if submitToolbarButton.getAttribute('on') =='true'
  #          submitToolbarButton.setAttribute('on','false')
  #          toolbar.style.width= '0px'
  #          submitToolbarButton.style.transform='rotate(0deg)'
  #          setTimeout(()->
  #            if submitToolbarButton.getAttribute('on') =='false'
  #              toolbar.style.display ='none'
  #          ,500)
  #
  #        else
  #          toolbar.style.display="block"
  #          setTimeout(()->
  #            toolbar.style.width= '250px'
  #            submitToolbarButton.style.transform='rotate(180deg)'
  #          ,10)
  #
  #          submitToolbarButton.setAttribute('on','true')

        # submitDrawerButton.addEventListener 'click',toggleSubmitDrawer

  #      submitToolbarButton.addEventListener 'click',toggleToolbar

      setTimeout create,1000


  }