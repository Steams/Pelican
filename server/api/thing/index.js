'use strict';

var express = require('express');
var controller = require('./thing.controller');
// var notesController = require('../controllers/notes-controller.js');
var notesController = require('../controllers/notesController.js');
var authorsController = require('../controllers/authorsController.js');
var subjectsController = require('../controllers/subjectsController.js');
var landerController = require('../controllers/lander-controller.js');

var router = express.Router();

// router.get('/', controller.index);
// router.get('/notes', notesController.index);
// router.get('/notes/subject/:id', notesController.showBySub);

router.post('/notes',notesController.createNote);
router.get('/notes',notesController.indexNotes);
router.get('/notes/',notesController.showNotesByQuery);

router.post('/authors',authorsController.createUser);
router.get('/authors',authorsController.indexUsers);
router.get('/authors/:author',notesController.showNotesByAuthor);

router.get('/sqlNotes/subjects/:subject',notesController.showNotesBySubject);
router.get('/sqlNotes/subjects',subjectsController.showSubjects);

// router.get('/Communities',landerController.indexCommunities);
// router.post('/Communities',landerController.createCommunity);

router.post('/likes',notesController.likeNote);
router.get('/likes',notesController.indexLikes);
router.delete('/likes',notesController.deleteLikes);
router.post('/views',notesController.viewNote);
router.get('/views',notesController.indexViews);
router.delete('/views',notesController.deleteViews);
// router.get('/sqlNotes/Likes',landerLikesController.indexLikes);
//router.get('/notes/:id', notesController.show);

//router.get('/:id', controller.show);
// router.get('/:id', controller.show);
// router.post('/', controller.create);
// router.post('/notes', notesController.create);
router.put('/:id', controller.update);
router.patch('/:id', controller.update);
router.delete('/:id', controller.destroy);

module.exports = router;
