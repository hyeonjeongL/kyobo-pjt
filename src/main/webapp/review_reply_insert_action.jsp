<%@page import="com.itwill.book.service.ReviewService"%>
<%@page import="com.itwill.book.dto.Review"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	Review review = new Review();

	review.setR_no(Integer.parseInt(request.getParameter("r_no")));
	
	review.setR_title(request.getParameter("r_title"));
	review.setR_contents(request.getParameter("r_contents"));
	review.setU_id(request.getParameter("u_id"));
	
	ReviewService.getInstance().createReply(review);
	
	String pageno = "1";
	if(request.getParameter("pageno")!=null){
		pageno=request.getParameter("pageno");
	}
	response.sendRedirect(
			String.format("review_view.jsp?r_no=%s",pageno));
	
	
%>