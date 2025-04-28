<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Grids & Circle - 로그인</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/login.css">
</head>
<body>

<div class="login-container">
  <a href="<%= request.getContextPath() %>/index.jsp">
    <img src="<%= request.getContextPath() %>/img/logo.png" alt="Grids & Circle 로고">
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

  <div class="links">
    <a href="${pageContext.request.contextPath}/signup" class="signup-link">JOIN US</a>
    <a href="<%= request.getContextPath() %>/guest_login.jsp" class="signup-link" style="font-size: 13px; color: #555;">비회원 로그인</a>
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
