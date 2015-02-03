/**
 * Main application routes
 */

'use strict';

var errors = require('./components/errors');
var bodyParser = require('body-parser');
var passport = require('passport');
var passportLocal = require('passport-local');
var cookieParser = require('cookie-parser');
var expressSession = require('express-session');
var Models = require('./api/models/lander-models');
var User = Models.userModel;

// var express = require('express');
module.exports = function(app) {

  // Insert routes below

  app.use(bodyParser.urlencoded({
    extended: true
  }));
  app.use(cookieParser());
  app.use(expressSession({
    secret:'secret',
    resave:false,
    saveUninitialized:false
  }));


  app.use(passport.initialize());
  app.use(passport.session());

  passport.use(new passportLocal.Strategy(function(username,password,done){
    User.find({where:{name:username} }).then(function(user){
      if (password == user.password){
        done(null,user);
      }
      else{
          done(null,{});
      }
    });
  }));

  passport.serializeUser(function(user,done){
    done(null, user.id);
  });

  passport.deserializeUser(function(id,done){
    User.find({where:{id:id}}).then(function(user){
      done(null, user);
    });
  });

  app.use('/api/things', require('./api/thing'));

  app.post('/login',passport.authenticate('local'),function(req,res){
    // return jso object of user data on is authenticated in req
    // res.redirect('/login');
    console.log({authenticated : req.isAuthenticated(), user:req.user});
    // return('login');
    return res.json({authenticated : req.isAuthenticated(), user:req.user});
  });

  app.get('/loginInfo',function(req,res){
    // console.log(req);
    //  res.render('login',{
    //    isAuthenticated:req.isAuthenticated(),
    //    user:req.user,
    //    name:'radcliffe'
    //    });

  return res.json({authenticated : req.isAuthenticated(), user:req.user});
  });

  app.get('/logout',function(req,res){
    // req.logout();
      // res.redirect('/login');
  });
  // All undefined asset or api routes should return a 404
  app.route('/:url(api|auth|components|app|bower_components|assets)/*')
   .get(errors[404]);

  // All other routes should redirect to the index.html
  app.route('/*')
    .get(function(req, res) {
      res.sendfile(app.get('appPath') + '/index.html');
      // console.log(res.locals)
      // res.locals.name = 'uohuh'
      // console.log(res.locals)
      // res.render(app.get('appPath')+ '/index.html',{isAuthenticated:req.isAuthenticated(),user:req.user,name:'radcliffe'});
    });
};
