<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Grids & Circle - 회원가입</title>
</head>
<body>

<div class="login-container">
  <a href="index.jsp">
    <img src="img/logo.png" alt="Grids & Circle 로고">
  </a>

  <div class="title-text">회원가입</div>

  <% if (request.getAttribute("error") != null) { %>
  <p style="color:red;"><%= request.getAttribute("error") %></p>
  <% } %>

  <!--  form 수정: action 삭제, onsubmit으로 fetch 요청 -->
  <form id="signupForm" onsubmit="submitSignupForm(); return false;">
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

  <a href="/login" class="signup-link">이미 계정이 있으신가요? 로그인</a>
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
      const res = await fetch(`/api/users/check-id?username=${encodeURIComponent(userId)}`);
      const data = await res.text(); // (서버가 문자열을 리턴하니까)

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
      username: document.getElementById('userid').value.trim(),
      password: document.getElementById('password').value.trim(),
      email: document.getElementById('email').value.trim(),
      address: document.getElementById('address').value.trim(),
      postnum: document.getElementById('postnum').value.trim(),
      tel: document.getElementById('tel').value.trim()
    };

    try {
      const res = await fetch('/api/users/register', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(userData)
      });

      if (res.ok) {
        alert('회원가입 성공!');
        window.location.href = '/login';
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
