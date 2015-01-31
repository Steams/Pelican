angular.module 'landerApp'
.service 'getNotesBySubject',['$http','$q','api','indexModel',($http,$q,api,indexModel,subject)->

  return (subject)->
    console.log('subject: '+ subject)
    defer = $q.defer()
    if subject
      if subject != "all" && subject != "All"
        $http.get(api+'/subjects/'+subject)
        .success (res)->
          defer.resolve(res)
#          console.log(res)
        .error (err,status)->
          defer.reject(err)

      else
        indexModel('/api/things/notes').then(
          (res)->
#            console.log(res)
            defer.resolve(res)
          ,
          (err)-> defer.reject(err)
        )

      return defer.promise

]
