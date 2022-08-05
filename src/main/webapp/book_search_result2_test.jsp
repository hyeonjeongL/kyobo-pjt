<%@page import="com.itwill.book.dto.Book"%>
<%@page import="com.itwill.book.service.BookService"%>
<%@page import="com.itwill.book.dto.PageMakerDto"%>
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

 if (searchType.equals("all")) {
		listPage = new BookService().selectByAll(keyword, Integer.parseInt(pageNo));
    }
 if (searchType.equals("name")) {
		listPage = new BookService().selectByName(keyword, Integer.parseInt(pageNo));
    }
 if (searchType.equals("author")) {
		listPage = new BookService().selectByAuthor(keyword, Integer.parseInt(pageNo));
    }
 if (searchType.equals("class")) {
		listPage = new BookService().selectByClass(keyword, Integer.parseInt(pageNo));
    }
%>
<%
	//1.요청페이지번호	
String pageno=request.getParameter("pageno");
if(pageno==null||pageno.equals("")){
	pageno="1";
}	
PageMakerDto<Book> bookList = new BookService().getBookList(Integer.parseInt(pageno));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교보문고</title>
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
				<div style="margin: 10px;">
					<%
					    if (listPage.itemList.size() == 0) {
					%>
					
					<h1 align="center">검색 결과가 없습니다.</h1>
					<br>
					<div class="">
					<input class="back" type="button" value="돌아가기" onclick="window.history.back()">
					</div>
					<%
					} else {
					%>
						<table style="padding-left: 10px" border=0 cellpadding=0 cellspacing=0>

<tr>
<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp; <b>검색어와 일치하는 도서 목록</b>
								</td>
							</tr>
							<tr bgcolor="#FFFFFF">
								<td height="20" class="t1" align="right" valign="bottom">♠ 총 <font color="#FF0000"><%=listPage.totRecordCount%></font>건 | 현재페이지( <font color="#FF0000"><%=listPage.pageMaker.getCurPage()%></font> / <font color="#0000FF"><%=listPage.pageMaker.getTotPage()%></font> )
								</td>

</tr>
</table>
<div>
					<div class="book-detail-button">
					<button onclick="location.href='book_search_form.jsp'">돌아가기</button>
					</div>
					<form name="f" method="post">
					        <%
					            for (Book book : listPage.itemList) {
					                if (book.getB_image() == null) {
					                    book.setB_image("image/noimg.jpg");
					                }
					        %>
					<hr>
					    <table class='book-list'>
					        <!-- 책정보 시작 -->
					
					        <tr>
					            <td class='book-list-img' rowspan="4">
					                <a href='book_detail.jsp?b_no=<%=book.getB_no()%>'>
					                <img alt='bookcover' src='image/<%=book.getB_image()%>.jpg' width="60px" height="80px"></a>
					                <input type="hidden" name="bookNo" value="<%=book.getB_no()%>">
					            </td>
					            <td class='book-td'><span class='bookcategory'>[<%=book.getB_class()%>]</span>&nbsp;&nbsp;&nbsp;<a href='book_detail.jsp?b_no=<%=book.getB_no()%>'><strong><%=book.getB_name()%></strong>
					            </a></td>
					        </tr>
					        <tr>
					            <td class='book-td'><strong>저자&nbsp;:&nbsp;</strong><%=book.getB_author()%>&nbsp;&nbsp; </td>
					        </tr>
					        <tr>
					        <td class='book-td'><strong>출판사&nbsp;:&nbsp;</strong><%=book.getB_publisher()%>&nbsp;&nbsp; </td>
					        </tr>
					        <tr>
					        <td class='book-td'><strong>가격&nbsp;:&nbsp;</strong><%=book.getB_price()%>&nbsp;&nbsp; </td>
					        </tr>
					        <tr>
			<%
					        }%>		            <td class='book-td'>
</div>
	</div>
<!-- 페이지 번호 리스트 -->
			<table border="0" cellpadding="0" cellspacing="1" width="590">
				<tr>
					<td align="center">
			     
						 <%if(bookList.pageMaker.getPrevGroupStartPage()>0) {%>    
						    <a href="./book_list.jsp?pageno=1">◀◀</a>&nbsp;
						 <%}%>
						 <%if(bookList.pageMaker.getPrevPage()>0) {%>    
							<a href="./book_list.jsp?pageno=<%=bookList.pageMaker.getPrevPage()%>">◀</a>&nbsp;&nbsp;
						 <%}%>
						
						<%
							for (int i = bookList.pageMaker.getBlockBegin(); i <= bookList.pageMaker.getBlockEnd(); i++) {
						 	if (bookList.pageMaker.getCurPage() == i) {
						%>
						 <font color='blue'><strong><%=i%></strong></font>&nbsp;
						<%} else {%>
						<a href="./book_list.jsp?pageno=<%=i%>"><strong><%=i%></strong></a>&nbsp;
						<%
						   }
						  }%>
						  
						  
						 <%if(bookList.pageMaker.getCurPage() < bookList.pageMaker.getTotPage()){%>
						  <a href="./book_list.jsp?pageno=<%=bookList.pageMaker.getNextPage()%>">▶&nbsp;</a>
						 <%}%>
						 <%if(bookList.pageMaker.getNextGroupStartPage()< bookList.pageMaker.getTotPage()){%>
						<a
						href="./book_list.jsp?pageno=<%=bookList.pageMaker.getTotPage()%>">▶▶</a>&nbsp;
						 <%}
						 }%>
					</td>
				</tr>
			</table> 
			<!-- 페이지 번호 리스트 -->
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