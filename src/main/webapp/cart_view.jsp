<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.book.dto.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.book.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String u_id = "hunjeong";
CartService cartService = new CartService();
List<Cart> cartList = cartService.getCartList(u_id);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>
<%=cartList %> <br>
</p>
</body>
</html>