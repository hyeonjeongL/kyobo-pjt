<%@page import="com.itwill.book.dto.Book"%>
<%@page import="com.itwill.book.dto.OrderDetail"%>
<%@page import="com.itwill.book.dto.Review"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.book.service.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ReviewService reviewService = new ReviewService();
	Review findBookReview = new Review(0, null, null, 0, null, null, 
								new OrderDetail(0, 0, 0, 
									new Book(1, null, null, 0, null, null, null, null)), 0, 0, 0);
	List<Review> reviewBookList = reviewService.reviewSelectByBookNo(findBookReview);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=findBookReview %>
</body>
</html>