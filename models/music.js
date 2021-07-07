const mongoose = require('mongoose');
const Schema = mongoose.Schema;

//create music schema and model
const MusicSchema = new Schema({
    music_name: {
        type: String
    },
    music_artist: {
        type: String
    },
    music_style: {
        type: String
    },
    music_image_url: {
        type: String
    }
})

const Music = mongoose.model('music', MusicSchema);

module.exports=Music;