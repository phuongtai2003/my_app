const express = require("express");
const User = require("../models/user");
const userRouter = express.Router();
const auth = require("../middlewares/auth");

userRouter.post("/api/turn", auth, async (req, res)=> {
    try{
        let user = await User.findById(req.user);
        if(user.type == "seller"){
            user.type = "user";
        }
        else{
            user.type = "seller";
        }
        user = await user.save();
        res.json(user);
    }
    catch(e){
        return res.status(500).json({error: e.message});
    }
});

module.exports = userRouter;