const mongoose = require("mongoose");

const MusicSchema = mongoose.Schema({
    music_id: {
        type: String,
        required: false
    },
    music_name: {
        type: String,
        required: true
    },
    music_authors: {
        type: String,
        required: true
    },
    music_image_url: {
        type: String,
        required: false
    },
    music_file_url: {
        type: String,
        required: true
    },
    music_album :{
        type: String,
        required: false
    }
});



MusicSchema.methods.toJSON = function(){
    const music = this.toObject();
    delete music.__v;

    return music;
}

module.exports = mongoose.model('Music', MusicSchema);