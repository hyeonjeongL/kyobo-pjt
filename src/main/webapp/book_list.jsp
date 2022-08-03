<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.book.dto.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.book.service.BookService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--<%@include file="login_check.jspf"%> --%>
<%
BookService bookService =new BookService();
List<Book> bookList= bookService.selectAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form name="f" method="post">
<table width="100%" align="center" border="0" cellpadding="10"
									cellspacing="1" bgcolor="BBBBBB">
<%
int book_size=bookList.size();
int book_column_size=4;
int book_line_count=1;

for(int i=0;i<bookList.size();i++){
	Book book=bookList.get(i);
%>
<%
if(i%book_column_size==0){
%>
<tr>
<%}%>

<td align="center" width="25%"  bgcolor="ffffff">
<a href="book_detail.jsp?b_no=<%=book.getB_no()%>">
<img width="60px" height="60px" src="image/<%=book.getB_image()%>.jpg" border="0"></a><br />
											<br /> <b><%=book.getB_name()%></b><br> 
<font color="#FF0000"><%=new DecimalFormat("#,##0").format(book.getB_price())%>원
</font></td>
<%if(i%book_column_size==3){%>
</tr>
<%}%>
<%}%>
</table>
</form>


</body>
</html>