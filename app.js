const express = require('express')
const app = express()
const bodyParser = require('body-parser')
const ejs = require("ejs");
const port = 3000

app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({ extended: false }))
app.use(express.static("public"));
app.use(express.json());

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
        res.render('login')
    }
  }); 
});

app.get("/login", (req, res) => {
  res.render("login");
});

var suid;
var suname;

app.post("/login", (req, res) => {
  const email = req.body.email;
  const password = req.body.password;

  connection.query('SELECT user_id, password, name FROM user WHERE email = ?',[email], function (error, results) {
    if (error){
        res.send("<h1>No User exist</h1>")
        console.log(error);
    } else {
        if(results[0].password === password) {
            suid = results[0].user_id;
            suname = results[0].name;
            connection.query('SELECT * FROM menu', function (error, results) {
              if (!error){
                  res.render('menu', {username: suname, user_id: suid, items: results})
              }
            });
        } else {
            console.log("password didn't match")
        }
    }
  });
})

app.get("/cart", (req, res) => {
  connection.query('SELECT * FROM menu', function (error, results) {
    if (!error){
        res.render('cart', {username: suname, user_id: suid, items: results})
    }
  });
});

var cart_items = [];

app.post("/cart", (req, res) => {
  cart_items = req.body.cart;
  console.log(cart_items);
  cart_items.map((cart_item) => {
    connection.query('INSERT INTO cart (user_id, item) VALUES (?, ?)', [suid, cart_item], function (error, results) {
      if (!error){
        console.log("sucess")
      } else {
        console.log(error)
      }
    });
  });
});

app.listen(port, () => {
  console.log(`Spinasse listening at http://localhost:${port}`)
})