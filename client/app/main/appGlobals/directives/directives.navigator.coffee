angular.module 'lander.directives.navigator', []
.directive 'navigatorPanel', () ->
  return {
    restrict : 'E'
    controller: 'globalCtrl'
    replace : true
    templateUrl: 'app/main/appGlobals/partials/navigator.html'
    link:(scope,el,attrs)->
      navOps = $('.navigator-option')
      navOpsHolder = $('#navigator-options-holder')
      navMenuButton = $('#navigator-menu-button')

      el.mouseenter ()->
        el.attr('hover','true')

      el.mouseleave ()->
        el.attr('hover','false')

      navOps.each (index)->
        $(this).click (index)->
          el.attr('hover','false')
          navOpsHolder.attr('show','false')
          navOps.each (index2)->
            $(this).attr('active','false')
          $(this).attr('active','true')

      navMenuButton.click ()->
        if(navOpsHolder.attr('show') == 'false')
          navOpsHolder.attr('show','true')
        else
          navOpsHolder.attr('show','false')

      body = document.getElementsByTagName('body')[0]
      bodyEvents = new Hammer(body)

      bodyEvents.on 'swiperight', (ev)->
        if(navOpsHolder.attr('show') == 'false')
          navOpsHolder.attr('show','true')
        else
          navOpsHolder.attr('show','false')

      bodyEvents.on 'tap',(ev)->
        if ev.target.id != 'navigator-options-holder'
          navOpsHolder.attr('show','false')
  }
