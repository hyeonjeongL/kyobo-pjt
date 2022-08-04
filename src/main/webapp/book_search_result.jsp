<%@page import="com.itwill.book.dto.PageMakerDto"%>
<%@page import="com.itwill.book.dao.BookDao"%>
<%@page import="com.itwill.book.service.BookService"%>
<%@page import="com.itwill.book.dto.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
    String searchType = request.getParameter("searchType");
    String keyword = request.getParameter("keyword");
    if(searchType==null|| searchType.equals("")){
		response.sendRedirect("book_search_form.jsp");
		return;
	}
   
    String pageNo = request.getParameter("pageNo");
	if (pageNo == null || pageNo.equals("")) {
		pageNo = "1";
	}
	
	PageMakerDto<Book> listPage = null;
	
	  
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<h1 align="center">검색 결과가 없습니다.</h1>
					<br>
<table>
<tr>
<td><b>검색어와 일치하는 도서목록</b></td></tr>
</table>
</body>
</html>