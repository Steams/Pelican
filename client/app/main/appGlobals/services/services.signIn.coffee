angular.module 'landerApp'
.service 'signIn',['$http','api','$q',($http,api,$q)->
    return (user)->
      defer = $q.defer()

      $http.post '/login',user
      .success (res)->
        defer.resolve(res)
      .error (err,status)->
        defer.reject(err)
  ]
