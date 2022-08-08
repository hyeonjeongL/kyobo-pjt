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
	IPRegisterService ipRegisterService = new IPRegisterService();
	List<IPRegister> ipRegisters = ipRegisterService.selectById(u_id);
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel=stylesheet href="css/styles.css" type="text/css">
<script type="text/javascript" src=js/ebook.js></script>
</head>
<body>
<div><table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td height="17">&nbsp;&nbsp;<b>등록된 PC</b></td>
									
								
									
									
								</tr>
							</table> 
<br>
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
										<td width=210 height=25 align="center" bgcolor="E5F0FA" class=t1><font
											 >IP주소</font></td>
										<td width=210 height=25 align="center" bgcolor="E5F0FA" class=t1><font
											 >등록일</font></td>
										
									</tr>
									
									<!-- cart item start -->
									<%
									for(IPRegister ipRegister : ipRegisters){
									
									%>
									<tr>
										<td width=60 height=26 align=center bgcolor="ffffff" class=t1><input type="checkbox" name="i_no_check" onchange="check_box_count();" value="<%=ipRegister.getI_no()%>" ></td>
										<td width=40 height=26 align=center bgcolor="ffffff" class=t1><img src='image/pc.jpg' width="33" height="40"/></td>
										<td width=210 height=26 align=center bgcolor="ffffff" class=t1><%=ipRegister.getI_name() %></td>
										<td width=110 height=26 align=center bgcolor="ffffff" class=t1><%=ipRegister.getI_ipno() %></td>
										<td width=110 height=26 align=center bgcolor="ffffff" class=t1><%=ipRegister.getI_date() %>
										
									</tr>
									<%} %>
									<!-- cart item end -->
								</table>
								</form>
								<br>
									<td><input type="button" value="PC등록" onClick="pcregister();"> </td>
									<td><input type="button" value="선택PC삭제" onClick="pcdelete();"> </td>
							</div>
							</div>
</body>
</html>