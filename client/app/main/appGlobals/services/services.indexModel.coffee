angular.module 'landerApp'
.service 'indexModel',['$http','api','$q',($http,api,$q)->
    return (route)->
      # console.log 'making get http request to : '+api
      defer = $q.defer()

      $http.get route
      .success (res)->
        defer.resolve(res)
      .error (err,status)->
        defer.reject(err)

      return defer.promise
  ]
