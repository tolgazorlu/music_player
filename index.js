const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');

//set up express app
const app = express();

mongoose.connect('mongodb://localhost/hepop');
mongoose.Promise = global.Promise;

app.use(bodyParser.json());

//initialize routes
app.use('/api', require('./routes/api'));

//error handling middleware
app.use(function(err, req, res, next){
    console.log(err);
    res.status(422).send({error: err.message});
})

//listen for request
app.listen(process.env.port || 8000, function(){
    console.log('Listening for request...');
})