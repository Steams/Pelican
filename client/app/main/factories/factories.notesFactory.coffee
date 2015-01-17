angular.module 'landerApp'
.factory 'notesFactory', ['submitNote','queryNotes','getNotesBySubject',(submitNote,queryNotes,getNotesBySubject)->

  factory = this

  factory.notes = []

  factory.queryNotes = ()->
    queryNotes().then(#get Notes returns a promise
      (res)-> factory.notes = res ,#on promise resolved
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
