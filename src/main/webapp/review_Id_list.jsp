<%@page import="com.itwill.book.dto.ReviewBookListPageMakerDto"%>
<%@page import="com.itwill.book.dto.Review"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.book.service.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!public String getTitleString(Review review) {
      StringBuilder title = new StringBuilder(128);
      String t = review.getR_title();
      if (t.length() > 15) {
         //t = t.substring(0,15);
         //t = t+"...";
         t = String.format("%s...", t.substring(0, 15));
      }
      //답글공백삽입
      
      for (int i = 0; i < review.getR_depth(); i++) {
         title.append("&nbsp;&nbsp;");
      }
      
      if (review.getR_depth() > 0) {
         title.append("<img border='0' src='image/re.gif'/>"); // 댓글 시작에 ㄴ 나오게 하는거인듯
      }
      
      title.append(t.replace(" ", "&nbsp;"));
      
      return title.toString();
   }%>
    
<%

String sUserId = (String)session.getAttribute("sUserId");
if(sUserId == null){
	response.sendRedirect("kyobo_main.jsp");
	return;
}
String pageNo = request.getParameter("pageno");
if (pageNo == null || pageNo.equals("")) {
	pageNo = "1";
}
	//삭제 오류 For input string: "null"
	ReviewBookListPageMakerDto reviewlistPage = new ReviewService().findReviewIdList(sUserId, Integer.parseInt(pageNo));
	
%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지 리뷰</title>
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
				<table width=0 border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td>
							<!--contents--> <br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="35">&nbsp;&nbsp;<Font size="4">내가 쓴 글
											</td>
								</tr>
							</table> 
					<form name="f" method="post" action="">
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">

									<tr height="30">
										<td width=280 align=center bgcolor="FFE4B5">리뷰제목</td>
										<td width=120 align=center bgcolor="FFE4B5">작성자</td>
										<td width=120 align=center bgcolor="FFE4B5">작성날짜</td>
									</tr>
									<%
										for (Review review : reviewlistPage.itemList) {
									%>
									<tr height="40">
										<td width=280 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<a href='review_view.jsp?r_no=<%=review.getR_no()%>&pageno=<%=reviewlistPage.pageMaker.getCurPage()%>'>
										<%=getTitleString(review)%>
										</a>
										</td>
										<td width=120 align=center bgcolor="ffffff"><%=review.getU_id()%>
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
							</td>
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



