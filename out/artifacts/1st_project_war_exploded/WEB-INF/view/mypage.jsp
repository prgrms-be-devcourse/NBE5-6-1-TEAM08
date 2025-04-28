<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>mypage_main</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Merriweather&display=swap">
</head>
<body>

<header>
  <div class="logo">
    <a href="<%= request.getContextPath() %>/index.jsp">
      <img src="<%= request.getContextPath() %>/img/logo.png" alt="Grids & Circle 로고">
    </a>
  </div>
</header>

<div class="main-container">
  <!-- nav -->
  <div class="left-panel">
    <h3>마이페이지</h3>
    <h6> </h6>
    <ul>
      <li><a class="goto-link" onclick="loadPage('<%= request.getContextPath() %>/userOrderlist.jsp')">주문 내역 확인</a></li>
      <li><a class="goto-link" onclick="loadPage('<%= request.getContextPath() %>/paymentSet.html')">결제 수단 등록</a></li>
      <li><a class="goto-link" onclick="loadPage('<%= request.getContextPath() %>/cs.html')">1 : 1 문의 내역</a></li>
      <li><a class="goto-link" onclick="loadPage('<%= request.getContextPath() %>/userEdit.jsp')">개인 정보 수정</a></li>
    </ul>

    <h3> </h3>
    <h3> </h3>
    <h3> </h3>

    <div class="goto-link">
      <a href="<%= request.getContextPath() %>/index.jsp">홈으로</a>
    </div>
    <!-- 동적 데이터 삽입 예정 -->
  </div>

  <div class="right-panel">
    <iframe id="iframee" width="100%" height="100%" style="border: none;"></iframe>
    <!-- 동적 데이터 삽입 예정 -->
  </div>
</div>

<script>
  function loadPage(pageUrl) {
    document.getElementById('iframee').src = pageUrl;
  }

  /* 처음 페이지 로드 시 주문 내역 확인 페이지를 불러오기 */
  window.onload = function () {
    loadPage('<%= request.getContextPath() %>/userOrderlist.jsp');
  };
</script>

</body>
</html>
