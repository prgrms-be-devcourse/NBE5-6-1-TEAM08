<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
  String username = (String) session.getAttribute("username");
  String guestEmail = (String) session.getAttribute("guestEmail");
  boolean isLoggedIn = (username != null || guestEmail != null);
  boolean isAdmin = "admin".equals(username);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>mypage_main</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Merriweather&display=swap">
  <link rel="stylesheet" href="mypage.css">
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
  <div class="left-panel">
    <h3>마이페이지</h3>
    <h6></h6>
    <ul id="menuList">
      <li><a class="goto-link" onclick="loadPage(this, '<%= request.getContextPath() %>/userOrderlist.jsp')">주문 내역 확인</a></li>
      <li><a class="goto-link" onclick="loadPage(this, '<%= request.getContextPath() %>/paymentSet.html')">결제 수단 등록</a></li>
      <li><a class="goto-link" onclick="loadPage(this, '<%= request.getContextPath() %>/cs.html')">1 : 1 문의 내역</a></li>
      <% if (!isAdmin && username != null) { %>
      <li><a class="goto-link" onclick="loadPage(this, '<%= request.getContextPath() %>/userEdit.jsp')">개인 정보 수정</a></li>
      <% } %>
    </ul>

    <h3></h3>
    <h3></h3>
    <h3></h3>

    <div class="goto-link" style="margin-bottom: 20px;">
      <a href="<%= request.getContextPath() %>/index.jsp">홈으로</a>
    </div>

    <% if (isAdmin) { %>
    <div style="font-size: 13px; margin-top: 30px;">
      <a class="goto-link" onclick="loadPage(this, '<%= request.getContextPath() %>/admin_orderlist.jsp')">전체 주문 내역 확인</a><br><br>
      <a class="goto-link" onclick="loadPage(this, '<%= request.getContextPath() %>/admin_stock.jsp')">재고 관리</a>
    </div>
    <% } %>
  </div>

  <div class="right-panel" id="rightPanel">
    <iframe id="iframee" width="100%" height="100%" style="border: none;" onerror="handleIframeError()"></iframe>
  </div>
</div>

<script>
  function loadPage(link, pageUrl) {
    var iframe = document.getElementById('iframee');
    var rightPanel = document.getElementById('rightPanel');
    iframe.style.display = 'block';
    iframe.src = pageUrl;

    var links = document.querySelectorAll('.goto-link');
    links.forEach(function (item) {
      item.classList.remove('active-link');
    });

    if (link) {
      link.classList.add('active-link');
    }
  }

  function handleIframeError() {
    var iframe = document.getElementById('iframee');
    var rightPanel = document.getElementById('rightPanel');
    iframe.style.display = 'none';
    rightPanel.innerHTML = "<div style='text-align:center; padding:100px; font-size:18px;'>페이지를 불러올 수 없습니다.</div>";
  }

  window.onload = function () {
    var firstLink = document.querySelectorAll('.goto-link')[0];
    loadPage(firstLink, '<%= request.getContextPath() %>/userOrderlist.jsp');
  };
</script>

</body>
</html>
