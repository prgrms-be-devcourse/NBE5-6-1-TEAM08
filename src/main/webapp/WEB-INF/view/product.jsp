<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String username = (String) session.getAttribute("username");
  String guestEmail = (String) session.getAttribute("guestEmail");
  boolean isLoggedIn = (username != null || guestEmail != null);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Grids & Circle - 상품 상세</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Merriweather&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="index.css">
</head>
<body>

<header>
  <div class="header-left"></div>

  <div class="logo">
    <a href="index.jsp">
      <img src="img/logo.png" alt="Grids & Circle Logo">
    </a>
  </div>

  <div class="header-right buttons">
    <a href="cart.jsp" id="cartBtn"><i class="fa-solid fa-cart-shopping"></i></a>

    <% if (username != null) { %>
    <a href="mypage.jsp" id="mypageBtn"><i class="fa-solid fa-user"></i></a>
    <a href="logout.jsp" id="logoutBtn"><i class="fa-solid fa-arrow-right-from-bracket"></i></a>
    <% } else if (guestEmail != null) { %>
    <a href="mypage.jsp" id="mypageBtn"><i class="fa-solid fa-user"></i></a>
    <% } else { %>
    <a href="login.jsp" id="loginBtn"><i class="fa-regular fa-user"></i></a>
    <% } %>
  </div>
</header>

<div class="container">
  <div class="left-panel">
    <img id="productImage" src="img/default.png" alt="상품 이미지">
  </div>

  <div class="right-panel">
    <div class="product-title" id="productTitle">상품명</div>
    <div class="product-description" id="productDescription">간단한 상품 설명</div>
    <div class="product-price" id="productPrice">0원</div>

    <div class="quantity-box">
      <input type="number" id="quantity" value="1" min="1">
    </div>

    <div class="actions">
      <button onclick="handleAddToCart()"><i class="fa-solid fa-cart-plus"></i> Add</button>
      <button onclick="handleBuy()"><i class="fa-solid fa-credit-card"></i> Buy</button>
    </div>
  </div>
</div>

<script>
  let productData = {};

  async function fetchProduct() {
    const urlParams = new URLSearchParams(window.location.search);
    const productId = urlParams.get('id');

    if (!productId) {
      document.body.innerHTML = '<p style="text-align:center; padding:50px;">상품 정보가 없습니다.</p>';
      return;
    }

    try {
      const res = await fetch('<%= request.getContextPath() %>/api/product?id=' + productId);
      if (!res.ok) {
        throw new Error('네트워크 응답 실패');
      }
      productData = await res.json();

      document.getElementById('productTitle').innerText = productData.title;
      document.getElementById('productDescription').innerText = productData.description;
      document.getElementById('productPrice').innerText = productData.price.toLocaleString('ko-KR') + '원';
      document.getElementById('productImage').src = productData.image;
    } catch (error) {
      console.error('상품 정보를 불러오지 못했습니다.', error);
      document.body.innerHTML = '<p style="text-align:center; padding:50px;">상품 정보를 불러오는 데 문제가 발생했습니다.</p>';
    }
  }

  function handleAddToCart() {
    const quantity = document.getElementById('quantity').value;
    const sessionKey = localStorage.getItem('sessionKey') || generateSessionKey();

    fetch('<%= request.getContextPath() %>/api/add-to-cart', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        sessionKey: sessionKey,
        productId: productData.id,
        quantity: Number(quantity)
      })
    })
      .then(res => res.json())
      .then(data => {
        localStorage.setItem('sessionKey', sessionKey);
        alert('장바구니에 추가되었습니다!');
      })
      .catch(error => console.error('장바구니 추가 실패', error));
  }

  function handleBuy() {
    window.location.href = 'cart.jsp';
  }

  function generateSessionKey() {
    const key = 'session_' + Math.random().toString(36).substr(2, 9);
    localStorage.setItem('sessionKey', key);
    return key;
  }

  window.onload = fetchProduct;
</script>

</body>
</html>
