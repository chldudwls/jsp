<%@page import="sub1.Account"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%--
		날짜 : 2024/08/05
		이름 : 최영진
		내용 : JSP 기본문법 실습하기
	 --%>
</head>
<body>
	<h3>4.지시자</h3>
	
	<h4>page</h4>
	<%
		Account kb = new Account("국민은행", "101-12-1001", "김유신", 10000);
		Account wr = new Account("국민은행", "101-12-1002", "김춘추", 10000);
	%>
	<!--
  <p><%= kb %></p>
	<p><%= wr %></p>
	-->
	
	<h4>include</h4> 
	<%-- 
	<%@ include file="./imc.header.jsp" %>
	<%@ include file="./imc.footer.jsp" %>
	--%>
</body>
</html>