<%@page import="com.itwill.book.service.UserInfoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String u_id = (String)session.getAttribute("sUserId");
	UserInfoService userInfoService = new UserInfoService();
	userInfoService.remove(u_id);
	
	session.invalidate();
	
	response.sendRedirect("kyobo_main.jsp");




%>