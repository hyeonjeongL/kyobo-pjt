<%@page import="com.itwill.book.dto.Review"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.book.service.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	ReviewService reviewService = new ReviewService();
	List<Review> reviewIdList = reviewService.reviewSelectByUserId("jihun");
	
	Review findreview = reviewService.reviewSelectNo(4);
	
	int findReplyReview = reviewService.reviewReplyCount(4);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
아이디리뷰리스트<%=reviewIdList %>
<br>
<br>
<br>
<%=findreview %>
해당 리뷰의 총 댓글 수<%=findReplyReview %>
총 리뷰 수<%=reviewService.reviewCountAll() %>

</div>
</body>
</html>