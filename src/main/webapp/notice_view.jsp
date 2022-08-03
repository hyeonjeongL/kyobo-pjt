<%@page import="com.itwill.book.service.NoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	NoticeService noticeService = new NoticeService();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 테스트</title>
</head>
<body>
	<h1> 공지사항 </h1>
					<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp; <b> 게시물
											내용보기 </b>
									</td>
								</tr>
							</table> <br>
</body>
</html>