<%@page import="com.itwill.book.dto.Book"%>
<%@page import="com.itwill.book.dto.OrderDetail"%>
<%@page import="com.itwill.book.dto.Review"%>
<%@page import="com.itwill.book.service.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	//String u_id = "jihun";

	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("review_id_list.jsp"); //일단 여기로 하고 나중에 수정하기
		return;
	}
/*	
	Review review = new Review();
	review.setR_title(request.getParameter("r_title"));
	review.setR_contents(request.getParameter("r_contents"));
	review.setU_id(request.getParameter("u_id"));
	review.setR_grade(Integer.parseInt(request.getParameter("r_grade")));
	review.setOrderDetail(new OrderDetail(Integer.parseInt(request.getParameter("od_no")),0,0,null));
	
	ReviewService.getInstance().create(review);
*/

	//Review(int r_no, String r_title, Date r_date, int r_grade, String r_contents, String u_id,
	//		OrderDetail orderDetail, int r_groupno, int r_step, int r_depth)	

	/*
	book
	private int b_no;
	private String b_class;
	private String b_name;
	private int b_price;
	private String b_summary;
	private String b_image;
	private String b_author;
	private String b_publisher;
	*/

	
	
	String r_title = request.getParameter("r_title");
	String r_contents = request.getParameter("r_contents");
	String r_grade = request.getParameter("r_grade");
	String u_id = request.getParameter("u_id");
	String od_no = request.getParameter("od_no");
	ReviewService reviewService = new ReviewService();
	
	
	Review insertreview = new Review(0,r_title,null,Integer.parseInt(r_grade) ,r_contents,u_id,
			new OrderDetail(Integer.parseInt(od_no),0,0,new Book(0,null,null,0,null,null,null,null))
			,0,0,0);
	
	
	reviewService.create(insertreview);
	response.sendRedirect("kyobo_main.jsp");//일단 여기로,, 나중에는 아마 상품 리뷰로?

	


	
%>
