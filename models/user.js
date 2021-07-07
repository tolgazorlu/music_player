const mongoose = require('mongoose');
const Schema = mongoose.Schema;

//create user schema & model
const UserSchema = new Schema({
    name: {
        type: String,
        required: [true, 'Name field is required']
    },
    email: {
        type: String,
    },
    username: {
        type: String,
    },
})

const User = mongoose.model('user', UserSchema);

module.exports=User;