<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="shop.CustomerVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String uid = request.getParameter("uid");

	CustomerVO vo = null;
	
	try{
		Context initCtx = new InitialContext();
		Context Ctx = (Context) initCtx.lookup("java:comp/env");
		
		DataSource ds = (DataSource) Ctx.lookup("jdbc/college");
		Connection conn = ds.getConnection();
		
		String sql = "select * from `customer` where `uid`=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, uid);
		
		ResultSet rs = psmt.executeQuery();		
		
		if(rs.next()){
			vo = new CustomerVO();
			vo.setCustid(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setHp(rs.getString(3));
			vo.setAddr(rs.getString(4));
			vo.setRdate(rs.getString(5));
			
			
		}
		rs.close();
		psmt.close();
		conn.close();
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
	<h3>수정</h3>
	<a href="/ch06/2.DBCMTest.jsp">처음으로</a>
	<a href="/ch06/update/shop/customerRegister.jsp">목록</a>
	
	<form action="/ch06/user1/modifyProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid" value="<%= vo.getCustid() %>" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%= vo.getName() %>"/></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="date" name="birth" value="<%= vo.getHp() %>"/></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="hp" value="<%= vo.getAddr() %>"/></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="number" name="age" value="<%= vo.getRdate() %>"/></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="수정하기"/>
				</td>
			</tr>		
		</table>
	
	</form>
	
</body>
</html>