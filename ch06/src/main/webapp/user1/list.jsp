<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User1::list</title>
</head>
<body>
	<h3>User1 목록</h3>
	
	<a href="/ch06/1.jdbcTest.jsp">처음으로</a>
	<a href="/ch06/user1/register.jsp">등록</a>
	
	
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>휴대폰</th>
			<th>나이</th>
			<th>관리</th>
		</tr>
		<tr>
			<th>a101</th>
			<th>김유신</th>
			<th>1990-11-11</th>
			<th>010-1234-1234</th>
			<th>23</th>
			<td>
				<a href="#">수정</a>
				<a href="#">삭제</a>
			</td>
		</tr>
	</table>
	
	
</body>
</html>