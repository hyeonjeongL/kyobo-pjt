<%@page import="com.itwill.book.dto.IPRegister"%>
<%@page import="com.itwill.book.service.IPRegisterService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 String u_id = (String)session.getAttribute("sUserId");
 String i_name = request.getParameter("i_name");
 String ip = request.getHeader("X-Forwarded-For");
	if(ip == null){
		ip = request.getRemoteAddr();
	}
IPRegister ipRegister = new IPRegister(0, i_name, ip, u_id);
	
	
	
	IPRegisterService ipRegisterService = new IPRegisterService();
	int rowCount = ipRegisterService.create(ipRegister);
	
	if(rowCount == 2){
		out.println("<script>");
		out.println("alert('최대 등록가능 PC수를 초과하셨습니다.');");
		out.println("location.href='IPregisterList.jsp'");
		out.println("</script>");
	}else if(rowCount == 1){
		out.println("<script>");
		out.println("alert('PC등록에 성공했습니다.');");
		out.println("location.href='IPregisterList.jsp'");
		out.println("</script>");
		
	}
	

%>