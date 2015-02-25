angular.module 'landerApp'
.service 'signUp',['$http','api','$q',($http,api,$q)->
    return (user)->
      # console.log 'making submit http request to: '+api
      defer = $q.defer()

      $http.post '/api/things/authors',user
      .success (res)->
        defer.resolve(res)
      .error (err,status)->
        defer.reject(err)
  ]
