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
  <link rel="stylesheet" href="cart.css">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Merriweather&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
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
          <form method="post" action="remove-cart" style="display:inline;">
            <input type="hidden" name="productId" value="<%= item.getId() %>">
            <button class="remove-btn" type="submit"><i class="fas fa-times"></i></button>
          </form>
        </div>
        <div class="small-info">상품코드: <%= item.getId() %></div>
        <form method="post" action="update-cart">
          <div class="quantity-box">
            <input type="hidden" name="productId" value="<%= item.getId() %>">
            <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1" onchange="this.form.submit()">
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

  <div class="right-boxes">
    <div class="right-box" style="position: relative;">
      <h4>배송 정보</h4>
      <% if (user != null) { %>
      <div class="small-info">이름: <%= user.getName() %></div>
      <div class="small-info">이메일: <%= user.getEmail() %></div>
      <div class="small-info">연락처: <%= user.getPhone() %></div>
      <div class="small-info">주소: <%= user.getAddress() %></div>
      <button class="mypage-btn" onclick="location.href='mypage.jsp'">
        <i class="fas fa-user-edit"></i>
      </button>
      <% } else { %>
      <form action="guest-info" method="post">
        <div class="small-info">
          이메일 입력: <input type="email" name="guestEmail" required style="margin-top:10px; padding:5px;">
        </div>
        <button type="submit" style="margin-top:10px; padding:5px 10px;">등록</button>
      </form>
      <% } %>
    </div>

    <div class="right-box">
      <div class="actions">
        <form action="payment.html" method="get">
          <button type="submit">결제하기</button>
        </form>
      </div>
    </div>
  </div>
</div>

</body>
</html>
