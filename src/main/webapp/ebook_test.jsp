<%@page import="com.itwill.book.dto.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.book.service.BookService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
BookService bookService = new BookService();
List<Book> books = bookService.selectAll();



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%for(Book book : books){ %>
	<a href="ebook_insert_action.jsp?e_no=<%=book.getB_no()%>"><%=book.getB_name() %></a>, <%=book.getB_price()%> // <a href="ebook_delete_action.jsp?e_no=<%=book.getB_no()%>">삭제</a><br>


<%} %>
</body>
</html>