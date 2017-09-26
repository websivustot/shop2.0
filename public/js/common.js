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
function clearBasket(){
  $.ajax({
      url: '/cart/clear/?asAjax=true',
      method: 'GET',
      data: {
          'user_id': 'noName'
      },
      dataType: 'json',
      cache: false
  }).done(function (res) {
      alert("Корзина очищена");
  }).fail(function (res) {
      alert('Ошибка очистки корзины' + res);
  });
  document.location.href = '/cart/';
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
