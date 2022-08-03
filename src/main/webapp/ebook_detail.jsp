<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("sUserId");
	String e_no = request.getParameter("e_no");
	String cookieId = e_no + id;
	Cookie[] cookies = request.getCookies();
	
	int a = 0;
	for (Cookie cookie : cookies) {
		if (cookie.getName().equals(e_no)) {
			if (cookie.getValue().equals(id)) {
				cookie.setPath("/");
				out.println("<script>");
				out.println("alert('대여만료기간은 " + cookie.getMaxAge() + "입니다.')");
				out.println("</script>");
				a = 1;
			}
	
		}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=e_no%>에 해당하는 책 내용
</body>
</html>