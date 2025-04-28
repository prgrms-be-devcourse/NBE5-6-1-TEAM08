<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Grids & Circle - 로그인</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/login.css">
</head>
<body>

<div class="login-container">
  <a href="${pageContext.request.contextPath}/">
    <img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="Grids & Circle 로고">
  </a>

  <form action="${pageContext.request.contextPath}/login" method="post">
    <div class="input-box">
      <input type="text" name="username" placeholder="ID" required>
    </div>
    <div class="input-box">
      <input type="password" name="password" placeholder="Password" required>
    </div>

    <div class="login-options">
      <div class="remember-me">
        <input type="checkbox" name="rememberMe" id="rememberMe">
        <label for="rememberMe">아이디 저장</label>
      </div>
      <button type="submit" class="login-btn">LOGIN</button>
    </div>
  </form>

  <div class="links">
    <a href="${pageContext.request.contextPath}/signup" class="signup-link">JOIN US</a>
    <a href="${pageContext.request.contextPath}/guest_login" class="signup-link" style="font-size: 13px; color: #555;">비회원 로그인</a>
  </div>

  <%-- 로그인 실패 시 에러메시지 표시 --%>
  <c:if test="${not empty param.error}">
    <div class="error-message" style="color: red; margin-top: 10px; font-size: 14px;">
      아이디 또는 비밀번호가 올바르지 않습니다.
    </div>
  </c:if>
</div>

</body>
</html>
