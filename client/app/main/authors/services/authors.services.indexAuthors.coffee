angular.module 'landerApp'
.service 'indexAuthors',['$http','api','$q',($http,api,$q)->
    return ()->
      # console.log 'making get http request to : '+api
      defer = $q.defer()

      $http.get '/api/things/authors'
      .success (res)->
        defer.resolve(res)
      .error (err,status)->
        defer.reject(err)

      return defer.promise
  ]
