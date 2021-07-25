const mongoose = require('mongoose');
require('dotenv/config');

mongoose.connect("",
{useCreateIndex:true,useUnifiedTopology:true,useNewUrlParser:true,useFindAndModify:false})
    .then(()=>console.log("DB connection is successful"))
    .catch(err =>console.log("connection failed", err));
