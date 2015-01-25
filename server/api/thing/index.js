'use strict';

var express = require('express');
var controller = require('./thing.controller');
var notesController = require('../controllers/notes-controller.js');
var landerControllerSq = require('../controllers/lander-controller-Sqlite.js');

var router = express.Router();

// router.get('/', controller.index);
router.get('/notes', notesController.index);
router.post('/sqlNotes',landerControllerSq.create);
router.get('/notes/subject/:id', notesController.showBySub);
//router.get('/notes/:id', notesController.show);

//router.get('/:id', controller.show);
// router.get('/:id', controller.show);
// router.post('/', controller.create);
router.post('/notes', notesController.create);
router.put('/:id', controller.update);
router.patch('/:id', controller.update);
router.delete('/:id', controller.destroy);

module.exports = router;
