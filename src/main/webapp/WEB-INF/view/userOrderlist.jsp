<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.grepp.spring.app.model.order.dto.Order" %>
<%--<%@ page import="model.Order" %> <!-- 주문 정보를 담은 Order 클래스가 있다고 가정-->--%>

<%--<%--%>
<%--    // 주문 목록을 가져온다고 가정--%>
<%--    List<Order> orderList = (List<Order>) request.getAttribute("orderList");--%>
<%--%>--%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>주문 내역 확인</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Merriweather&display=swap" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/userOrderlist.css">
</head>
<body>

<h2>주문 내역 확인</h2>

<% if (orderList != null && !orderList.isEmpty()) { %>
<table>
  <thead>
  <tr>
    <th>상품명</th>
    <th>수량</th>
    <th>주문일</th>
    <th>상태</th>
  </tr>
  </thead>
  <tbody>
  <% for (Order order : orderList) { %>
  <tr>
    <td><%= order.getProductName() %></td>
    <td><%= order.getQuantity() %></td>
    <td><%= order.getOrderDate() %></td>
    <td><%= order.getStatus() %></td>
  </tr>
  <% } %>
  </tbody>
</table>
<% } else { %>
<div class="empty-message">
  주문 내역이 없습니다.
</div>
<% } %>

</body>
</html>
