<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.book.dto.Notice"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.book.service.NoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
NoticeService noticeService = new NoticeService();
List<Notice> noticeList = noticeService.noticeSelectAll();
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
				<form name="f" method="GET" action="">
					<table border="0" cellpadding="0" cellspacing="1" width="590"
						bgcolor="BBBBBB">

						<tr>
							<td width=20 align=center bgcolor="E6ECDE">번호</td>
							<td width=60 align=center bgcolor="E6ECDE">분류</td>
							<td width=250 align=center bgcolor="E6ECDE">제목</td>
							<td width=100 align=center bgcolor="E6ECDE">날짜</td>
						</tr>
						<%
						for (Notice notice : noticeList) {
						%>
						<tr>
							<td width=20 bgcolor="ffffff" style="padding-left: 10px"
								align="center"><%=notice.getN_no()%>
							</td>
							<td width=60 align=center bgcolor="ffffff"><%=notice.getN_class()%>
							</td>
							<td width=250 bgcolor="ffffff" style="padding-left: 10px"
								align="left">
							<a href='notice_view.jsp?n_no=<%=notice.getN_no()%>'><%=notice.getN_title()%>
							</a>
							</td>
							<td width=100 align=center bgcolor="ffffff" align="left"><%=notice.getN_date()%>
							</td>
						</tr>
						<%
						}
						%>
						<!-- 
									<tr>
										<td width=280 bgcolor="ffffff" style="padding-left: 10"><a
											href='board_view.jsp?boardno=532&pageno=6'>게시판타이틀514</a></td>
										<td width=120 align=center bgcolor="ffffff">김경호514</td>
										<td width=120 bgcolor="ffffff" style="padding-left: 10">2014-12-23
										</td>
										<td width=70 align=center bgcolor="ffffff">0</td>
									</tr>
									 -->
					</table>
					<!-- /list -->
				</form>
				<br>
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