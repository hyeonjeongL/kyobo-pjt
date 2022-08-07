<%@page import="com.itwill.book.dto.IPRegister"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.book.service.IPRegisterService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
  String u_id = (String)session.getAttribute("sUserId");
  String ip = request.getHeader("X-Forwarded-For");
 	if(ip == null){
 		ip = request.getRemoteAddr();
 	}
	//IPRegisterService ipRegisterService = new IPRegisterService();
	//List<IPRegister> ipRegisters = ipRegisterService.selectById(u_id);
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
</script>
</head>
<body>
<div id='f'>
							<form name="ebook">
							<table  align=center  width=80% border="0" cellpadding="0" cellspacing="1"  bgcolor="BBBBBB">
									<tr>
										<td width=60 height=25  align="center" bgcolor="E5F0FA" class=t1><font
											 >선택</font></td>
										<td width=40 height=25 align="center" bgcolor="E5F0FA" class=t1><font
											 >분류</font></td>
										<td width=210 height=25 align="center" bgcolor="E5F0FA" class=t1><font
											 >PC이름</font></td>
										<td width=110 height=25 align="center" bgcolor="E5F0FA" class=t1><font
											 >IP주소</font></td>
										<td width=110 height=25 align="center" bgcolor="E5F0FA" class=t1><font
											 >종료일</font></td>
										
									</tr>
									
									<!-- cart item start -->
									<%
									
									
									%>
									<tr>
										<td width=60 height=26 align=center bgcolor="ffffff" class=t1><input type="checkbox" name="ebook_check" onchange="check_box_count();" value="" ></td>
										<td width=40 height=26 align=center bgcolor="ffffff" class=t1><img src='image/pc.jpg' width="33" height="40"/></td>
										<td width=210 height=26 align=center bgcolor="ffffff" class=t1><a href='ebook_detail.jsp?b_no='></a></td>
										<td width=110 height=26 align=center bgcolor="ffffff" class=t1></td>
										<td width=110 height=26 align=center bgcolor="ffffff" class=t1><input type="hidden" name="b_no" value=""></td>
										
									</tr>
									
									<!-- cart item end -->
									
								</table>
								</form>
							</div>
</body>
</html>