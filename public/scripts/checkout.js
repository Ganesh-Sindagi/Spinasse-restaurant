function updatePrice(qty) {
    const unit =  document.getElementById("item-price").innerText;
    console.log(unit)
    const newPrice = parseInt(unit) * parseInt(qty-1);
    
    console.log(newPrice)
    document.getElementById("price").innerHTML = parseInt(document.getElementById("price").innerHTML) + newPrice;
}