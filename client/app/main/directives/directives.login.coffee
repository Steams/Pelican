angular.module 'lander.directives.login', []
.directive 'login', () ->
  return {
  restrict : 'E'
#    scope : true
  replace : true
  templateUrl: 'app/main/partials/login.html'
  controller : "globalCtrl"
  link:(scope,el,attrs)->
    setActiveTrue = (item)->
      item.attr('active','true')

    setActiveFalse = (item)->
      item.attr('active','false')

    toggleActive = (item)->
      if item.attr('active') == 'true'
        setActiveFalse(item)
      else
        setActiveTrue(item)

    calculateDistance = (active,selected)->
      if active > selected
        return distance = active - selected
      else
        return distance = selected - active

    setAllActiveFalse = (exclude)->
      $('.login-list-item').each (index)->
        if index != exclude
          distance = calculateDistance(exclude,index)
          $(this).attr('distance',''+distance)
          setActiveFalse $(this)
        else
          setActiveTrue $(this)

    $('.login-list-item-title').each (index)->
        $(this).mouseenter ()-> setAllActiveFalse (index)

  }
