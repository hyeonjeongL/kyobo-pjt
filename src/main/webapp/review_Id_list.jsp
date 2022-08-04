<%@page import="com.itwill.book.dto.ReviewBookListPageMakerDto"%>
<%@page import="com.itwill.book.dto.Review"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.book.service.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String pageNo = request.getParameter("pageNo");
if (pageNo == null || pageNo.equals("")) {
	pageNo = "1";
}

	
	ReviewBookListPageMakerDto<Review> listPage = new ReviewService().findReviewBookList(u_id, Integer.parseInt(pageNo));
	
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