<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String param = request.getQueryString();
    String uid = request.getParameter("uid");
    String pass = request.getParameter("pass");
    String name = request.getParameter("name");
    String birth = request.getParameter("birth");
    String gender = request.getParameter("gender");
    String[] hobbies = request.getParameterValues("hobby");
    String addr = request.getParameter("addr");
     
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>요청 데이터 수신</h3>
	
	<p>
	파라미터 : <%= param%><br>
	아이디 : <%= name%><br>
	비밀번호 : <%= pass%><br> 
	이름 : <%= name%><br> 
	생년월일 : <%= birth%><br> 
	성별 : <%= gender %><br>
	취미 : 
	<%
		for(String hobby : hobbies){
			out.println(hobby + ",");
		}
	%><br>
	주소 : <%= addr%><br>
	</p>
	<a href="../1.request.jsp">뒤로가기</a>
</body>
</html>