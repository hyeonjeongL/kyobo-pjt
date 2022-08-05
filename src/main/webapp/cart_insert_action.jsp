<%@page import="com.itwill.book.dto.Cart"%>
<%@page import="com.itwill.book.service.CartService"%>
<%@page import="com.itwill.book.dto.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%>

<%

if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("kyobo_main");
	return;
}

String u_id = (String) session.getAttribute("sUserId");

String c_noStr = request.getParameter("c_no");
String c_qty = request.getParameter("c_qty");
String b_noStr = request.getParameter("b_no");
Cart cart = new Cart();
CartService cartService = new CartService();
cartService.addCart(cart);

response.sendRedirect("cart_view.jsp");

%>