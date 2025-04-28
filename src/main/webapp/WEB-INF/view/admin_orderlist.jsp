<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<%--%>
<%--    String username = (String) session.getAttribute("username");--%>
<%--    if (username == null || !"admin".equals(username)) {--%>
<%--        response.sendRedirect("index.jsp"); //admin계정이 아닌 경우 index로 리다이렉트--%>
<%--        return;--%>
<%--    }--%>
<%--%>--%>
<html>
<head>
  <title>admin - 주문 내역 관리</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Merriweather&display=swap" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/admin_orderlist.css">
</head>
<body>

<header>
  <div class="logo">
    <a href="index"><img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="로고"></a>
  </div>
  <div class="buttons">
    <a href="logout">로그아웃</a>
  </div>
</header>

<div class="container">
  <div class="order-panel">
    <h1>전체 주문 내역 (Admin 전용)</h1>

    <table class="order-table">
      <thead>
      <tr>
        <th>주문 ID</th>
        <th>고객 이메일</th>
        <th>상품명</th>
        <th>수량</th>
<%--        <th>총액</th>--%>
        <th>주문일</th>
        <th>송장 입력</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="order" items="${allOrders}">
        <tr>
          <td>${order.userId}</td>
          <td>${order.email}</td>
          <td>${order.productName}</td>
          <td>${order.orderCnt}</td>
<%--          <td>${order.productPrice}원</td>--%>
          <td>${order.orderDate}</td>
          <td>
            <a href="https://www.cjlogistics.com/ko/tool/parcel/tracking" target="_blank" class="tracking-btn">송장 입력하기</a>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>

</body>
</html>