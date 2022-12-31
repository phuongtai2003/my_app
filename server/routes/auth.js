const express = require("express");
const User = require("../models/user.js");
const bcryptjs = require("bcryptjs");
const authRouter = express.Router();

authRouter.post("/api/signup", async (req, res) => {
  try {
    const { email, name, password } = req.body;
    const existingUser = User.findOne({ email: email });
    if (existingUser) {
      return res.status(400).json({ msg: "Email has been used already" });
    }
    const hashedPassword = bcryptjs.hash(password, 8);
    let newUser = new User({
      name: name,
      password: hashedPassword,
      email: email,
    });
    newUser = await newUser.save();
    res.json(newUser);
  } catch (e) {
    return res.status(500).json({ error: e.toString() });
  }
});

module.exports = authRouter;
