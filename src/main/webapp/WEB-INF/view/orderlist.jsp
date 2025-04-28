<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>admin - 주문 내역 관리</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Merriweather&display=swap" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/admin_orderlist.css">
</head>
<body>

<h1>주문 내역 (Admin 전용)</h1>

<table>
  <thead>
  <tr>
    <th>주문 ID</th>
<%--    <th>고객명</th>--%>
    <th>이메일</th>
    <th>상품명</th>
    <th>수량</th>
<%--    <th>총액</th>--%>
    <th>주문일</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="order" items="${allOrders}">
    <tr>
      <td>${order.userId}</td>
<%--      <td>${order.customerName}</td>--%>
      <td>${order.email}</td>
      <td>${order.productName}</td>
      <td>${order.orderCnt}</td>
<%--      <td>${order.totalPrice}</td>--%>
      <td>${order.orderDate}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>

</body>
</html>