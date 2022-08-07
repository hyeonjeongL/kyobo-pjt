<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	String u_id = (String)session.getAttribute("sUserId");
	

%>
<jsp:include page="include_common_top_menu.jsp"/>
<h1>
	<div style="width:100px;padding-top: 5px;margin: 0px auto 0px auto">
	<a href = kyobo_main.jsp>	
	<img src='image/kyobologo.png' width="80" height="70" align="top" />
	</a>
	</div>
	
</h1>
<div id="sub_menu">
	<ul>
		<li><a href="book_search_form.jsp">도서검색</a></li>
		<li><a href="book_list.jsp">도서목록</a></li>
		<li><a href="notice_list.jsp">공지사항</a></li>
		<li><a href="qna_list.jsp">Q&A</a></li>
	</ul>
	<hr size="1px" noshade="noshade" style="margin: 3px 0px 3px 0px" >
</div>