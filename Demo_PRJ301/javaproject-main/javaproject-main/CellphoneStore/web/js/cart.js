
var totalPrice = 0;

function replaceCharInString(items){
    items.replaceAll('.','').replaceAll('đ','');
}


document.getElementsByClassName('qty-input').onchange = function(){
    let amount = document.getElementById('qty-input').value;  
    let itemPrice_raw_1 = document.getElementById('item-price').innerHTML;
    let itemPrice_raw = itemPrice_raw_1.replaceAll('.','');
    let itemPrice = itemPrice_raw.replaceAll('đ','');

    let parsePrice = parseInt(itemPrice, 10);
    let parseAmount = parseInt(amount, 10);

    let totalItemPrice_raw = parsePrice * parseAmount;
    let totalItemPrice = totalItemPrice_raw.toLocaleString('vn-VN');
    let totalItemPrice_final = totalItemPrice.replaceAll(',','.').concat('đ');

    document.getElementById('total-item-price').innerHTML = totalItemPrice_final;
}

const collection = document.getElementsByClassName('qty-in'); 

function addLoadEvent(func) {
    var oldonload = window.onload;
    if (typeof window.onload !== 'function') {
      window.onload = func;
    } else {
      window.onload = function() {
        if (oldonload) {
          oldonload();
        }
        func();
      }
    }
  };

addLoadEvent(function () {
    let price = document.getElementsByClassName('i-price');
    for (let i = 0; i < price.length; i++) {
      newPrice_raw = price[i].innerHTML;
      newPrice = parseInt(newPrice_raw, 10);
      newPrice = newPrice.toLocaleString('vn-VN');
      newPrice = newPrice.replaceAll(',','.').concat('đ');
      price[i].innerHTML = newPrice;
    }
});