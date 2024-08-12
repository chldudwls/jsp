<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.Statement"%>
<%@page import="ch07.FileVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 파일번호 수신
	String no = request.getParameter("no");

	//데이터베이스 조회
	FileVO vo = null;
	try{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		
		
		Connection conn = ds.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from `filetest` where `no`="+ no);
		
		if(rs.next()){
			vo = new FileVO();
			vo.setNo(rs.getInt(1));
			vo.setUid(rs.getString(2));
			vo.setName(rs.getString(3));
			vo.setOname(rs.getString(4));
			vo.setSname(rs.getString(5));
			vo.setRdate(rs.getString(6));			
			
		
		}
		
		stmt.executeUpdate("delete from `filetest` where `no`="+no);
		rs.close();
		stmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	String path = application.getRealPath("/upldads");
	File file = new File(path + File.separator + vo.getSname());
	file.delete();
	
	
	response.sendRedirect("/ch07/2.fileDownloadTest.jsp");
	/*
	좀더 간단한 방법
	String no = request.getParameter("no");
	String sname = request.getParameter("sname");

	//데이터베이스 조회
	FileVO vo = null;
	try{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		
		
		Connection conn = ds.getConnection();
		Statement stmt = conn.createStatement();
		
		stmt.executeUpdate("delete from `filetest` where `no`="+no);
		stmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	String path = application.getRealPath("/upldads");
	File file = new File(path + File.separator + sname);
	file.delete();
	
	
	response.sendRedirect("/ch07/2.fileDownloadTest.jsp");
	
	
	
	*/
	
	
	
	
	
%>