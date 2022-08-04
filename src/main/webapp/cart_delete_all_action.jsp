<%@page import="com.itwill.book.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%>

<%
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("cart_view.jsp");
	return;
}

String u_id = "hunjeong";
//String u_id = request.getParameter("u_id");

CartService cartService = new CartService();
cartService.cartDeleteAll(u_id);


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>