<%@page import="com.itwill.book.dto.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
  /*************case2 redirection******************
	String msg = request.getParameter("msg");
	String userId = request.getParameter("userId");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	if(msg == null) msg="";
	if(userId == null) userId="";
	if(password == null) password="";
	if(name == null) name="";
	if(email == null) email="";
 	User fuser = new User(userId, password, name, email);
 	private String u_id;
	private String u_password;
	private String u_name;
	private String u_phone;
	private String u_birth;
	private String u_gender;
	private String u_email;
	private String u_address;
  *************************************************/
  
  UserInfo fuser = (UserInfo)request.getAttribute("fuser");
  String msg = (String)request.getAttribute("msg");
  if(msg==null) msg = "";
  if(fuser == null){
	  fuser = new UserInfo("","","","","","","","");
	}
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>사용자 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/user.css" type="text/css">
<style type="text/css" media="screen">
</style>
<script type="text/javascript" src="js/userinfo.js"></script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			<jsp:include page="include_common_top.jsp"/>
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			<jsp:include page="include_common_left.jsp"/>
			<!-- include_common_left.jsp end-->
		</div>
		<!-- navigation end-->
		<!-- wrapper start -->
		<div id="wrapper">
			<!-- content start -->
			<!-- include_content.jsp start-->
			<div id="content">
				<table width=0 border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td>
							<!--contents--> <br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>사용자 관리
											- 회원 가입</b></td>
								</tr>
							</table> 
							<!-- write Form  -->
							<form name="f">
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E5F0FA" height="33">
											아이디</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="text" style="width: 150px; height:15px; font-size: 18px;" name="u_id"
											value="<%=fuser.getU_id()%>">&nbsp;&nbsp;<font color="red"><%=msg%></font>
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E5F0FA" height="33">비밀번호</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="password" style="width: 150px; height:15px; font-size: 18px;" name="u_password"
											value="<%=fuser.getU_password()%>">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E5F0FA" height="33">비밀번호 확인</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="password" style="width: 150px; height:15px; font-size: 18px;" name="password2"
											value="<%=fuser.getU_password()%>" onkeyup="repassword()">&nbsp;&nbsp;<font id="pass2" color="red"></font>
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E5F0FA" height="33">이름</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="text" style="width: 150px; height:15px; font-size: 18px;" name="u_name"
											value="<%=fuser.getU_name()%>">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E5F0FA" height="33">핸드폰번호
											</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="text" style="width: 150px; height:15px; font-size: 18px;" name="u_phone"
											value="<%=fuser.getU_phone()%>">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E5F0FA" height="33">생일
											</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="text" style="width: 150px; height:15px; font-size: 18px;" name="u_birth"
											value="<%=fuser.getU_birth()%>">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E5F0FA" height="33">성별
											</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="radio" name="u_gender" value="남"/>남
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
											<input type="radio" name="u_gender" value="여"/>여
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E5F0FA" height="33">이메일
											</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="text" style="width: 150px; height:15px; font-size: 18px;" name="u_email"
											value="<%=fuser.getU_email()%>">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E5F0FA" height="33">주소
											</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="text" style="width: 150px; height:15px; font-size: 18px;" name="u_address"
											value="<%=fuser.getU_address()%>">
										</td>
									</tr>
								</table>
							</form> <br />

							<table border=0 cellpadding=0 cellspacing=1 style="align: center;">
								<tr>
									<td align=center>
									<input type="button" value="회원 가입" onclick="userCreate();"> &nbsp; 
									<input type="button" value="메인" onClick="userMain()">
									</td>
								</tr>
							</table>

						</td>
					</tr>
				</table>
			</div>
			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<jsp:include page="include_common_bottom.jsp"/>
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>
<!--
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="userinfo_insert_action.jsp">
<input type="text" name="u_id" value="test1"><br>
<input type="text" name="u_password" value="1234"><br>
<input type="text" name="u_name" value="김테스터"><br>
<input type="text" name="u_phone" value="01012345678"><br>
<input type="text" name="u_birth" value="970902"><br>
<input type="text" name="u_gender" value="남"><br>
<input type="text" name="u_email" value="test@gmail.com"><br>
<input type="text" name="u_address" value="경기도"><br>
<input type="submit" name="가입"><br>
</form>

</body>
</html>
  -->