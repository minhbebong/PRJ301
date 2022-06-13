

var $maxWidthElement = $('.navbar'),
  maxWidth = $maxWidthElement.width();

function positionDropdowns() {
  $('.dropdown-menu').each(function () {
    $(this).removeClass('dropdown-menu-right');
    var $navItem = $(this).closest('.dropdown'),
      dropdownWidth = $(this).outerWidth(),
      dropdownOffsetLeft = $navItem.offset().left,
      dropdownOffsetRight = maxWidth - (dropdownOffsetLeft + dropdownWidth),
      linkCenterOffsetLeft = dropdownOffsetLeft + $navItem.outerWidth() / 2,
      outputCss = {
        left: 0,
        right: '',
        width: ''
      };

    if ((linkCenterOffsetLeft - dropdownWidth / 2 > 0) & (linkCenterOffsetLeft + dropdownWidth / 2 < maxWidth)) {
      // center the dropdown menu if possible
      outputCss.left = -(dropdownWidth / 2 - $navItem.outerWidth() / 2);
    } else if ((dropdownOffsetRight < 0) & (dropdownWidth < dropdownOffsetLeft + $navItem.outerWidth())) {
      // set the dropdown menu to left if it exceeds the viewport on the right
      $(this).addClass('dropdown-menu-right');
      outputCss.left = '';
    } else if (dropdownOffsetLeft + dropdownWidth > maxWidth) {
      // full width if the dropdown is too large to fit on the right
      outputCss.left = 0;
      outputCss.right = 0;
      outputCss.width = maxWidth + 'px';
    }
    $(this).css({
      left: outputCss.left,
      right: outputCss.right,
      width: outputCss.width
    });
  });
}

$("#trigger-btn").on("click", function () {
  positionDropdowns();
  $(this)
    .text("Done!")
    .addClass("btn-success")
    .removeClass("btn-danger");
});

var resizeTimer;

$(window).on("resize", function (e) {
  clearTimeout(resizeTimer);
  resizeTimer = setTimeout(function () {
    maxWidth = $maxWidthElement.width();
    positionDropdowns();
  }, 250);
});

function loadTop4() {
  var amount = document.getElementsByClassName("product").length;
  $.ajax({
    type: "post",
    url: "/cellphone/loadtop4products",
    data: {
      exist: amount
    },
    success: function (response) {
      var row = document.getElementById("newlist");
      row.innerHTML += response;
    }
  });
}

$(document).ready(function () {
  $.ajax({
    type: "post",
    url: "/cellphone/bestsell",
    success: function (response) {
      var row = document.getElementById("best");
      if (row !== null && row !== undefined) {
        row.innerHTML += '<div class="owl-carousel col-md-12 col-sm-12">' + response + '</div>';
      }
      $(document).ready(function () {
        $(".owl-carousel").owlCarousel();
      });

      $(".owl-carousel").owlCarousel({
        autoplay: true,
        autoplayhoverpause: true,
        autoplaytimeout: 100,
        nav: true,
        loop: true,
        margin: 0,
        responsive: {
          0: {
            items: 1,
            dots: false
          },
          600: {
            items: 2,
            dots: false
          },
          1000: {
            items: 4,
            dots: false
          }
        }
      });
    }
  });
});

$(document).ready(function () {
  $.ajax({
    type: "post",
    url: "/cellphone/loadtop4product",
    success: function (response) {
      var row = document.getElementById("newlist");
      if (row !== null && row !== undefined) {
        row.innerHTML += response;
      }
    }
  });
});

function addLoadEvent(func) {
  var oldonload = window.onload;
  if (typeof window.onload !== 'function') {
    window.onload = func;
  } else {
    window.onload = function () {
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
    newPrice = newPrice.replaceAll(',', '.').concat('đ');
    price[i].innerHTML = newPrice;
  }
});

function buy(id) {
  window.location = "atc?id=" + id + "&num=" + 1;
}