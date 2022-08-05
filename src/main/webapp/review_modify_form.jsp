<%@page import="com.itwill.book.dto.Book"%>
<%@page import="com.itwill.book.dto.OrderDetail"%>
<%@page import="com.itwill.book.service.ReviewService"%>
<%@page import="com.itwill.book.dto.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	
String u_id = (String)session.getAttribute("sUserId");
	String r_no = request.getParameter("r_no");
	
	Review review = new Review(Integer.parseInt(r_no),null,null,0 ,null,null,
			new OrderDetail(0,0,0,new Book(0,null,null,0,null,null,null,null))
			,0,0,0);
	ReviewService reviewService = new ReviewService();
	reviewService.reviewUpdateByNo(review);
	
	if (review == null) {
		//response.sendRedirect("review_Id_list.jsp");
		return;
	}

	String pageno = "1";
	if (request.getParameter("pageno") != null) {
		pageno = request.getParameter("pageno");
	}

%>

<%
/*
	Integer r_no = null;
	try {
		r_no = Integer.valueOf(request.getParameter("r_no"));
	} catch (Exception ex) {
	}
	//글번호가 없다면
	if (r_no == null) {
		//목록으로 이동
		//response.sendRedirect("board_list.jsp");
		return;
	}
	Review review = ReviewService.getInstance().reviewSelectNo(r_no);
	if (review == null) {
		//response.sendRedirect("board_list.jsp");
		return;
	}
	String pageno = "1";
	if (request.getParameter("pageno") != null) {
		pageno = request.getParameter("pageno");
	}
	*/
%>
<!DOCTYPE html>
<html>
<head>
<title>리뷰수정</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/menu.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
<script type="text/javascript" src="js/review.js"></script>
<style type="text/css" media="screen">
</style>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			<jsp:include page="include_common_top.jsp" />
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			<jsp:include page="include_common_left.jsp" />
			<!-- include_common_left.jsp end-->
		</div>
		<!-- navigation end-->
		<!-- wrapper start -->
		<div id="wrapper">
			<!-- content start -->
			<!-- include_content.jsp start-->
			<div id="content">
				<div id="content">
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp; <b>리뷰 수정</b>
									</td>
								</tr>
							</table> <br> <!-- modify Form  -->
							<form name="f" method="post">
								<input type="hidden" name="pageno" value="<%=pageno%>" /> <input
									type="hidden" name="r_no" value="<%=review.getR_no()%>" />
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">제목</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="text" style="width: 150"
											name="r_title" value="<%=review.getR_title()%>"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">평점</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="text" style="width: 150"
											name="r_grade" value="<%=review.getR_grade()%>"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">내용</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><textarea name="r_contents"
												style="width: 350px" rows="14"><%=review.getR_contents()%></textarea></td>
									</tr>


								</table>
							</form>  <br>

							<table width=590 border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td align=center><input type="button" value="수정" onClick="reviewUpdate()"> &nbsp; 
									<input type="button" value="리스트" onClick="reviewList()"></td>
								</tr>
							</table></td>
					</tr>
				</table>
			</div>
			</div>
			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<jsp:include page="include_common_bottom.jsp" />
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>