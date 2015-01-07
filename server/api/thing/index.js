'use strict';

var express = require('express');
var controller = require('./thing.controller');
var notesController = require('../controllers/notes-controller.js');

var router = express.Router();

// router.get('/', controller.index);
router.get('/notes', notesController.index);
router.get('/notes/:query', notesController.show);
router.get('/:id', controller.show);
// router.get('/:id', controller.show);
// router.post('/', controller.create);
router.post('/notes', notesController.create);
router.put('/:id', controller.update);
router.patch('/:id', controller.update);
router.delete('/:id', controller.destroy);

module.exports = router;
