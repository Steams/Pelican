angular.module 'landerApp'
.factory 'notesFactory', ['submitNote','indexModel','getNotesBySubject','likeNote','viewNote',
(submitNote,indexModel,getNotesBySubject,likeNote,viewNote)->

  factory = this

  factory.notes = []
  factory.selected= factory.notes[0]

  factory.selectNote = (id)->
    factory.selected = $.grep(factory.notes,(e)-> return e.id ==id)[0]
    return factory.selected

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

  factory.submit = (note)-> factory.notes.splice(-1,0,submitNote(note))

  factory.loadNotes = (query)->
    factory.notes = []
    indexModel('/api/things/notes'+query).then(
      (res)->
        factory.notes = res
        factory.notes.forEach( (note)->
            note.likeCount = note.Likes.length
            note.viewCount = note.Views.length
            note.tagsFormatted = ()->
              tags = note.tags.split(',')
              return tags
          )
        console.log res
      (err)-> console.log err #on promise rejected
    )
    factory.notes.push({subject:'blank'})

  return factory
]
