angular.module 'landerApp'
.service 'createNotebook',['$http','api','$q',($http,api,$q)->
    return (body)->
      defer = $q.defer()

      $http.post '/api/things/notebooks',body
      .success (res)->
        defer.resolve(res)
      .error (err,status)->
        defer.reject(err)

      return defer.promise
  ]
