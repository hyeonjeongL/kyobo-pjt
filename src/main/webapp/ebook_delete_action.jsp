<%@page import="com.itwill.book.service.EbookService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("sUserId");
	String e_no = request.getParameter("e_no");
	String cookieId = e_no + id;
	Cookie[] cookies = request.getCookies();
	
		
	
	for(Cookie cookie : cookies){
		if(cookie.getName().equals(e_no)){
			cookie.setPath("/");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
	}
	
	EbookService ebookService = new EbookService();
	int a = ebookService.remove(Integer.parseInt(e_no), id);




%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=a %>
</body>
</html>