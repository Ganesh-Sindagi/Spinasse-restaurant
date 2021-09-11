const express = require('express')
const app = express()
const bodyParser = require('body-parser')
const ejs = require("ejs");
const port = 3000

app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({ extended: false }))
app.use(express.static("public"));

var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'restaurantDB'
});
 
connection.connect();

app.get("/", (req, res) => {
  res.send("<h1>Hello World!</h1>")
})

app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`)
})