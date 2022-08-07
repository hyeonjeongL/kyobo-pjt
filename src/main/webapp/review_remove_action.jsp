<%@page import="java.io.PrintWriter"%>
<%@page import="com.itwill.book.common.ReviewException"%>
<%@page import="com.itwill.book.dto.Review"%>
<%@page import="com.itwill.book.service.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 String u_id = (String)session.getAttribute("sUserId");

 	
	Integer r_no = null;
	Integer pageno = null;
	try {
		r_no = Integer.valueOf(request.getParameter("r_no"));
		pageno = Integer.valueOf(request.getParameter("pageno"));
	} catch (Exception ex) {
	}
	boolean result = true;
	String msg = "";
	if(u_id!=null){
	if (r_no == null) {
		result = false;
		msg = "삭제실패";
	} else {
		 try{
			ReviewService.getInstance().reviewDeleteByNo(r_no);
			result = true;
			msg = "삭제성공";
	} catch(ReviewException e){
		result = false;
		msg = "삭제실패:" + e.getMessage();
	}
	}
	}else{
			PrintWriter script= response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 하세요')");
			script.println("location.href='userinfo_login_form.jsp'");
			script.println("</script>");
	}
	
%>
<script type="text/javascript">
<%if (result) {%>
	alert('<%=msg%>');
	location.href='review_Id_list.jsp?pageno=<%=pageno%>';
<%} else {%>
	alert('<%=msg%>');
	//history.back();
	location.href='review_Id_list.jsp?pageno=<%=pageno%>';
<%}%>
	
</script>
 