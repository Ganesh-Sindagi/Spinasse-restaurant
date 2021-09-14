const express = require('express')
const app = express()
const bodyParser = require('body-parser')
const ejs = require("ejs");
const port = 3000
const { v4: uuidv4 } = require('uuid');

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

var citems = [];
var citemdetails = [];
function getItemDetails(citems) {
  
  citems.map((item) => {
    connection.query('SELECT * FROM menu WHERE item_id = ?',[item], function (error, results2) {
      citemdetails.push(results2[0]);
    });
  })
}

app.get("/cart", (req, res) => {
  res.render('cart', {username: suname, user_id: suid, items: citemdetails}) 
});

var cart_items = [];

app.post("/cart", (req, res) => {
  cart_items = req.body.cart;
  getItemDetails(cart_items);
});

app.post("/checkout", (req, res) => {
  const item_id = req.body.item_id;
  const quantity = req.body.quantity;
  const price = req.body.price;
  var d = new Date();

  item_id.map((item, i) => {
    connection.query('INSERT INTO orders (order_id, user_id, item_id, price, time) VALUES (?, ?, ?, ?, ?)', [uuidv4(), suid, item, price[i], d], function (error, results, fields) {
      if (error){
          console.log(error);
      } else {
      }
    });
  });

  res.render('confirmation')
})

app.get("/about", (req, res) => {
  res.render('about');
});

app.get("/contact", (req, res) => {
  res.render('contact');
});

app.get("/adminlogin", (req, res) => {
  res.render('adminlogin')
})

app.post("/adminlogin", (req, res) => {
const email = req.body.email;
const password = req.body.password;

connection.query('SELECT admin_id, password, name FROM admin WHERE email = ?',[email], function (error, results) {
  if (error){
      res.send("<h1>No User exist</h1>")
      console.log(error);
  } else {
      if(results[0].password === password) {
        connection.query('SELECT * FROM orders', function (error, results) {
          res.render('admin', {orders: results});
        });  
      } else {
          console.log("password didn't match")
      }
    }
  });
})

app.listen(port, () => {
  console.log(`Spinasse listening at http://localhost:${port}`)
})