const express = require('express');
const router = express.Router();
const Music = require('../models/music_model');

//get all musics
router.get('/', async (req, res) => {
    try {
        const musics = await Music.find();
        return res.status(200).json(musics);
    } catch (err) {
        return res.status(400).json({ error: 'musics cannot get' });
    }
});

//insert music

router.post('/', async (req, res) => {
    try {
        return res.status(200).json(Music(req.body).save());
    } catch (err) {
        return res.status(400).json({ error: 'insert failed' })
    }
});

//get one music

router.get('/:musicID', async (req, res) => {
    try {
        const music = await Music.findById(req.params.musicID);
        if (music) {
            return res.status(200).json(music);
        }
        else {
            return res.status(400).json({ message: "music not found" })
        }
    } catch (err) {
        res.status(400).json({ error: "something went wrong" })
    }
})

router.delete('/:musicID', async (req, res) => {
    try {
        const result = await Music.findByIdAndDelete({ _id: req.params.musicID });
        if (resulr) {
            return res.status(200).json({ message: "music deleted" });
        }
        else {
            return res.status(400).json({ message: "music not found" })
        }
    } catch (err) {
        res.status(400).json({ error: "something went wrong" })
    }
})

router.patch('/:musicID', async (req, res) => {
    try {
        const result = await Music.findByIdAndUpdate({ _id: req.params.musicID }, req.body, { new: true });
        if (resulr) {
            return res.status(200).json({ message: "music deleted" });
        }
        else {
            return res.status(400).json({ message: "music not found" })
        }
    } catch (err) {
        res.status(400).json({ error: "something went wrong" })
    }
})

module.exports = router;