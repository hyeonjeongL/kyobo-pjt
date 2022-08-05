<%@page import="com.itwill.book.dto.Book"%>
<%@page import="com.itwill.book.dto.OrderDetail"%>
<%@page import="com.itwill.book.service.ReviewService"%>
<%@page import="com.itwill.book.dto.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 


 //post 요청인 경우 요청 데이터에 한글 문자셋으로 설정
if (request.getMethod().toLowerCase().equals("post")) {
	 
}

//1. Board 객체를 만들고 사용자가 입력한 데이터를 저장
Review review = new Review();
review.setR_no(Integer.parseInt(request.getParameter("r_no")));
review.setR_title(request.getParameter("r_title"));
review.setR_grade(Integer.parseInt(request.getParameter("r_grade")));
review.setR_contents(request.getParameter("r_contents"));

//2. 데이터베이스에 변경된 내용 적용
ReviewService.getInstance().reviewUpdateByNo(review);
String pageno = "1";
if (request.getParameter("pageno") != null) {
	pageno = request.getParameter("pageno");
}
//3. boardview.jsp로 이동
response.sendRedirect(
	String.format("review_view.jsp?r_no=%d&pageno=%s",
	review.getR_no(), pageno));


%>

<%
/*
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("kyobo_main.jsp");
	}

	String r_no = request.getParameter("r_no");
	String r_title = request.getParameter("r_title");
	String r_grade = request.getParameter("r_grade");
	String r_contents = request.getParameter("r_contents");
	Review review = new Review(Integer.parseInt(r_no),r_title,null,Integer.parseInt(r_grade) ,r_contents,null,
			new OrderDetail(0,0,0,new Book(0,null,null,0,null,null,null,null))
			,0,0,0);
	ReviewService reviewService = new ReviewService();
	reviewService.reviewUpdateByNo(review);
	response.sendRedirect("review_Id_list.jsp"); //"review_view.jsp"+r_no
*/	




	
%>
