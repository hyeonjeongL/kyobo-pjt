<%@page import="java.util.List"%>
<%@page import="com.itwill.book.dto.Notice"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.book.service.NoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	NoticeService noticeService = new NoticeService();
	Notice noticeList = noticeService.noticeSelectByNo(1);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
	<ul>
<%= noticeList%>
	</ul>
	</div>
</body>
</html>