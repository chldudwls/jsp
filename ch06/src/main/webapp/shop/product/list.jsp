<%@page import="shop.ProductVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<ProductVO> products = new ArrayList<>();
	//1단꼐 	
	Context initCtx = new InitialContext();
	Context ctx = (Context) initCtx.lookup("java:comp/env");
	
	//2단꼐
	DataSource ds = (DataSource) ctx.lookup("jdbc/shop");
	Connection conn = ds.getConnection();
	
	//3단꼐
	Statement stmt = conn.createStatement();
	//4단꼐	
	ResultSet rs = stmt.executeQuery("select * from product");
	//5단꼐	
	while(rs.next()){
		ProductVO vo = new ProductVO();
		vo.setProdNo(rs.getInt(1));
		vo.setProdName(rs.getString(2));
		vo.setStock(rs.getInt(3));
		vo.setPrice(rs.getInt(4));
		vo.setCompany(rs.getString(5));
		
		products.add(vo);
		
	}
	//6단꼐	
	rs.close();
	stmt.close();
	conn.close();

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
	<a href="/ch06/shop/product.jsp">등록</a>
	
	<table border="1">
		<tr>
			<th>제품번호</th>
			<th>제품명</th>
			<th>재고</th>
			<th>가격</th>
			<th>제조사</th>
			<th>관리</th>
		</tr>
		<% for(ProductVO vo : products){ %>
		<tr>
			<td><%= vo.getProdNo() %></td>
			<td><%= vo.getProdName()%></td>
			<td><%= vo.getStock()%></td>
			<td><%= vo.getPrice()%></td>
			<td><%= vo.getCompany()%></td>
			<td>
				<a href="@">수정</a>
				<a href="@">삭제</a>
			</td>
		</tr>
			<%} %>
	</table>
</body>
</html>