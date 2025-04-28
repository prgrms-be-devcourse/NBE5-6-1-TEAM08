<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Grids & Circle - 비회원 주문</title>

</head>
<body>

<div class="login-container">
  <a href="main">
    <img src="img/logo.png" alt="Grids & Circle 로고">
  </a>

  <%-- 에러 메시지(비회원 로그인 실패 시) --%>
  <% if (request.getAttribute("error") != null) { %>
  <p style="color:red;"><%= request.getAttribute("error") %></p>
  <% } %>

  <form action="guest-login" method="post">
    <div class="input-box">
      <input type="email" name="guestEmail" placeholder="E-mail" required>
    </div>
    <button type="submit" class="guest-btn">→</button>
  </form>
</div>

</body>
</html>
