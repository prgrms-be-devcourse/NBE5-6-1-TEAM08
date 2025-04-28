<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/view/include/page.jsp" %>
<html lang='ko'>
<head>
    <title>Title</title>
    <%@ include file="/WEB-INF/view/include/static.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<%@include file="/WEB-INF/view/include/sidenav.jsp" %>
<main class="container">
    <h4>form</h4>
    <ul>
        <li><c:out value="${dto.userId}"/></li>
        <li><c:out value="${dto.email}"/></li>
        <li><c:out value="${dto.tel}"/></li>
        <li><c:out value="${dto.lastAccess}"/></li>
    </ul>
</main>
<%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>
