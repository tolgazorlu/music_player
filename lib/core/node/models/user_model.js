const mongoose = require('mongoose');

const UserSchema = mongoose.Schema({
    user_id:{
        type: String,
     //   required:true
    },
    user_name:{
        type: String,
        required:true
    },
    user_surname:{
        type: String,
        required:true
    },
    user_email:{
        type: String,
        required:true
    }, 
    user_password:{
        type: String,
        required:true
    },
    user_fotoURL:{
        type: String,
     //   required:true
    },
    user_rooms_id:{
        type: Array,
      //  required:true
    },

}, {timestamps: true });

UserSchema.methods.toJSON = function () {
    const user = this.toObject();
    delete user.createdAt;
    delete user.updatedAt;
    delete user.__v;
    delete user.user_password;

    return user;
}


module.exports = mongoose.model('User', UserSchema);