const express = require("express");
const sellerRouter = express.Router();
const seller = require("../middlewares/seller");
const Product = require("../models/product");

sellerRouter.post("/api/product/sell", seller , async(req, res) => {
    try{
        const {name, price, weight, quantity, description, category, images} = req.body;
        let product = new Product({
            name,
            price,
            weight,
            quantity,
            description,
            category,
            images,
            userId: req.user,
        });
        product = await product.save();
        res.json(product);
    }
    catch(e){
        return res.status(500).json({error: e.message});
    }
});

module.exports = sellerRouter;