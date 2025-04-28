<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Grids & Circle - 회원가입</title>
  <link rel="stylesheet" href="/assets/css/signup.css">
</head>
<body>

<div class="login-container">
  <a href="main">
    <img src="img/logo.png" alt="Grids & Circle 로고">
  </a>

  <div class="title-text">회원가입</div>

  <% if (request.getAttribute("error") != null) { %>
  <p style="color:red;"><%= request.getAttribute("error") %></p>
  <% } %>

  <form id="signupForm" action="signup" method="post" onsubmit="return validateForm()">
    <div class="input-box">
      <input type="text" name="userid" id="userid" placeholder="ID" required>
      <button type="button" class="id-check-btn" onclick="checkDuplicateId()">중복확인</button>
    </div>
    <div class="input-box">
      <input type="password" name="password" id="password" placeholder="Password" required>
    </div>
    <div class="input-box">
      <input type="email" name="email" id="email" placeholder="Email" required>
    </div>
    <div class="input-box">
      <input type="text" name="address" id="address" placeholder="주소" required>
    </div>
    <div class="input-box">
      <input type="text" name="postnum" id="postnum" placeholder="우편번호" required>
    </div>
    <div class="input-box">
      <input type="text" name="tel" id="tel" placeholder="전화번호" required>
    </div>
    <button type="submit" class="login-btn">회원가입</button>
  </form>

  <a href="login" class="signup-link">이미 계정이 있으신가요? 로그인</a>
</div>

<script>
  let isIdChecked = false;

  async function checkDuplicateId() {
    const userId = document.getElementById('userid').value.trim();

    if (!userId) {
      alert('ID를 입력해주세요.');
      return;
    }

    try {
      const res = await fetch(`/api/check-id?userid=${encodeURIComponent(userId)}`);
      const data = await res.json();

      if (data.exists) {
        alert('이미 사용 중인 ID입니다.');
        isIdChecked = false;
      } else {
        alert('사용 가능한 ID입니다.');
        isIdChecked = true;
      }
    } catch (err) {
      console.error('ID 중복확인 오류:', err);
      alert('서버 오류가 발생했습니다. 다시 시도해주세요.');
    }
  }

  function validateForm() {
    if (!isIdChecked) {
      alert('ID 중복확인을 해주세요.');
      return false;
    }

    const requiredFields = ['userid', 'password', 'email', 'address', 'postnum', 'tel'];

    for (let field of requiredFields) {
      if (!document.getElementById(field).value.trim()) {
        alert('모든 입력 항목을 작성해주세요.');
        return false;
      }
    }

    return true;
  }
</script>

</body>
</html>
