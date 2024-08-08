<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 세션 해제(햔재 클라이언트 세션 정보 초기화)
	// session.removeAttribute(arg0); --> 아래 invalidate로 한방에 처리
	
	session.invalidate();
	
	//자동 로그인 쿠키삭제
	Cookie autoCookie = new Cookie("auto", null);
	autoCookie.setMaxAge(0);
	autoCookie.setPath("/ch05"); // 쿠키경로 : 해당 경로 하위에서 참조 가능
	response.addCookie(autoCookie);
		
	
	
	response.sendRedirect("./login.jsp?logout=success");
	
	
	





%>