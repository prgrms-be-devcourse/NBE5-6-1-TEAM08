<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Product" %>
<%
  Product product = (Product) request.getAttribute("product");
  String username = (String) session.getAttribute("username");
  boolean isLoggedIn = (username != null);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Grids & Circle - <%= product != null ? product.getTitle() : "상품 없음" %></title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Merriweather&display=swap">

  <style>
    /* CSS */
    body { margin: 0; padding: 0; background-color: #e3ded5; font-family: Arial, sans-serif; }
    header { display: flex; justify-content: space-between; align-items: center; padding: 20px 30px; background-color: #e3ded5; box-shadow: 0 2px 4px rgba(0,0,0,0.1); height:6vh; }
    .logo { transform: translateX(-50%); position: absolute; left: 50%; }
    .logo img { height: 60px; }
    .buttons a { background-color: transparent; border: 1px solid transparent; color: #6a6a6a; padding: 10px 20px; border-radius: 5px; text-decoration: none; transition: all 0.2s; }
    .buttons a:hover { background-color: transparent; color: black; }

    .container { max-width: 1200px; margin: 40px auto; padding: 0 20px; display: flex; gap: 40px; }
    .left-panel { flex: 1; }
    .left-panel img { width: 100%; margin-left: auto; }
    .right-panel { flex: 1; display: flex; flex-direction: column; justify-content: center; gap: 20px; }

    .product-title { font-size:35px; font-family: 'Merriweather', serif; font-weight: normal; color: #000000; }
    .product-description { font-size: 13px; line-height: 1.7; color: #444; }

    .quantity-box { display: flex; align-items: center; gap: 10px; }
    .quantity-box input { width: 100px; text-align: center; font-size:18px; border: 1px solid #ccc; padding: 5px; }

    .actions { display: flex; gap: 20px; }
    .actions button { padding: 12px 20px; font-size: 16px; border: 1px solid #333; border-radius: 8px; background-color: #e3ded5; cursor: pointer; transition: all 0.2s; }
    .actions button:hover { background-color: #000000; color: #edede9; }
  </style>
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
    <a href="../member/login.jsp" id="loginBtn"><i class="fa-regular fa-user"></i></a>
    <a href="../member/login.jsp" id="cartBtn"><i class="fa-solid fa-cart-shopping"></i></a>
    <% } else { %>
    <a href="../member/mypage.jsp" id="mypageBtn"><i class="fa-solid fa-user"></i></a>
    <a href="logout.jsp" id="logoutBtn"><i class="fa-solid fa-arrow-right-from-bracket"></i></a>
    <% } %>
  </div>
</header>

<% if (product != null) { %>
<div class="container">
  <div class="left-panel">
    <img src="<%= product.getImage() %>" alt="<%= product.getTitle() %>">
  </div>
  <div class="right-panel">
    <div class="product-title" id="productTitle"><%= product.getTitle() %></div>
    <div class="product-description"><%= product.getDescription() %></div>

    <form method="post" action="add-to-cart">
      <input type="hidden" name="productId" value="<%= product.getId() %>">
      <div class="quantity-box">
        <label for="quantity"></label>
        <input type="number" name="quantity" id="quantity" value="1" min="1">
      </div>
      <div class="actions">
        <button type="submit" name="action" value="add"><i class="fa-solid fa-cart-plus"></i> Add</button>
        <button type="submit" name="action" value="buy"><i class="fa-solid fa-credit-card"></i> Buy</button>
      </div>
    </form>
  </div>
</div>
<% } else { %>
<p style="text-align:center; padding: 50px;">상품 정보가 없습니다.</p>
<% } %>

</body>
</html>
s