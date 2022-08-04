<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%>
<%
	String id = (String)session.getAttribute("sUserid");
	if(id != null){
		session.invalidate();
	}

	response.sendRedirect("userinfo_login_from.jsp");

%>
