<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.grepp.spring.app.model.order.dto.Order" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

<%-- 주문 내역이 존재하는 경우 --%>
<c:if test="${not empty orders}">
  <table>
    <thead>
    <tr>
      <th>상품명</th>
      <th>수량</th>
      <th>주문일</th>
        <%--      <th>상태</th>--%>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="order" items="${orders}">
      <tr>
        <td>${order.productName}</td>
        <td>${order.orderCnt}</td>
        <td>${order.orderDate}</td>
          <%--        <td>${order.status}</td>--%>
      </tr>
    </c:forEach>
    </tbody>
  </table>
  <%-- 주문 내역이 없는 경우 --%>
</c:if>
<c:if test="${empty orders}">
  <div class="empty-message">
    주문 내역이 없습니다.
  </div>
</c:if>

</body>
</html>