const express = require('express');
const router = express.Router();
const User = require('../models/user');
const Music = require('../models/music');

//get a list users from the db
router.get('/users', function(req, res, next){
    res.send({type:'GET'});
});

//add a new users to the db
router.post('/users', function(req, res, next){
    User.create(req.body).then(function(user){
        res.send(user);
    }).catch(next)
});

//update a user in the db
router.put('/users/:id', function(req, res, next){
    User.findByIdAndUpdate({_id: req.params.id}, req.body).then(function(){
        User.findOne({_id: req.params.id}).then(function(user){
            res.send(user);
        });
    })
})

//delete a ninja from db
router.delete('/users/:id', function(req, res, next){
    User.findByIdAndRemove({_id: req.params.id}).then(function(user){
        res.send(user);
    })
});

//get a list music from the db
router.get('/music', function(req, res, next){
    res.send({type:'GET'});
});

//add a new music to the db
router.post('/music', function(req, res, next){
    Music.create(req.body).then(function(music){
        res.send(music);
    }).catch(next)
});

//update a music in the db
router.put('/music/:id', function(req, res, next){
    Music.findByIdAndUpdate({_id: req.params.id}, req.body).then(function(){
        Music.findOne({_id: req.params.id}).then(function(music){
            res.send(music);
        });
    })
})

//delete a music from db
router.delete('/music/:id', function(req, res, next){
    Music.findByIdAndRemove({_id: req.params.id}).then(function(music){
        res.send(music);
    })
});

module.exports = router;