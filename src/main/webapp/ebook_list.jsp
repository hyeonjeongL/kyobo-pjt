<%@page import="com.itwill.book.dto.Book"%>
<%@page import="com.itwill.book.dto.Ebook"%>
<%@page import="com.itwill.book.dto.Eorder"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.book.service.EbookService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String u_id = (String)session.getAttribute("sUserId");
EbookService ebookService = new EbookService();
List<Eorder> ebooklist = ebookService.selectById(u_id);



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<form name="cart_view_form" style="margin:0">
		<input type="hidden" name="buyType">
	</form>
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
									<td height="22">&nbsp;&nbsp;<b>장바구니 보기</b></td>
								</tr>
							</table> <!--form--> <!-- 
							<form name="f" method="post">
							 -->
							<div id='f'>
								<table align=center width=80% border="0" cellpadding="0"
									cellspacing="1" bgcolor="BBBBBB">
									<tr>
										<td width=60 height=25 align="center" bgcolor="FF9999"
											class=t1><font>이미지</font></td>
										<td width=220 height=25 align="center" bgcolor="FF9999"
											class=t1><font>책 제목</font></td>
										<td width=112 height=25 align="center" bgcolor="FF9999"
											class=t1><font>구매일</font></td>
										<td width=120 height=25 align="center" bgcolor="FF9999"
											class=t1><font>종료일</font></td>
										<td width=70 height=25 align="center" bgcolor="FF9999"
											class=t1><font>판매가</font></td>
									</tr>
									<!-- cart item start -->
									<%
									for (Eorder ebook : ebooklist) {
										
									%>
									<tr>
										<td width=40 height=26 align=center bgcolor="ffffff" class=t1>
											<img src='image/<%=ebook.getEbook().getProduct().getB_image()%>.jpg' width="34" height="28" />
										</td>
										<td width=210 height=26 align=center bgcolor="ffffff" class=t1>
											<a href='product_detail.jsp?p_no=<%=ebook.getEbook().getProduct().getB_no()%>'><%=ebook.getEbook().getProduct().getB_name()%></a>
										</td>

										<td width=112 height=26 align=center bgcolor="ffffff" class=t1>
											<form action="cart_update_action.jsp" method="post"
												name="ebook">
												<input type="text" readonly="readonly" size="2"
													style="text-align: center; width: 15%" name="c_qty"
													value="<%=ebook.getEo_date_buy()%>">
											</form>
										</td>

										<td width=146 height=26 align=center bgcolor="ffffff" class=t1><%=ebook.getEo_date_end()%></td>
										<td width=50 height=26 align=center bgcolor="ffffff" class=t1>

											<%-- 
											<form action="cart_delete_item_action.jsp" method="post">
												<input type="hidden" name="cart_no" value="<%=cart.getCart_no()%>">
												<input type="submit" value="삭제">
											</form>
											 --%>
											<form name="ebook">
												<input type="text" name="c_no"
													value="<%=ebook.getEbook().getE_price()%>">
											</form>

										</td>
									</tr>
									<%}%>
									<!-- cart item end -->



									
								</table>

							</div> <!-- 
							</form> 
							 --> <br />

							<table style="padding-left: 10px" border="0" cellpadding="0"
								cellspacing="1" width="590">
								<tr>
									<td align=center>&nbsp;&nbsp; <a href="product_list.jsp"
										class=m1>계속 구경하기</a>&nbsp;&nbsp;
										
									</td>
								</tr>
							</table></td>
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