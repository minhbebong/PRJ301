function loadProductCategory(){
    $.ajax({
        type: "get",
        url: "/cellphone/loadcategory",
        success: function (response) {
            var row = document.getElementById("catemenu");
            row.innerHTML += response;
            console.log(row)
        }
    });
}
