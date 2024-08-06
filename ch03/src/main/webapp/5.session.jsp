<%@page import="sub1.UserVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>5.session</title>
</head>
<body>
	<h3>5.session 내장객체</h3>
	
	<h4>session ID 확인</h4>
	<%= session.getId() %>
	
	<h4>session 설정</h4>
	<%
		String agent = request.getHeader("User-Agent");
	
		if(agent.contains("Edg")){
			//엣지 브라우저 이면
			UserVO user = new UserVO("a101", "김유신", 23);
			
			session.setAttribute("user", user);
			
		}else{
			//크롬 브라우저 이면
			UserVO user = new UserVO("a102", "김춘추", 21);
			session.setAttribute("user", user);
		}
	
		UserVO userVO = (UserVO)session.getAttribute("user");
		
	
	%>
	<p>
		아이디 : <%= userVO.getUid() %><br>
		이름 : <%= userVO.getName() %><br>
		나이 : <%= userVO.getAge() %><br>
	</p>
</body>
</html>