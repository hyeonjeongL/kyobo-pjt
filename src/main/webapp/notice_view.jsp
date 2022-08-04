<%@page import="com.itwill.book.dto.Notice"%>
<%@page import="com.itwill.book.service.NoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	NoticeService noticeService =new NoticeService();
	Notice noticeDetail =new Notice();


	
	request.setCharacterEncoding("UTF-8");
	request.getParameter("n_no");
	
	String noStr = request.getParameter("n_no");
	if(noStr==null || noStr.equals("")){
		response.sendRedirect("notice_list.jsp");
		return;
	}
	
	noticeDetail = noticeService.noticeSelectByNo(Integer.parseInt(noStr));
	
	
%>
<!DOCTYPE html>
<html>
<head>
<title>교보문고</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/menu.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">

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
								<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp; <b>
											게시글상세 </b>
									</td>
								</tr>
							</table> <br> <!-- view Form  -->

							<form name="f" method="post">
								<input type="hidden" name="notino" value="<%=noticeDetail.getN_no() %>">
								<input type="hidden" name="pageno" value="1">
								<table border="0" cellpadding="0" cellspacing="1" width="590" bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">공지일</td>
										<td width=490 bgcolor="ffffff" align="left" style="padding-left: 10"><%=noticeDetail.getN_date()%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">제목</td>
										<td width=490 bgcolor="ffffff" align="left" style="padding-left: 10"><%=noticeDetail.getN_title()%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">내용</td>
										<td width=490 bgcolor="ffffff" align="left" style="padding-left: 10"><%=noticeDetail.getN_contents().replace("\n","<br/>") %></td>
										
									</tr>
								</table>
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