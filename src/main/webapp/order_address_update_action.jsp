<%@page import="com.itwill.book.service.UserInfoService"%>
<%@page import="com.itwill.book.dto.IPRegister"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.book.service.IPRegisterService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
  String u_id = (String)session.getAttribute("sUserId");
  String address = request.getParameter("a");
	
  UserInfoService userInfoService = new UserInfoService();
  userInfoService.updateByAddress(address, u_id);

  
  
  
  
  
  
  RequestDispatcher rd = request.getRequestDispatcher("order_create_form.jsp");
	rd.forward(request, response);
  
 %>
