angular.module 'landerApp'
.service 'getNotesBySubject',['$http','$q','api','indexNotes',($http,$q,api,indexNotes,subject)->

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
        queryNotes().then(
          (res)->
#            console.log(res)
            defer.resolve(res)
          ,
          (err)-> defer.reject(err)
        )

      return defer.promise

]
