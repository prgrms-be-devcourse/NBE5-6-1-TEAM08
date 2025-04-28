<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Grids & Circle - 로그인</title>

</head>
<body>

<div class="login-container">
  <a href="../main">
    <img src="img/logo.png" alt="Grids & Circle 로고">
  </a>

  <%-- 에러 메시지 출력 --%>
  <% if (request.getAttribute("error") != null) { %>
  <div class="error-message">
    <%= request.getAttribute("error") %>
  </div>
  <% } %>

  <form action="login" method="post">
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

      <a href="../main">
      <button type="submit" class="login-btn">LOGIN</button>
      </a>

    </div>
  </form>

  <a href="signup" class="signup-link">JOIN US</a>
  <a href="guest_login" class="signup-link" style="font-size: 13px; color: #555;">비회원 로그인</a>
</div>

</body>
</html>
