const express = require("express");
const User = require("../models/user");
const userRouter = express.Router();
const auth = require("../middlewares/auth");
const { Product } = require("../models/product");

userRouter.post("/api/turn", auth, async (req, res) => {
  try {
    let user = await User.findById(req.user);
    if (user.type == "seller") {
      user.type = "user";
    } else {
      user.type = "seller";
    }
    user = await user.save();
    res.json(user);
  } catch (e) {
    return res.status(500).json({ error: e.message });
  }
});

userRouter.post("/api/favorite", auth, async (req, res) => {
  try {
    const { id } = req.body;
    let product = await Product.findById(id);
    let user = await User.findById(req.user);
    let isLiked = false;
    for (let i = 0; i < user.favoriteProducts.length; i++) {
      if (user.favoriteProducts[i]._id.equals(product._id)) {
        user.favoriteProducts.splice(i, 1);
        isLiked = true;
        break;
      }
    }
    if (isLiked == false) {
      user.favoriteProducts.push(product);
    }
    user = await user.save();
    res.json(user);
  } catch (e) {
    return res.status(500).json({ error: e.message });
  }
});

userRouter.post("/api/add-to-cart", auth, async (req, res) => {
  try {
    const { id, quantity } = req.body;
    const product = await Product.findById(id);
    let user = await User.findById(req.user);
    if (user.cart.length == 0) {
      user.cart.push({ product: product, quantity: quantity });
    } else {
      let isFound = false;
      for (let i = 0; i < user.cart.length; i++) {
        if (product._id.equals(user.cart[i].product._id)) {
          user.cart[i].quantity += quantity;
          isFound = true;
          break;
        }
      }
      if (isFound == false) {
        user.cart.push({ product: product, quantity: quantity });
      }
    }
    user = await user.save();
    res.json(user);
  } catch (e) {
    return res.status(500).json({ error: e.message });
  }
});

userRouter.delete("/api/remove-from-cart/:id", auth, async (req, res) => {
  try{
    const id = req.params.id;
    const product = await Product.findById(id);
    let user = await User.findById(req.user);
    for(let i = 0; i<user.cart.length; i++){
      if(product._id.equals(user.cart[i].product._id)){
        user.cart[i].quantity -= 1;
      }
      if(user.cart[i].quantity == 0){
        user.cart.splice(i, 1);
      }
    }
    user = await user.save();
    res.json(user);
  }
  catch(e){
    return res.status(500).json({error: e.message});
  }
});

module.exports = userRouter;
