<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>admin - 주문 내역 관리</title>

</head>
<body>

<h1>주문 내역 (Admin 전용)</h1>

<table>
  <thead>
  <tr>
    <th>주문 ID</th>
    <th>고객명</th>
    <th>상품명</th>
    <th>수량</th>
    <th>총액</th>
    <th>주문일</th>
    <th>상태</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="order" items="${orderList}">
    <tr>
      <td>${order.id}</td>
      <td>${order.customerName}</td>
      <td>${order.productName}</td>
      <td>${order.quantity}</td>
      <td>${order.totalPrice}</td>
      <td>${order.orderDate}</td>
      <td>${order.status}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>

</body>
</html>
