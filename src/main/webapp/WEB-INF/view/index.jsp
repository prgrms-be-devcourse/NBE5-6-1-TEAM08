<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%

  String username = (String) session.getAttribute("username");
  boolean isLoggedIn = (username != null);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Grids & Circle - 메인화면 </title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Merriweather&display=swap" rel="stylesheet">

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
    <% if (!isLoggedIn) { %>
    <a href="login.jsp" id="loginBtn"><i class="fa-regular fa-user"></i></a>
    <a href="login.jsp" id="cartBtn"><i class="fa-solid fa-cart-shopping"></i></a>
    <% } else { %>
    <a href="mypage.jsp" id="mypageBtn"><i class="fa-solid fa-user"></i></a>
    <a href="logout.jsp" id="logoutBtn"><i class="fa-solid fa-arrow-right-from-bracket"></i></a>
    <% } %>
  </div>
</header>

<div class="banner">
  <img src="img/welcome.jpg" alt="Coffee Banner">
  <div class="banner-text">Welcome to Grids & Circle Coffee</div>
</div>

<div class="welcome-message">
  -<br>
  We sell only the best quality coffee beans<br>
  -<br>
</div>

<main class="products" id="productList"></main>

<script>
  window.onload = async function () {
    try {
      const res = await fetch('/api/products');
      const products = await res.json();
      const productList = document.getElementById('productList');

      productList.innerHTML = '';
      products.forEach(product => {
        const card = document.createElement('div');
        card.className = 'product';
        card.onclick = () => location.href = `product.jsp?id=${product.id}`;
        card.innerHTML = `
          <img src="${product.image}" alt="${product.title}">
          <div class="product-title">${product.title}</div>
        `;
        productList.appendChild(card);
      });
    } catch (err) {
      console.error('상품 목록을 불러오는 데 실패했습니다.', err);
      document.getElementById('productList').innerHTML = '<p style="text-align:center;">상품을 불러오지 못했습니다.</p>';
    }
  };
</script>
</body>
</html>
