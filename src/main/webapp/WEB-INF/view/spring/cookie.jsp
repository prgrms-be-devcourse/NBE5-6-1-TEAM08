<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/view/include/page.jsp" %>
<html>
<head>
    <title>Grepp</title>
    <%@include file="/WEB-INF/view/include/static.jsp" %>
</head>
<body>
<%@include file="/WEB-INF/view/include/header.jsp" %>
<%@include file="/WEB-INF/view/include/sidenav.jsp" %>
<main class="container">
    <c:forEach items="${cookie}" var="c">
        <h4>
            <c:out value="${c.value.name}"/>
            <c:out value="${c.value.value}"/>
        </h4>
    </c:forEach>
</main>
<%@include file="/WEB-INF/view/include/footer.jsp" %>

</body>
</html>