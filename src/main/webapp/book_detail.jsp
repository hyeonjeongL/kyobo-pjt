<%@page import="com.itwill.book.dto.Book"%>
<%@page import="com.itwill.book.service.BookService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%> 
<%
String b_noStr=request.getParameter("b_no");
if(b_noStr==null||b_noStr.equals("")){
	response.sendRedirect("book_list.jsp");
	return;
}
boolean isLogin =false;
if(session.getAttribute("userId")!=null){
	isLogin=true;
}
BookService bookService =new BookService();
Book book=bookService.selectByNo(Integer.parseInt(b_noStr));
if(book==null){
	out.println("<script>");
	out.println("alert('매진된상품입니다.');");
	out.println("location.href='book_list.jsp';");
	out.println("</script>");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 정보</title>
</head>
<body>


</body>
</html>