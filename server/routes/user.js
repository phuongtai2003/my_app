const express = require("express");
const User = require("../models/user");
const userRouter = express.Router();
const auth = require("../middlewares/auth");
const { Product } = require("../models/product");
const Order = require("../models/order");

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
  try {
    const id = req.params.id;
    const product = await Product.findById(id);
    let user = await User.findById(req.user);
    for (let i = 0; i < user.cart.length; i++) {
      if (product._id.equals(user.cart[i].product._id)) {
        user.cart[i].quantity -= 1;
      }
      if (user.cart[i].quantity == 0) {
        user.cart.splice(i, 1);
      }
    }
    user = await user.save();
    res.json(user);
  } catch (e) {
    return res.status(500).json({ error: e.message });
  }
});

userRouter.post("/api/set-user-address", auth, async (req, res) => {
  try {
    const { address } = req.body;
    let user = await User.findById(req.user);
    user.address = address;
    user = await user.save();
    res.json(user);
  } catch (e) {
    return res.status(500).json({ error: e.message });
  }
});

userRouter.post("/api/place-order", auth, async (req, res) => {
  try {
    const { totalPrice, paymentMethod } = req.body;
    let currentUser = await User.findById(req.user);
    let products = [];
    for (let i = 0; i < currentUser.cart.length; i++) {
      let product = await Product.findById(currentUser.cart[i].product._id);
      if (product.quantity >= currentUser.cart[i].quantity) {
        product.quantity -= currentUser.cart[i].quantity;
        products.push({ product, quantity: currentUser.cart[i].quantity });
        product = await product.save();
      } else {
        return res
          .status(400)
          .json({ msg: "Cart product exceed product quantity limit" });
      }
    }
    currentUser.cart = [];
    currentUser = await currentUser.save();

    let order = new Order({
      products,
      totalPrice,
      paymentMethod,
      userId: req.user,
      address: currentUser.address,
      orderedAt: new Date().getTime(),
    });

    order = await order.save();
    res.json(currentUser);
  } catch (e) {
    return res.status(500).json({ error: e.message });
  }
});

userRouter.get("/api/fetch-order", auth, async (req, res) => {
  try {
    const orders = await Order.find({userId: req.user});
    res.json(orders);
  } catch (e) {
    return res.status(500).json({ error: e.message });
  }
});

module.exports = userRouter;
