<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Grids & Circle - 장바구니</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Merriweather&display=swap" rel="stylesheet">
</head>
<body>

<header>
  <div class="logo">
    <a href="<%= request.getContextPath() %>/index.jsp">
      <img src="<%= request.getContextPath() %>/img/logo.png" alt="Grids & Circle 로고">
    </a>
  </div>
</header>

<div class="container">
  <div class="left-box" id="cart-container">
    <!-- 장바구니 항목이 여기에 동적으로 삽입됩니다 -->
  </div>
</div>

<script>
  let cartItems = []; // 현재 장바구니 항목 저장용

  // 페이지 로드 시 서버에서 장바구니 데이터 fetch
  window.onload = function() {
    fetch('<%= request.getContextPath() %>/api/cart') // ← 백엔드에서 JSON 형태로 장바구니 데이터 반환해야 함
      .then(response => response.json())
      .then(data => {
        cartItems = data;
        renderCart();
      })
      .catch(error => console.error('장바구니 불러오기 실패', error));
  };

  function renderCart() {
    const container = document.getElementById('cart-container');
    container.innerHTML = '';

    let itemsHtml = cartItems.map((item, index) => `
    <div class="cart-item" data-index="${index}">
      <img src="${item.imageUrl}" alt="상품 이미지">
      <div class="cart-info">
        <div class="product-name">
          ${item.name}
          <button class="remove-btn" onclick="removeItem(${index})"><i class="fas fa-times"></i></button>
        </div>
        <div class="small-info">상품코드: ${item.productId}</div>
        <div class="quantity-box">
          <button onclick="decreaseQuantity(${index})">-</button>
          <input type="number" value="${item.quantity}" min="1" readonly>
          <button onclick="increaseQuantity(${index})">+</button>
        </div>
        <div class="price-info">${formatPrice(item.price * item.quantity)}원</div>
      </div>
    </div>
  `).join('');

    const summaryHtml = `
    <div class="summary">
      <div>소계: ${formatPrice(calculateSubtotal())}원</div>
      <div>배송비: ${formatPrice(3000)}원</div>
      <div><strong>총액: ${formatPrice(calculateSubtotal() + 3000)}원</strong></div>
    </div>
    <div class="actions">
      <button onclick="saveCart()">장바구니 저장하기</button>
      <button onclick="location.href='<%= request.getContextPath() %>/payment.jsp'">결제하기</button>
    </div>
  `;

    container.innerHTML = itemsHtml + summaryHtml;
  }

  function formatPrice(price) {
    return price.toLocaleString('ko-KR');
  }

  function calculateSubtotal() {
    return cartItems.reduce((total, item) => total + (item.price * item.quantity), 0);
  }

  function increaseQuantity(index) {
    cartItems[index].quantity++;
    renderCart();
  }

  function decreaseQuantity(index) {
    if (cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
      renderCart();
    }
  }

  function removeItem(index) {
    cartItems.splice(index, 1);
    renderCart();
  }

  function saveCart() {
    fetch('<%= request.getContextPath() %>/api/save-cart', {
      method: 'PUT',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(cartItems)
    })
      .then(response => {
        if (response.ok) {
          alert('장바구니가 저장되었습니다!');
        } else {
          alert('저장 실패');
        }
      })
      .catch(error => console.error('저장 에러', error));
  }
</script>

</body>
</html>
