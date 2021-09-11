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
  res.render("home");
})

app.get("/register", (req, res) => {
  res.render("register");
})

app.post("/register", (req, res) => {
  const name = req.body.name;
  const email = req.body.email;
  const password = req.body.password;

  connection.query('INSERT INTO user (name, email, password) VALUES (?, ?, ?)', [name, email, password], function (error, results, fields) {
    if (error){
        console.log(error);
    } else {
        // res.render('login')
    }
});
    


})

app.get("/login", (req, res) => {
  res.render("login");
})

app.post("/login", (req, res) => {
  const email = req.body.email;
  const password = req.body.password;

  connection.query('SELECT user_id, password, name FROM user WHERE email = ?',[email], function (error, results) {
    if (error){
        res.send("<h1>No User exist</h1>")
        console.log(error);
    } else {
        if(results[0].password === password) {
            // res.render('studentdetails', {username: results[0].username, user_id: results[0].user_id})
            console.log("success");
            console.log(results[0])
        } else {
            console.log("password didn't match")
        }
    }
  });
})

app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`)
})