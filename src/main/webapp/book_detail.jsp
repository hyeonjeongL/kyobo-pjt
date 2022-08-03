<%@page import="com.itwill.book.dto.Book"%>
<%@page import="com.itwill.book.service.BookService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@include file="login_check.jspf"%>--%>
<%
String b_noStr=request.getParameter("b_no");
if(b_noStr==null||b_noStr.equals("")){
	response.sendRedirect("book_list.jsp");
	return;
}
boolean isLogin =false;
if(session.getAttribute("userId")!=null){
	isLogin=true;
}
BookService bookService =new BookService();
Book book=bookService.selectByNo(Integer.parseInt(b_noStr));
if(book==null){
	out.println("<script>");
	out.println("alert('매진된상품입니다.');");
	out.println("location.href='book_list.jsp';");
	out.println("</script>");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head> 
<body>
<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>상품상세보기</b></td>
								</tr>
							</table> <!-- 
							<form name="f" method="post">
							-->
							<table style="margin-left: 10px" border=0 width=80% height=376
								align=center>
								<tr valign=bottom>
									<td width=30% align=center class=t1><font size=2
										color=#0000FF><b>주문 권수</b></font></td>
									<td width=40% align=center class=t1><font size=2
										color=#0000FF><b>도서 사진</b></font></td>
									<td width=30% align=center class=t1><font size=2
										color=#0000FF><b>도서 정보</b></font></td>
								</tr>
								<tr width=100%>
									<td colspan=3 height=5><hr color=#556b2f></td>
								</tr>
								<tr width=100%>
									<td width=30% height=200 align=center class=t1>
										<form name="add_cart_form" method="post" action="cart_add_action.jsp">
											수량 :
											<!-- 
											 <input type=text name="cart_qty" value=1 size=4 class=TXTFLD>  
											-->
											<select name="cart_qty">
												<option value="1">1
												<option value="2">2
												<option value="3">3
												<option value="4">4
												<option value="5">5
												<option value="6">6
												<option value="7">7 
												<option value="8">8
												<option value="9">9
												<option value="10">10
											</select> 권<br><br> 
												<input type=submit value="장바구니에담기[장바구니보여주기]" /><br><br> 
												<input type=button onclick="add_cart_popup_window();" value="장바구니에담기[계속쇼핑팝업]" />
												<input type="hidden" name=b_no value="<%=book.getB_no()%>">
										</form>
									</td>
									<td width=40% height=200 align=center>
									<img border=0 src='image/<%=book.getB_image()%>.jpg' width=120 height=200></td>
									<td width=40% height=200 class=t1>
										<ol type="disc">
											<li>제&nbsp;&nbsp;&nbsp;목 : <%=book.getB_name()%>&nbsp;&nbsp;&nbsp;</li>
											<li>가&nbsp;&nbsp;&nbsp;격 : <%=book.getB_price()%>&nbsp;&nbsp;&nbsp;</li>
											<li>분&nbsp;&nbsp;&nbsp;야 : <%=book.getB_class()%>&nbsp;&nbsp;&nbsp;</li>
											<li>저&nbsp;&nbsp;&nbsp;자 : <%=book.getB_author()%>&nbsp;&nbsp;&nbsp;</li>
											<li>출판사 : <%=book.getB_publisher()%>&nbsp;&nbsp;&nbsp;</li>
											<li>소&nbsp;&nbsp;&nbsp;개 : <%=book.getB_summary()%>&nbsp;&nbsp;&nbsp;</li>
										</ol>
									</td>
								</tr>
								<tr>
									<td colSpan=3 height=21><hr color=#556b2f></td>
								</tr>
							</table>

</body>
</html>