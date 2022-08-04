<%@page import="com.itwill.book.dto.Book"%>
<%@page import="com.itwill.book.dto.OrderDetail"%>
<%@page import="com.itwill.book.dto.Review"%>
<%@page import="com.itwill.book.service.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ReviewService reviewService = new ReviewService();
	Review insertReview = new Review(0, "jsp리뷰제목", null, 5, "jsp리뷰내용", "jihun", 
							new OrderDetail(14, 0, 10, 
								new Book(1, null, null, 0, null, null, null, null)), 
								0, 0, 0);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%= reviewService.create(insertReview)%>
</body>
</html>