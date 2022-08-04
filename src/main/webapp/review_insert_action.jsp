<%@page import="com.itwill.book.dto.Book"%>
<%@page import="com.itwill.book.dto.OrderDetail"%>
<%@page import="com.itwill.book.dto.Review"%>
<%@page import="com.itwill.book.service.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("review_id_list.jsp"); //일단 여기로 하고 나중에 수정하기
		return;
	}

	
	String r_title = request.getParameter("r_title");
	String r_date = request.getParameter("r_date");
	String r_contents = request.getParameter("r_contents");
	String u_id = request.getParameter("u_id");
	String r_grade = request.getParameter("r_grade");
	String od_no = request.getParameter("od_no");
	
	
/*	
	Review review = new Review(0, r_title, r_date, r_grade, r_contents, u_id,
			new OrderDetail(od_no,0,0,
					new Book(0, null, null, 0, null,null, null,null)),
			0, 0, 0);
*/

	
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