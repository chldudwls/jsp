<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "root";
	String pass = "1234";
	//데이터 수정 처리
	try{
	Connection conn = DriverManager.getConnection(host, user, pass);
	String sql = "update `user1` set `name`=?, `birth`=?, `hp`=?, `age`=?";
	
	PreparedStatement psmt = conn.prepareStatement(sql);
	psmt.setString(1, name);
		
	


	}catch(Exception e){
		e.printStackTrace();
	}
	//목록이동

%>