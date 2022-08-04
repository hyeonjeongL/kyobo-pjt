<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%>


<%

if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("cart_view.jsp");
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

</body>
</html>