function loadCategory(){
    var amount = document.getElementsByClassName("cateitems").length;
    $.ajax({
        type: "post",
        url: "/cellphone/loadcategory",
        data: {
            exist: amount
        },
        success: function (response) {
            var row = document.getElementById("catemenu");
            row.innerHTML += response;
        }
    });
}
