<%@page import="com.itwill.book.service.UserInfoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String u_id = (String) request.getParameter("u_id");
String u_password = (String) request.getParameter("u_password");

UserInfoService userInfoService = new UserInfoService();
int login = userInfoService.login(u_id, u_password);
/*
 * 0: 아이디 존재하지않음
 * 1: 로그인
 * 2: 패스워드 불일치
 */
 if(login == 0) {
	 out.println("<script>");
	 out.println("alert('아이디가 존재하지 않습니다')");
	 out.println("location.href=('userinfo_login_from.jsp')");
	 out.println("</script>");
 }else if(login == 2) {
	 out.println("<script>");
	 out.println("alert('패스워드가 일치하지 않습니다')");
	 out.println("location.href=('userinfo_login_from.jsp')");
	 out.println("</script>");
 }else {
	 session.setAttribute("sUserId", u_id);
	 response.sendRedirect("kyobo_main.jsp");
 }
 
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