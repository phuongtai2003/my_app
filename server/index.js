const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./routes/auth.js");
const userRouter = require("./routes/user");

const PORT = process.env.PORT || 3000;
const app = express();

app.use(express.json());
app.use(authRouter);
app.use(userRouter);

const uri =
  "mongodb+srv://phuongtai03:Thanhtu03@cluster0.duwllpw.mongodb.net/?retryWrites=true&w=majority";

mongoose.connect(uri).then(() => {
    console.log("Connection successful");
}).catch((e) => { console.log(e); });

app.listen(PORT, function () {
  console.log(`Connected at ${PORT}`);
});
