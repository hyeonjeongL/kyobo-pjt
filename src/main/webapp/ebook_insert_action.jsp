<%@page import="com.itwill.book.service.EbookService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String e_no = request.getParameter("e_no");
	String id = (String)session.getAttribute("sUserId");
	
	if(id==null){
		response.sendRedirect("userinfo_login_from.jsp");
		return;
	}
	
	
	EbookService ebookService = new EbookService();
	long time = ebookService.create(Integer.parseInt(e_no), id);
	long a = (int)time/(1000*60*60*24);
	int b = (int)a;
	Cookie c = new Cookie(e_no,id);
	c.setMaxAge(b*1000*60*60*24);
	c.setPath("/");
	response.addCookie(c);
	
	/* RequestDispatcher rd = request.getRequestDispatcher("ebook_detail.jsp");
	rd.forward(request, response); */



%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=c%><br>
<%=a %><br>
<%=time %><br>
<%=b %>
<a href="ebook_test.jsp">돌아가기</a>
<a href="ebook_detail.jsp?e_no=1">디테일</a>
</body>
</html>