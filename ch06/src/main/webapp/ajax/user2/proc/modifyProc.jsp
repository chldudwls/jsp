<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="application/sjon; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String uid = request.getParameter("uid");
String name= request.getParameter("name");
String birth = request.getParameter("birth");
String addr = request.getParameter("addr");

	int rowCount = 0;

try{
	Context Ctx = (Context) new InitialContext().lookup("java:comp/env");
	
	DataSource ds = (DataSource) Ctx.lookup("jdbc/studdb");
	Connection conn = ds.getConnection();
	
	
	String sql = "updata `user2` set `name`=?, `birth`=?, `hp`=?, `age`=?";
	PreparedStatement psmt = conn.prepareStatement(sql);
	psmt.setString(1, name);
	psmt.setString(2, birth);
	psmt.setString(3, addr);
	psmt.setString(4, uid);
	
	
	rowCount = psmt.executeUpdate();
	
	
	psmt.close();
	conn.close();
	
}catch(Exception e){
	e.printStackTrace();
}

	JsonObject json = new JsonObject();
	json.addProperty("result", rowCount);
	out.print(json.toString());
%>