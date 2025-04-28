<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>주문 내역 확인</title>
    <link rel="stylesheet" href="/assets/css/userorderlist.css">

</head>
<body>

<h2>주문 내역 확인</h2>

<!-- 주문 목록이 비어있지 않은 경우 -->
<c:if test="${not empty orderList}">
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
        <c:forEach var="order" items="${orderList}">
            <tr>
                <td>${order.productName}</td>
                <td>${order.orderCnt}</td> <!-- 수량은 orderCnt 필드로 가정 -->
                <td>${order.orderDate}</td>
                <td>${order.status}</td> <!-- status 필드도 있는 걸로 가정 -->
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>

<!-- 주문 목록이 비어있는 경우 -->
<c:if test="${empty orderList}">
    <div class="empty-message">
        주문 내역이 없습니다.
    </div>
</c:if>

</body>
</html>
