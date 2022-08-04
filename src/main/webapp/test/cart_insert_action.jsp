<%@page import="com.itwill.book.dto.Cart"%>
<%@page import="com.itwill.book.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String c_noStr = request.getParameter("c_no");
	String c_qtyStr = request.getParameter("c_qty");
	String u_id = request.getParameter("u_id");
	String b_noStr = request.getParameter("b_no");
	Cart cart = new Cart();
	
	CartService cartService = new CartService();
	cartService.addCart(cart);

    
%>
