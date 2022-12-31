const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./routes/auth.js");

const PORT = process.env.PORT || 3000;
const app = express();

app.use(express.json());
app.use(authRouter);

const uri =
  "mongodb+srv://phuongtai03:Thanhtu03@cluster0.duwllpw.mongodb.net/?retryWrites=true&w=majority";
mongoose.set("strictQuery", false);

mongoose
  .connect(uri)
  .then(() => {
    console.log("Connect succesfully to MongoDB");
  })
  .catch((e) => {
    console.log(e.toString());
  });

app.listen(PORT, function () {
  console.log(`Connected at ${PORT}`);
});
