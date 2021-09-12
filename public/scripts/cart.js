var no_of_items = 0;
var cart = [];

function addToCart(item_id) {
    no_of_items++;
    document.getElementById('ci').innerHTML = no_of_items;
    const name = "btn"+ item_id
    document.getElementById(name).disabled = true;
    document.getElementById(name).innerHTML = "Added";
    cart.push(item_id);
}

function openCart() {
    var url = "http://localhost:3000/cart";

    fetch(url, {method: "POST", headers: {'Content-Type': 'application/json'}, body: JSON.stringify({
            cart: cart
        }
    )});

    window.location.href="http://localhost:3000/cart";
}
