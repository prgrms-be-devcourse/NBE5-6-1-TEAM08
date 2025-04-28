<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Grids & Circle - 비회원 로그인</title>
</head>
<body>

<div class="login-container">
  <a href="<%= request.getContextPath() %>/index.jsp">
    <img src="<%= request.getContextPath() %>/img/logo.png" alt="Grids & Circle 로고">
  </a>

  <form action="<%= request.getContextPath() %>/guest-login" method="post">
    <div class="input-box">
      <input type="email" name="guestEmail" placeholder="E-mail" required>
    </div>
    <button type="submit" class="guest-btn">→</button>
  </form>
</div>

</body>
</html>
