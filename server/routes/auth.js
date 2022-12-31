const express = require("express");
const User = require("../models/user.js");
const bcryptjs = require("bcryptjs");
const authRouter = express.Router();
const jwt = require("jsonwebtoken");
const auth = require("../middlewares/auth");

authRouter.post("/api/signup", async (req, res) => {
  try {
    const { email, name, password } = req.body;
    const existingUser = await User.findOne({ email: email });
    if (existingUser) {
      return res.status(400).json({ msg: "Email has been used already" });
    }
    const hashedPassword = await bcryptjs.hash(password, 8);
    let newUser = new User({
      name: name,
      password: hashedPassword,
      email: email,
    });
    newUser = await newUser.save();
    res.json(newUser);
  } catch (e) {
    return res.status(500).json({ error: e.message});
  }
});


authRouter.post("/api/signin", async (req, res) => {
  try{
    const {email, password} = req.body;
    const existingUser = await User.findOne({email: email});
    if(!existingUser){
      return res.status(400).json({msg : "User does not exist"});
    }
    const matchingPassword = await bcryptjs.compare(password, existingUser.password);
    if(!matchingPassword){
      return res.status(400).json({msg: "Password does not match"});
    }
    const token = jwt.sign({id : existingUser._id}, "passwordKey");
    res.json({token, ...existingUser._doc});
  }
  catch(e){
    return res.status(500).json({error: e.message});
  }
});

authRouter.post("/api/tokenIsValid", async (req, res) => {
  try{
    const token = req.header("token");
    if(!token){
      return res.json(false);
    }
    const isVerified = jwt.verify(token, "passwordKey");
    if(!isVerified){
      return res.json(false);
    }
    const existingUser = await User.findById(isVerified.id);
    if(!existingUser){
      return res.json(false);
    }
    res.json(true);
  }
  catch(e){
    return res.status(500).json({error: e.message});
  }
})


authRouter.get("/api/getUserData", auth, async (req, res) => {
    const user = await User.findById(req.user);
    res.json({token : req.token , ...user._doc});
})

module.exports = authRouter;
