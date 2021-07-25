const mongoose = require('mongoose');
require('dotenv/config');

/*
mongoose.connect("mongodb+srv://t4zb:s7GZRQ4p*7U8d_f@cluster0.6ebb8.mongodb.net/myFirstDatabase?retryWrites=true&w=majority",
{useCreateIndex:true,useUnifiedTopology:true,useNewUrlParser:true,useFindAndModify:false})
    .then(()=>console.log("DB connection is successful"))
    .catch(err =>console.log("connection failed", err));
*/
mongoose.connect("mongodb+srv://tolgazorlu:N3liocYM555Xx2Sd@cluster0.6ebb8.mongodb.net/engApp?retryWrites=true&w=majority",
{useCreateIndex:true,useUnifiedTopology:true,useNewUrlParser:true,useFindAndModify:false})
    .then(()=>console.log("DB connection is successful"))
    .catch(err =>console.log("connection failed", err));