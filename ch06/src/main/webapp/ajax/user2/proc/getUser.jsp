<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sub1.User2VO"%>
<%@page import="java.util.List"%>
<%@ page contentType="application/sjon; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String uid = request.getParameter("uid");

	User2VO vo = null;
try{
	
	Context Ctx = (Context) new InitialContext().lookup("java:comp/env");
	
	DataSource ds = (DataSource) Ctx.lookup("jdbc/studydb");
	Connection conn = ds.getConnection();

	String sql = "select * from `user2` where `uid`=?";
	PreparedStatement psmt = conn.prepareStatement(sql);
	
	
	//3단계 - SQL실행
	ResultSet rs = psmt.executeQuery();
	//4단계 - 결과처리 (SELECT일 경우)
	while(rs.next()){
		vo = new User2VO();
		vo.setUid(rs.getString(1));	
		vo.setName(rs.getString(2));
		vo.setBirth(rs.getNString(3));
		vo.setAddr(rs.getString(4));
		

	}
	//5단계 - 데이터베이스 종료
	
	rs.close();
	psmt.close();
	conn.close();
	
}catch(Exception e){
	e.printStackTrace();
}
	Gson gson = new Gson();
	String jsonData = gson.toJson(vo);
	out.print(jsonData);

%>