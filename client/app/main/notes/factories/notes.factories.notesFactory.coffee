angular.module 'landerApp'
.factory 'notesFactory', ['submitNote','indexModel','getNotesBySubject','likeNote','viewNote',
(submitNote,indexModel,getNotesBySubject,likeNote,viewNote)->

  factory = this

  factory.notes = []
  factory.selected= factory.notes[0]

  factory.selectNote = (id)->
    factory.selected = $.grep(factory.notes,(e)-> return e.id ==id)[0]
    return $.grep(factory.notes,(e)-> return e.id ==id)[0]

  factory.like = (like)->
    return likeNote(like).then(
      (res)->
        console.log res
        console.log res.status
        return res.status
      ,
      (err)->
        console.log err
        console.log err.status
        return err.status
    )


  factory.view = (view)->
    viewNote(view).then(
      (res)->
        undefined
      ,
      (err)->
        console.log err
    )

  factory.indexNotes = ()->
    indexModel('/api/things/notes').then(#get Notes returns a promise
      (res)->
        factory.notes = res
        factory.notes.forEach( (note)->
            note.likeCount = note.Likes.length
            note.viewCount = note.Views.length
          )
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
