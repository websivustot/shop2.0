function basket(goodId) {
    $.ajax({
        url: '/cart/add/?asAjax=true',
        method: 'GET',
        data: {
            'good_id': goodId,
            'quantity': 1
        },
        dataType: 'json',
        cache: false
    }).done(function (res) {
        console.log(res);
        alert("Товар добавлен в корзину.");
    }).fail(function (res) {
        console.log(res);
        alert('Ошибка добавления товара.');
    });
}
function clearBasket(userId){
  $.ajax({
      url: '/user/clear_basket.php',
      method: 'GET',
      data: {
          'user_id': userId
      },
      dataType: 'json',
      cache: false
  }).done(function () {
      alert("Корзина очищена");
  }).fail(function () {
      alert('Ошибка очистки корзины' + res);
  });
  document.location.href = '/user/cart';
}
function showBasket(){
  document.location.href = '/user/cart';
}
function showMore(goodId) {
    $.ajax({
        url: '/user/more_goods.php',
        method: 'GET',
        data: {
            'good_id': goodId,
            'quantity': 1
        },
        dataType: 'json',
        cache: false
    }).done(function (res) {
        console.log(res);
        alert("!!!.");
    }).fail(function (res) {
        console.log("!!!" + res);
        alert('Ошибка загрузки товаров');
    });
}
