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
    // var url = "http://localhost:3000/cart";

    // var xhr = new XMLHttpRequest();
    // xhr.open("POST", url);

    // xhr.setRequestHeader("Accept", "application/json");
    // xhr.setRequestHeader("Content-Type", "application/json");

    // xhr.onreadystatechange = function () {
    // if (xhr.readyState === 4) {
    //     console.log(xhr.status);
    //     console.log(xhr.responseText);
    // }};

    // xhr.send(JSON.stringify({
    //     body: cart
    // }));

    // fetch(url, {method: "POST", headers: {'Content-Type': 'application/json'}, body: JSON.stringify({
    //         cart: cart
    //     }
    // )}).then(response => console.log(response));

    return cart;
}
