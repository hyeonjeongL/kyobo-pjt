<%@page import="com.itwill.book.service.IPRegisterService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String i_no = request.getParameter("i_no");
	IPRegisterService ipRegisterService = new IPRegisterService();
	ipRegisterService.remove(Integer.parseInt(i_no));

	response.sendRedirect("IPregisterList.jsp");

%>