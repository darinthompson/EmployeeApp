const express = require("express");
const createConnection = require("./config/db");
const app = express();
const appConfig = (req, res, next) => {
  res.header("Access-Control-Allow-Origin", "http://localhost:8080");
  res.header("Access-Control-Allow-Credentials", true);
  res.header("Access-Control-Allow-Methods", "GET,HEAD,OPTIONS,POST,PUT");
  res.header(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type, Accept, Authorization"
  );
  next();
};

app.use(appConfig);

app.use(express.json({ extended: false }));

app.get("/", (req, res) => res.send("Application running"));

app.use("/user", require("./routes/user"));

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => console.log(`Server started on port ${PORT}`));
