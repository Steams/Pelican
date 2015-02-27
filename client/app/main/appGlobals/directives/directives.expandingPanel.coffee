angular.module 'lander.directives.expandingPanel', []
.directive 'expandingPanel', () ->
  return {
    restrict : 'A'
    link:($scope,el,attr)->
      create = ->
        expandviewPanel = ()->
          if el.attr('on')!='paused' && el.attr('on')!='true-paused'
            el.attr('on','true')
            el.attr('focus','true')

        compressviewPanel = ()->
          if el.attr('on')!='paused' && el.attr('on')!='true-paused'
            el.attr('on','false')
            el.attr('focus','false')

        toggleviewPanelExpand = ()->
          if el.attr('on')== 'true' || el.attr('on')== 'true-paused'
            compressviewPanel()
          else
            if el.attr('on')== 'false'
              expandviewPanel()
        toggleFocus = ()->
          if el.attr('focus') == 'true'
            el.attr('focus','false')
            compressviewPanel()
          else
            if el.attr('focus') == 'false'
              el.attr('focus','true')
              expandviewPanel()

        toggleviewPanelExpandPause= ()->
          if el.attr('on')== 'true-paused'
            el.attr('on','true')
            compressviewPanel()
          else
            if el.attr('on')== 'false'
              expandviewPanel()
              el.attr('on','true-paused')

        pauseCompress = ()->
          if el.attr('on') != 'true-paused'
            compressviewPanel()
            el.attr('on','paused')

        UnPauseCompress = ()->
          if el.attr('on') != 'true-paused'
            el.attr('on','false')

        $('#expand-panel-icon').click(toggleviewPanelExpandPause)
        el.mouseenter(expandviewPanel)
        el.mouseleave(compressviewPanel)
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

  #       el.click(()->
  #           console.log($('#toolbar'))
  #           if (mq.matches)
  #            $('#toolbar').css('top','0px')
  #         )

  #       el.blur(()->
  #         if (mq.matches)
  #          $('#toolbar').css('top','-70px'))

        document.getElementById('viewPanel').addEventListener 'focus',pauseCompress
        document.getElementById('viewPanel').addEventListener 'blur',UnPauseCompress
        document.getElementById('viewPanel').addEventListener 'click',toggleFocus



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
