<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="college.LectureVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="org.apache.catalina.tribes.transport.DataSender"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	List<LectureVO> lectureVO = new ArrayList<>();
	try{
	Context initCtx = new InitialContext();
	Context Ctx = (Context) initCtx.lookup("java:comp/env");
	
	DataSource ds = (DataSource) Ctx.lookup("jdbc/college");
	Connection conn = ds.getConnection();
	
	Statement stmt = conn.createStatement();
	
	String sql = "select * from lecture";
	
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){
		LectureVO vo = new LectureVO();
		vo.setLecNO(rs.getInt(1));
		vo.setLecName(rs.getString(2));
		vo.setLecCredit(rs.getInt(3));
		vo.setLecTime(rs.getInt(4));
		vo.setLecClass(rs.getString(5));
		
		lectureVO.add(vo);
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
			<th>강의번호</th>
			<th>강좌명</th>
			<th>학점</th>
			<th>강의시간</th>
			<th>강의실</th>
			<th>관리</th>
		</tr>
		<% for(LectureVO vo : lectureVO){ %>
		<tr>
			<td><%= vo.getLecNO() %></td>
			<td><%= vo.getLecName() %></td>
			<td><%= vo.getLecCredit()%></td>
			<td><%= vo.getLecTime()%></td>
			<td><%= vo.getLecClass()%></td>
			<td>
				<a href="@">수정</a>
				<a href="@">삭제</a>
			</td>
			<%} %>
		</tr>
	</table>
</body>
</html>