<%@ page contentType="text/html;charset=utf-8"%>
<%@include file="db.jsp"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>로그아웃</title>

</head>
<body>
<%
        session.invalidate(); // destroy session
        response.sendRedirect("index.jsp");
%>

</body>
</html>
