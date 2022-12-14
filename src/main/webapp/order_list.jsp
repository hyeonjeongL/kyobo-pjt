<%@page import="com.itwill.book.dto.OrderDetail"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.book.dto.Orders"%>
<%@page import="com.itwill.book.service.OrderService"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf"%>
<%
sUserId = (String) session.getAttribute("sUserId");
OrderService orderService = new OrderService();
List<Orders> orderList = orderService.list(sUserId);
OrderDetail orderDetail = new OrderDetail();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>교보문고-주문목록</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
 
<style type="text/css" media="screen">
</style>
<script type="text/javascript">
	function order_delete_all_action(){
		document.order_delete_all_form.method='POST';
		document.order_delete_all_form.action='order_delete_all.jsp';
		document.order_delete_all_form.submit();
	}
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
<form name="order_delete_all_form" style="margin: 0">
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
									<td bgcolor="f4f4f4" height="35">&nbsp;&nbsp;<Font size="4">
											주문목록</td>
								</tr>
							</table> <!--form-->
							<form name="f" method="post">
								<table align=center width=80%  border="0" cellpadding="0"
									cellspacing="1" bgcolor="FFE4B5">
									<tr>
										<td width=145 height=25 bgcolor="FFE4B5" align=center class=t1><font>주문번호</font></td>
										<td width=112 height=25 bgcolor="FFE4B5" align=center class=t1><font>주문날짜</font></td>
										<td width=136 height=25 bgcolor="FFE4B5"align=center class=t1><font>주문가격</font></td>
										<td width=80 height=25 bgcolor="FFE4B5" align=center class=t1><font>상세보기</font></td>
									</tr>

									<!-- order start -->
									<%
									int deli_price=0;
									for (Orders orders : orderList) {
										if(1<orders.getO_price() && orders.getO_price()<=50000){
											deli_price=2500;
										} else {
											deli_price=0;
										}
									%>
									<tr>
										<td width=145 height=26 align=center bgcolor="ffffff" class=t1><%=orders.getO_no()%></td>
										<td width=112 height=26 align=center bgcolor="ffffff" class=t1><%=new SimpleDateFormat("yyyy/MM/dd").format(orders.getO_date())%></td>
										<td width=136 height=26 align=center bgcolor="ffffff" class=t1><%=new DecimalFormat("#,###").format(orders.getO_price()+deli_price)%></td>
										<td width=80 height=26 align=center bgcolor="ffffff" class=t1><a
											href="order_detail.jsp?o_no=<%=orders.getO_no()%>" class=m1>주문상세</a></td>
									</tr>
									<%
									}
									%>
									<!-- order end -->




								</table>
							</form> <br />
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align=center>&nbsp;&nbsp;
									<a href=book_list.jsp
										class=m1>계속 구경하기</a>
									<a href='javascript:order_delete_all_action();'
										class=m1>주문전체삭제</a>
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