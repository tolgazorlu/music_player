const express = require('express');
const router = express.Router();
const bcrypt = require('bcrypt');
const User = require('../models/user_model');


// get all users
router.get('/', async(req, res) => {

    try {
        const users = await User.find();
        res.status(200).json(users);
    } catch (err) {
        res.status(400).json({ error: "get failed" });
    }
});


//? insert user
router.post('/', async (req, res) => {
    try {
        const tempUser = User(req.body);
        tempUser.user_password = await bcrypt.hash(tempUser.user_password, 8);
        const result = await tempUser.save();
    
        res.status(200).json(result);
    } catch (err) {
      //  console.log(err);
        res.status(400).json({ error: "insert failed" });
    }
});


//get one user
router.get('/:userID',async (req,res) =>{
    try{
        const user = await User.findById(req.params.userID);
        if(user){
            return res.status(200).json(user);
        }else{
            return res.status(400).json({message: "user not found"});
        }
    }catch(err){
        res.status(400).json({ error: "insert failed" });
    }
});

//delete user
router.delete('/:userID', async (req,res) =>{

    try{
        const result = await User.findByIdAndDelete({_id :req.params.userID});
        if(result){
            return res.status(200).json({ message: "user deleted" });
        }else{
            return res.status(404).json({
                message: "user not found"
            });
        }
    }catch (err) {
        res.status(400).json({ error: "err" });
    }
});


//update user
router.patch('/:userID', async (req,res) =>{

    try{
        const result = await User.findByIdAndUpdate({_id:req.params.userID}, req.body, {new:true});
        if(result){
            return res.status(200).json(result);
        }else{
            return res.status(304).json({ error: "user not found" });
        }
    }catch (err) {
        res.status(400).json({ error: "err" });
    }
});


//login
router.post('/login', async (req, res) => {
    try {

        const user = await User.findOne({ user_email: req.body.user_email });

        if (!user) {
            return res.status(406).json({ message: "user not found" });// kabul edilemez
        }
        const passwordControl = await bcrypt.compare(req.body.user_password, user.user_password);
        if (!passwordControl) {
            return res.status(401).json({ message: "wrong password" });// yetkisiz
        }
        return res.status(200).json(user);


    } catch (err) {
        res.status(400).json({ error: "login failed" });// bad request
    }
});


module.exports = router;