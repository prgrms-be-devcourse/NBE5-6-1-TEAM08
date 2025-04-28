<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Grids & Circle - 로그인</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Merriweather&display=swap" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/login.css">
</head>
<body>

<div class="login-container">
  <a href="<%= request.getContextPath() %>/index.jsp">
    <img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="Grids & Circle Logo">
  </a>

  <form action="<%= request.getContextPath() %>/login" method="post">
    <div class="input-box">
      <input type="text" name="userId" placeholder="ID" required>
    </div>
    <div class="input-box">
      <input type="password" name="passWord" placeholder="Password" required>
    </div>

    <div class="login-options">
      <div class="remember-me">
        <input type="checkbox" name="rememberMe" id="rememberMe">
        <label for="rememberMe">아이디 저장</label>
      </div>
      <button type="submit" class="login-btn">LOGIN</button>
    </div>
  </form>

  <a href="<%= request.getContextPath() %>/signup.jsp" class="signup-link">JOIN US</a>
  <a href="<%= request.getContextPath() %>/guest_login.jsp" class="signup-link" style="font-size: 13px; color: #555;">비회원 로그인</a>
</div>

</body>
</html>
