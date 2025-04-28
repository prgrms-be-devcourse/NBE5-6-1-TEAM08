<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.CartItem, model.UserInfo" %>
<%
  List<CartItem> cartList = (List<CartItem>) request.getAttribute("cartList");
  UserInfo user = (UserInfo) request.getAttribute("user");
  String username = (String) session.getAttribute("username");
  boolean isLoggedIn = (username != null);

  int total = 0;
  for (CartItem item : cartList) {
    total += item.getPrice() * item.getQuantity();
  }
  int delivery = 3000;
  int finalAmount = total + delivery;
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Grids & Circle - 장바구니</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Merriweather&display=swap" rel="stylesheet">
  <style>
    body {
      margin: 0;
      font-family: 'sans-serif';
      background-color: #e3ded5;
    }

    header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 20px 30px;
      background-color: #e3ded5;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
      height:6vh;
    }

    .logo {
      transform: translateX(-50%);
      position: absolute;
      left: 50%;
    }

    .logo img {
      height: 60px;
    }

    .step-indicator {
      display: flex;
      justify-content: center;
      align-items: center;
      margin: 60px 0 40px;
      gap: 200px;
      font-size: 16px;
    }

    .step {
      display: flex;
      align-items: center;
      position: relative;
      color: #888;
      font-weight: bold;
    }

    .step.active {
      color: #000;
    }

    .step::after {
      content: "";
      width: 150px;
      height: 2px;
      background-color: #ccc;
      margin: 0 20px;
      position: absolute;
      top: 50%;
      left: 100%;
      transform: translateY(-50%);
      z-index: -1;
    }

    .step:last-child::after {
      display: none;
    }

    /*좌우 박스 분리*/
    .container {
      display: flex;
      gap: 20px;
      padding: 20px;
    }

    .left-box {
      flex: 2;
      background-color: #ffffff;
      padding: 20px;
      box-shadow: 0 1px 4px rgba(0,0,0,0.1);
    }

    .right-boxes {
      flex: 1;
      margin-left: auto;
      display: flex;
      flex-direction: column;
      gap: 10px;
    }

    .right-box {
      background-color: #ffffff;
      padding: 50px;

      box-shadow: 0 1px 4px rgba(0,0,0,0.1);
    }

    /*장바구니 담은 내역*/
    .cart-item {
      display: flex;
      align-items: center;
      gap: 15px;
      border-bottom: 1px solid #eee;
      padding: 15px 0;
    }

    .cart-item img {
      width: 80px;
      height: 80px;
      object-fit: cover;
      border-radius: 5px;
    }

    .cart-info {
      flex: 1;
      display: flex;
      justify-content: space-between;
      flex-direction: column;
      position: relative;
      height: 100px;
    }

    .product-name {
      font-size: 18px;
      font-weight: bold;
    }

    .small-info {
      font-size: 13px;
      line-height: 2;
      color: #555;
    }

    .price-info {
      position: absolute;
      bottom: 0;
      right: 0;
      font-weight: bold;
      color: #000;
      font-size: 14px;
    }


    .summary {
      margin-top: 20px;
      font-size: 14px;
      text-align: right;
    }

    .summary div {
      margin: 5px 0;
    }

    .summary strong {
      font-size: 16px;
      color: #000;
    }

    .quantity-box {
      display: flex;
      align-items: center;
      gap: 5px;
    }

    .quantity-box input {
      width: 40px;
      text-align: center;
      font-size: 12px;
      border: 1px solid #ccc;
      padding: 5px;
    }

    .remove-btn {
      background: transparent;
      border: none;
      color: #888;
      font-size: 14px;
      margin-left: 10px;
      cursor: pointer;
      transition: color 0.2s;
    }

    .remove-btn:hover {
      color: #e74c3c;
    }

    /*결제하기 버튼*/
    .actions {
      display: flex;
      gap: 20px;
    }

    .actions button {
      padding: 12px 40px;
      margin-right : auto;
      font-size: 16px;
      border: 1px solid #333;
      border-radius: 8px;
      background-color: #e3ded5;
      cursor: pointer;
      transition: all 0.2s;
    }

    .actions button:hover {
      background-color: #000000;
      color: #edede9;
    }
    /*개인정보(마이페이지로 이동) 수정하기 버튼*/
    .mypage btn {
      position: absolute;
      top: 20px;
      right: 20px;
      width: 36px;
      height: 36px;
      border-radius: 50%;
      background-color: #e3ded5;
      border: none;
      cursor: pointer;
      display: flex;
      align-items: center;
      justify-content: center;
      transition: background-color 0.3s;
    }

    .mypage btn:hover {
      background-color: #000;
      color: #fff;
    }

    .mypage btn i {
      font-size: 16px;
      color: #333;
    }
  </style>
</head>
<body>

<header>
  <div class="logo">
    <a href="index.jsp"><img src="img/logo.png" alt="Grids & Circle 로고"></a>
  </div>
</header>

<div class="step-indicator">
  <div class="step active">장바구니</div>
  <div class="step">결제하기</div>
  <div class="step">확인</div>
</div>

<div class="container">
  <!-- 장바구니 목록 -->
  <div class="left-box">
    <div class="left-panel">
      <p><%= cartList.size() %>개의 상품이 장바구니에 담겨 있습니다.</p>
    </div>

    <% for (CartItem item : cartList) { %>
    <div class="cart-item">
      <img src="<%= item.getImage() %>" alt="상품 이미지">
      <div class="cart-info">
        <div class="product-name">
          <%= item.getName() %>
          <form method="post" action="remove-cart">
            <input type="hidden" name="productId" value="<%= item.getId() %>">
            <button class="remove-btn"><i class="fas fa-times"></i></button>
          </form>
        </div>
        <div class="small-info">상품코드: <%= item.getId() %></div>
        <form method="post" action="update-cart">
          <div class="quantity-box">
            <input type="hidden" name="productId" value="<%= item.getId() %>">
            <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1">
          </div>
        </form>
        <div class="price-info"><%= item.getPrice() %>원</div>
      </div>
    </div>
    <% } %>

    <div class="summary">
      <div>소계: <%= total %>원</div>
      <div>배송비: <%= delivery %>원</div>
      <div><strong>총액: <%= finalAmount %>원</strong></div>
    </div>
  </div>

  <!-- 우측: 사용자 정보 + 결제 버튼 -->
  <div class="right-boxes">
    <div class="right-box" style="position: relative;">
      <h4>배송 정보</h4>
      <% if (user != null) { %>
      <div class="small-info">이름: <%= user.getName() %></div>
      <div class="small-info">이메일: <%= user.getEmail() %></div>
      <div class="small-info">연락처: <%= user.getPhone() %></div>
      <div class="small-info">배송지: <%= user.getAddress() %></div>
      <button class="mypage-btn" onclick="location.href='mypage.jsp'">
        <i class="fas fa-user-edit"></i>
      </button>
      <% } else { %>
      <div class="small-info">로그인 후 배송정보가 표시됩니다.</div>
      <% } %>
    </div>

    <div class="right-box">
      <div class="actions">
        <form action="payment.jsp" method="get">
          <button type="submit">결제하기</button>
        </form>
      </div>
    </div>
  </div>
</div>
</body>
</html>
