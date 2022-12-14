<%@page import="com.itwill.book.dto.Cart"%>
<%@page import="com.itwill.book.service.CartService"%>
<%@page import="com.itwill.book.dto.Book"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("product_list.jsp");
		return;
	}
	/*
	1.파라메타받기(cart_qty,p_no)
	2.장바구니에 제품을담고 cart_view.jsp로redirection
	*/
	String u_id = (String) session.getAttribute("sUserId");
	
	String c_qtyStr=request.getParameter("cart_qty");
	String b_noStr=request.getParameter("b_no");
	Cart cart = new Cart(0,Integer.parseInt(c_qtyStr),u_id,new Book(Integer.parseInt(b_noStr),"","",0,"","","",""));
	CartService cartService=new CartService();
	cartService.addCart(cart);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 담기 완료</title>
<script type="text/javascript">
</script>
</head>
<body>
<div style="width:250px ;margin:0 auto;padding: 25px ">
	<img src="image/cart22.png" width="50px" height="30px"
		alt="장바구니이미지">
	<strong>상품을 담았습니다.</strong>
	<div  style="margin-top: 10px;margin-left: auto;margin-right: auto;padding: 10px" >
		<div  style="margin: 0 auto;padding: 0px 30px">
			<button onclick="window.close();opener.location.href='book_list.jsp';">
				계속 쇼핑
			</button>
			
			<button onclick="window.close();opener.location.href='cart_view.jsp';">
				장바구니로
			</button>
		</div>
	</div>
</div>
</body>
</html>