<%@page import="ch07.FileVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<FileVO> files = new ArrayList<>();
	
	try{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		
		
		Connection conn = ds.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from `filetest`");
		
		while(rs.next()){
			FileVO vo = new FileVO();
			vo.setNo(rs.getInt(1));
			vo.setUid(rs.getString(2));
			vo.setName(rs.getString(3));
			vo.setOname(rs.getString(4));
			vo.setSname(rs.getString(5));
			vo.setRdate(rs.getString(6));			
			files.add(vo);
		
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<!-- 
	날짜 : 2024/08/12
	이름 : 최영진
	내용 : 파일 업로드 실습하기
	
	톰켓 context.xml > cintext 태그에 <Context allowCasualMultipartParsing="true"> 설정
	톰켓 server.xml > connector 태그에 maxPostSize=*"10485760"*(1024 * 1024 * 10 =10MB) 설정
	
	
 -->
<meta charset="UTF-8">
<title>2. fileDownload</title>
</head>
<body>
	<h3>2. 파일 다운로드</h3>
	
	<table border="1">
		<tr>
			<th>파일번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>원본파일명</th>
			<th>저장파일명</th>
			<th>등록일</th>
			<th>관리</th>
		</tr>
		
		<% for(FileVO vo : files){ %>
		<tr>
			<td><%= vo.getNo() %></td>
			<td><%= vo.getUid() %></td>
			<td><%= vo.getName() %></td>
			<td><%= vo.getOname() %></td>
			<td><%= vo.getRdate() %></td>
			<td>2024-08-12</td>
			<td>
				<a href="./proc/fileDelete.jsp?no=<%= vo.getNo()%>">삭제</a>
				<a href="./proc/fileDownload.jsp?no=<%= vo.getNo()%>">다운로드</a>
			</td>
		</tr>
	<%} %>
	</table>

</body>
</html>