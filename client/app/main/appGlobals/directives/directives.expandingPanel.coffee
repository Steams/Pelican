angular.module 'lander.directives.expandingPanel', []
.directive 'expandingPanel', () ->
  return {
    restrict : 'A'
    link:($scope,el,attr)->
      create = ->
        # alert('asdasd')
        expandviewPanel = ()->
          if $('#viewPanel').attr('on')!='paused' && $('#viewPanel').attr('on')!='true-paused'
            $('#viewPanel').css('top','0px')
            $('#viewPanel').css('left','0px')
            $('#viewPanel').css('height','100%')
            $('#viewPanel').css('width','100%')
            $('#viewPanel').attr('on','true')

        compressviewPanel = ()->
          if $('#viewPanel').attr('on')!='paused' && $('#viewPanel').attr('on')!='true-paused'
            $('#viewPanel').attr('on','false')
            $('#viewPanel').css('top','100px')
            $('#viewPanel').css('left','30px')
            $('#viewPanel').css('height','90%')
            $('#viewPanel').css('width','93%')

        toggleviewPanelExpand = ()->
          if $('#viewPanel').attr('on')== 'true' || $('#viewPanel').attr('on')== 'true-paused'
            # $('#viewPanel').attr('on','true')
            # alert('asd')
            compressviewPanel()
          else
            if $('#viewPanel').attr('on')== 'false'
              expandviewPanel()

        toggleviewPanelExpandPause= ()->
          if $('#viewPanel').attr('on')== 'true-paused'
            # alert('ad')
            $('#viewPanel').attr('on','true')
            compressviewPanel()
          else
            if $('#viewPanel').attr('on')== 'false'
              expandviewPanel()
              $('#viewPanel').attr('on','true-paused')

        pauseCompress = ()->
          if $('#viewPanel').attr('on') != 'true-paused'
            compressviewPanel()
            $('#viewPanel').attr('on','paused')

        UnPauseCompress = ()->
          if $('#viewPanel').attr('on') != 'true-paused'
            $('#viewPanel').attr('on','false')

        $('#expand-panel-icon').click(toggleviewPanelExpandPause)
#        $('#viewPanel').hover(toggleviewPanelExpand)
        $('#viewPanel').mouseenter(expandviewPanel)
        $('#viewPanel').mouseleave(compressviewPanel)
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

  #       $('#viewPanel').click(()->
  #           console.log($('#toolbar'))
  #           if (mq.matches)
  #            $('#toolbar').css('top','0px')
  #         )

  #       $('#viewPanel').blur(()->
  #         if (mq.matches)
  #          $('#toolbar').css('top','-70px'))

        document.getElementById('viewPanel').addEventListener 'focus',pauseCompress
        document.getElementById('viewPanel').addEventListener 'blur',UnPauseCompress


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