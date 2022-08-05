<%@page import="com.itwill.book.dto.Review"%>
<%@page import="com.itwill.book.service.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Integer r_no = null;
	Integer pageno = null;
	try {
		r_no = Integer.valueOf(request.getParameter("r_no"));
		pageno = Integer.valueOf(request.getParameter("pageno"));
	} catch (Exception ex) {
	}
	boolean result = true;
	String msg = "";
	if (r_no == null) {
		result = false;
		msg = "삭제실패";
	} else {
		
			ReviewService.getInstance().reviewDeleteByNo(r_no);
			result = true;
			msg = "삭제성공";
		
		
	}
%>
<script type="text/javascript">
<%if (result) {%>
	alert('<%=msg%>');
	location.href='review_Id_list.jsp?pageno=<%=pageno%>';
<%} else {%>
	alert('<%=msg%>');
	//history.back();
	location.href='review_Id_list?pageno=<%=pageno%>';
<%}%>
	
</script>

