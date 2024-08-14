
<%@page import="java.sql.Statement"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="sub1.User1VO"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sub1.User2VO"%>
<%@page import="java.util.List"%>
<%@ page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%



List<User2VO> users = new ArrayList<>();

try{
	
	//1단계
	Context Ctx = (Context) new InitialContext().lookup("java:comp/env");
	
	
	//2단계
	DataSource ds = (DataSource) Ctx.lookup("jdbc/studydb");
	//3단계
	Connection conn = ds.getConnection();
	Statement stmt = conn.createStatement();
	
	//4단계
	String sql = "select * from `user2`";
	ResultSet rs = stmt.executeQuery(sql);
	
	//5단계
	while(rs.next()){
		User2VO vo = new User2VO();
		vo.setUid(rs.getString(1));
		vo.setName(rs.getString(2));
		vo.setBirth(rs.getString(3));
		vo.setAddr(rs.getString(4));
		
		users.add(vo);
	}
	conn.close();
	stmt.close();
	rs.close();
	
}catch(Exception e){
	e.printStackTrace();
	
}

	Gson gson = new Gson();
	String jsonData =  gson.toJson(users);
	
	out.print(jsonData);
	



%>