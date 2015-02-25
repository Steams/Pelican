angular.module 'landerApp'
.service 'indexCommunities',['$http','api','$q',($http,api,$q)->
    return ()->
      # console.log 'making get http request to : '+api
      defer = $q.defer()

      $http.get '/api/things/communities'
      .success (res)->
        defer.resolve(res)
      .error (err,status)->
        defer.reject(err)

      return defer.promise
  ]
