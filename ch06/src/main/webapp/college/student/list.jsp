<%@page import="java.util.ArrayList"%>
<%@page import="college.StudentVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<StudentVO> studentVO = new ArrayList<>(); 
	
	try{
		Context initCtx = new InitialContext();
		Context Ctx = (Context) initCtx.lookup("java:comp/env");
		
		DataSource ds = (DataSource) Ctx.lookup("jdbc/college");
		Connection conn = ds.getConnection();
		
		Statement stmt = conn.createStatement();
		String sql = "select * from student";
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			StudentVO vo = new StudentVO();
			vo.setStdNO(rs.getString(1));
			vo.setStdName(rs.getString(2));
			vo.setStdHp(rs.getString(3));
			vo.setStdYear(rs.getInt(4));
			vo.setStdAddress(rs.getString(5));
			
			studentVO.add(vo);
		}
		
		
	}catch(Exception e){
		e.printStackTrace();
	}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>고객 목록</h3>
	<a href="/ch06/2.DBCMTest.jsp">처음으로</a>
	<a href="/ch06/college/lecture.jsp">등록</a>
	
	<table border="1">
		<tr>
			<th>학생번호</th>
			<th>학생이름</th>
			<th>전화번호</th>
			<th>학년</th>
			<th>주소</th>
			<th>관리</th>
		</tr>
		<% for(StudentVO vo : studentVO){ %>
		<tr>
			<td><%= vo.getStdNO() %></td>
			<td><%= vo.getStdName() %></td>
			<td><%= vo.getStdHp() %></td>
			<td><%= vo.getStdYear() %></td>
			<td><%= vo.getStdAddress() %></td>
			<td>
				<a href="@">수정</a>
				<a href="@">삭제</a>
			</td>
			<%} %>
		</tr>
	</table>
</body>
</html>