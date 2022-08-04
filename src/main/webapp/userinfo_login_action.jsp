<%@page import="com.itwill.book.service.UserInfoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	/*
	 * 회원로그인
	 * 
	 * 0:아이디존재안함
	 * 1:로그인
	 * 2:패스워드 불일치
	 */
	 if(request.getMethod().equalsIgnoreCase("GET")){
		 response.sendRedirect("user_login_form.jsp");
		 return;
	 }

	String u_id = (String) request.getParameter("u_id");
	String u_password = (String) request.getParameter("u_password");
	UserInfoService userInfoService = new UserInfoService();
	int result = userInfoService.login(u_id, u_password);
	
	/*
	0:아이디 존재안함
	1:패스워드 불일치
	2:로그인성공(세션)
	*/
	
	if(result==0){
		String msg = u_id+"는 존재하지 않는 아이디 입니다.";
	
		request.setAttribute("msg1", msg);
		RequestDispatcher rd = request.getRequestDispatcher("user_login_form.jsp");
		rd.forward(request, response);
	}else if(result == 1){
	
		session.setAttribute("sUserId", u_id);
		response.sendRedirect("user_main.jsp");
		return;
		
		
	}else if(result == 2){
		String msg = "패스워드가 일치하지 않습니다.";
		request.setAttribute("msg2", msg);
		request.setAttribute("loginId", u_id);
		RequestDispatcher rd = request.getRequestDispatcher("user_login_form.jsp");
		rd.forward(request, response);
	}
	
	
%>