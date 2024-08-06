<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전성 데이터 수신
	String param = request.getQueryString();
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>result2</title>
</head>
<body>
	<h3>post 요청 데이터 수신</h3>
	
	<p>
		파라미터 : <%= param %><br>
		아이디 : <%= uid %><br>
		이름 : <%= name %><br>
		나이 : <%= age %>
	</p>
	<a href="../1.request.jsp">뒤로가기</a>
</body>
</html>