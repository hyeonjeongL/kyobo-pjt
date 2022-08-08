<%@page import="com.itwill.book.service.IPRegisterService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String[] i_no = request.getParameterValues("i_no_check");
	IPRegisterService ipRegisterService = new IPRegisterService();
	for(String no : i_no){
	ipRegisterService.remove(Integer.parseInt(no));
	}
	response.sendRedirect("IPregisterList.jsp");

%>