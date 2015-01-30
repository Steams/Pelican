angular.module 'landerApp'
.factory 'notesFactory', ['submitNote','queryNotes','getNotesBySubject','likeNote','viewNote',
(submitNote,queryNotes,getNotesBySubject,likeNote,viewNote)->

  factory = this

  factory.notes = []

  factory.like = (like)->
    likeNote(like).then(
      (res)->
        undefined
      ,
      (err)->
        console.log err
    )

  factory.view = (view)->
    viewNote(view).then(
      (res)->
        undefined
      ,
      (err)->
        console.log err
    )

  factory.queryNotes = ()->
    queryNotes().then(#get Notes returns a promise
      (res)-> 
        factory.notes = res
        console.log res,#on promise resolved
      (err)-> console.log err #on promise rejected
    )
    factory.notes.push({subject:'blank'})

  factory.submit = (note)-> factory.notes.splice -1,0,submitNote(note)

  factory.loadList = (subject)->
    getNotesBySubject(subject).then(
      (res)->
        if(res.list)
          factory.notes = res.list
        else
          factory.notes = res
        factory.notes.push({subject:'blank'})
        console.log(factory.notes)
      ,
      (err)-> console.log err
    )
  return factory
]
