<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Grids & Circle - 회원가입</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/login.css">
</head>
<body>

<div class="login-container">
  <a href="${pageContext.request.contextPath}/">
    <img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="Grids & Circle 로고">
  </a>

  <div class="title-text">회원가입</div>

  <% if (request.getAttribute("error") != null) { %>
  <p style="color:red;"><%= request.getAttribute("error") %></p>
  <% } %>

  <form id="signupForm" onsubmit="submitSignupForm(); return false;">
    <div class="input-box">
      <input type="text" name="username" id="username" placeholder="ID" required>
      <button type="button" class="id-check-btn" onclick="checkDuplicateId()">중복확인</button>
    </div>
    <div class="input-box">
      <input type="password" name="password" id="password" placeholder="Password" required>
    </div>
    <div class="input-box">
      <input type="email" name="email" id="email" placeholder="Email" required>
    </div>
    <div class="input-box">
      <input type="text" name="phone" id="phone" placeholder="전화번호" required>
    </div>
    <button type="submit" class="login-btn">회원가입</button>
  </form>

  <a href="${pageContext.request.contextPath}/login" class="signup-link">이미 계정이 있으신가요? 로그인</a>
</div>

<script>
  const contextPath = '${pageContext.request.contextPath}';
  let isIdChecked = false;

  async function checkDuplicateId() {
    const username = document.getElementById('username').value.trim();

    if (!username) {
      alert('ID를 입력해주세요.');
      return;
    }

    try {
      const res = await fetch(`${contextPath}/api/users/check-id?username=${encodeURIComponent(username)}`);
      const data = await res.text();

      alert(data.includes('가능') ? '사용 가능한 ID입니다.' : '이미 사용 중인 ID입니다.');
      isIdChecked = data.includes('가능');
    } catch (err) {
      console.error('ID 중복확인 오류:', err);
      alert('서버 오류가 발생했습니다. 다시 시도해주세요.');
    }
  }

  async function submitSignupForm() {
    if (!isIdChecked) {
      alert('ID 중복확인을 해주세요.');
      return false;
    }

    const userData = {
      username: document.getElementById('username').value.trim(),
      password: document.getElementById('password').value.trim(),
      email: document.getElementById('email').value.trim(),
      phone: document.getElementById('phone').value.trim()
    };

    try {
      const res = await fetch(`${contextPath}/api/users/register`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(userData)
      });

      if (res.ok) {
        alert('회원가입 성공!');
        window.location.href = `${contextPath}/login`;
      } else {
        const errorMessage = await res.text();
        alert('회원가입 실패: ' + errorMessage);
      }
    } catch (err) {
      console.error('회원가입 요청 오류:', err);
      alert('서버 오류가 발생했습니다.');
    }
  }
</script>

</body>
</html>
