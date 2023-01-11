const jwt = require("jsonwebtoken");
const User = require("../models/user");

const seller = async (req, res, next) => {
    try{
        const token = req.header("token");
        if(!token){
            return res.status(401).json({msg: "Token is invalid"});
        }
        const isVerified = jwt.verify(token, "passwordKey");
        if(!isVerified){
            return res.status(401).json({msg: "Token verification failed"});
        }
        const currentUser = await User.findById(isVerified.id);
        if(!currentUser){
            return res.status(401).json({msg: "User does not exist"});
        }
        if(currentUser.type != "seller"){
            return res.status(401).json({msg: "User is not a seller"});
        }
        req.user = isVerified.id;
        req.token = token;
        next();
    }
    catch(e){
        return res.status(500).json({error: e.message});
    }
}

module.exports = seller;