<%@page import="com.itwill.book.dto.ReviewBookListPageMakerDto"%>
<%@page import="com.itwill.book.dto.Review"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.book.service.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
String pageNo = request.getParameter("pageno");
if (pageNo == null || pageNo.equals("")) {
	pageNo = "1";
}

	
	ReviewBookListPageMakerDto reviewlistPage = new ReviewService().findReviewBookList("jihun", Integer.parseInt(pageNo));
	
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
				
					<form name="f" method="post" action="">
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">

									<tr>
										<td width=280 align=center bgcolor="E6ECDE">제목</td>
										<td width=120 align=center bgcolor="E6ECDE">글쓴이</td>
										<td width=120 align=center bgcolor="E6ECDE">글쓴날</td>
										<td width=70 align=center bgcolor="E6ECDE">본횟수</td>
									</tr>
									<%
										for (Review review : reviewlistPage.itemList) {
									%>
									<tr>
										<td width=280 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<a href='review_view.jsp?r_no=<%=review.getR_no()%>&pageno=<%=reviewlistPage.pageMaker.getCurPage()%>'>
										<%=review.getR_title()%>
										</a>
										</td>
										<td width=120 align=center bgcolor="ffffff"><%=review.getU_id()%>
										</td>
										<td width=120 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<%=review.getR_date()%>
										</td>
									</tr>
									
									<%
										}
									%>
								</table>
								</form>
								<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align="center">
							     
										 <%if(reviewlistPage.pageMaker.getPrevGroupStartPage()>0) {%>    
										    <a href="./review_Id_list.jsp?pageno=1">◀◀</a>&nbsp;
										 <%}%>
										 <%if(reviewlistPage.pageMaker.getPrevPage()>0) {%>    
											<a href="./review_Id_list.jsp?pageno=<%=reviewlistPage.pageMaker.getPrevPage()%>">◀</a>&nbsp;&nbsp;
										 <%}%>
										
										<%
											for (int i = reviewlistPage.pageMaker.getBlockBegin(); i <= reviewlistPage.pageMaker.getBlockEnd(); i++) {
										 	if (reviewlistPage.pageMaker.getCurPage() == i) {
										%>
										 <font color='red'><strong><%=i%></strong></font>&nbsp;
										<%} else {%>
										<a href="./review_Id_list.jsp?pageno=<%=i%>"><strong><%=i%></strong></a>&nbsp;
										<%
										   }
										  }%>
										  
										  
										 <%if(reviewlistPage.pageMaker.getCurPage()< reviewlistPage.pageMaker.getTotPage()){%>
										  <a href="./review_Id_list.jsp?pageno=<%=reviewlistPage.pageMaker.getNextPage()%>">▶&nbsp;</a>
										 <%}%>
										 <%if(reviewlistPage.pageMaker.getNextGroupStartPage()< reviewlistPage.pageMaker.getTotPage()){%>
										<a
										href="./review_Id_list.jsp?pageno=<%=reviewlistPage.pageMaker.getTotPage()%>">▶▶</a>&nbsp;
										 <%}%>
									</td>
								</tr>
							</table> <!-- button -->
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align="right"><input type="button" value="게시물 생성"
										onclick="boardCreate();" /></td>
								</tr>
							</table></td>
					</tr>
				</table>
								
				
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



