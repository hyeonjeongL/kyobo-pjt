<%@page import="com.itwill.book.dto.Orders"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.book.service.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%>
<%
String u_id = request.getParameter("u_id");
OrderService orderService = new OrderService();
List<Orders> orderList = orderService.list("jihun");
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