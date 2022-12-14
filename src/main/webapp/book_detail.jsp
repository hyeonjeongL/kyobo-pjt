<%@page import="com.itwill.book.dto.ReviewBookListPageMakerDto"%>
<%@page import="com.itwill.book.dto.OrderDetail"%>
<%@page import="com.itwill.book.dto.Review"%>
<%@page import="com.itwill.book.service.ReviewService"%>
<%@page import="com.itwill.book.dto.Ebook"%>
<%@page import="com.itwill.book.service.EbookService"%>
<%@page import="com.itwill.book.dto.Book"%>
<%@page import="com.itwill.book.service.BookService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%--<%@include file="login_check.jspf"%>--%>
<%
String b_noStr = request.getParameter("b_no");
if (b_noStr == null || b_noStr.equals("")) {
   response.sendRedirect("book_list.jsp");
   return;
}
boolean isLogin = false;
if (session.getAttribute("sUserId") != null) {
   isLogin = true;
}
BookService bookService = new BookService();
Book book = bookService.selectByNo(Integer.parseInt(b_noStr));
if (book == null) {
   out.println("<script>");
   out.println("alert('매진된상품입니다.');");
   out.println("location.href='book_list.jsp';");
   out.println("</script>");
   return;
}
EbookService ebookService = new EbookService();
Ebook ebook = ebookService.selectByNo(Integer.parseInt(b_noStr));
%>
<%-------------------------------- --%>
<%!public String getTitleString(Review review) {
      StringBuilder title = new StringBuilder(128);
      String t = review.getR_title();
      if (t.length() > 15) {
         //t = t.substring(0,15);
         //t = t+"...";
         t = String.format("%s...", t.substring(0, 15));
      }
      //답글공백삽입
      
      for (int i = 0; i < review.getR_depth(); i++) {
         title.append("&nbsp;&nbsp;");
      }
      
      if (review.getR_depth() > 0) {
         title.append("<img border='0' src='image/re.gif'/>"); // 댓글 시작에 ㄴ 나오게 하는거인듯
      }
      
      title.append(t.replace(" ", "&nbsp;"));
      
      return title.toString();
   }%>
    
<%
   String sUserId = (String)session.getAttribute("sUserId");
   String pageNo = request.getParameter("pageno");
   if (pageNo == null || pageNo.equals("")) {
      pageNo = "1";
   }
   
   ReviewService reviewService=new ReviewService();
    Review review1=reviewService.findReviewByBook(book);
    if(review1==null){
       review1 = new Review(0,null,null,0 ,null,null,
             new OrderDetail(0,0,0,new Book(Integer.parseInt(b_noStr),null,null,0,null,null,null,null))
             ,0,0,0);
       
    }
    /*
   
   */
   
   ReviewBookListPageMakerDto reviewBooklistPage = new ReviewService().findReviewBookList(review1, Integer.parseInt(pageNo));
   
%>

<%-------------------------------- --%>
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
<script type="text/javascript" src=js/ebook.js></script>
<script type="text/javascript" src=js/book.js></script>
<script type="text/javascript">
   function add_cart_popup_window() {
      if (
<%=!isLogin%>
   ) {
         alert('로그인 하세요');
         location.href = 'userinfo_login_form.jsp';
      } else {
         var left = Math.ceil((window.screen.width) / 3);
         var top = Math.ceil((window.screen.height) / 3);
         console.log(left);
         console.log(top);
         var cartWin = window
               .open(
                     "about:blank",
                     "cartForm",
                     "width=420,height=200,top="
                           + top
                           + ",left="
                           + left
                           + ",location=no, directories=no, status=no, menubar=no, scrollbars=no,copyhistory=no");
         document.add_cart_form.action = 'cart_add_action_popup_window.jsp';
         document.add_cart_form.target = 'cartForm';
         document.add_cart_form.method = 'POST';
         document.add_cart_form.submit();
      }
   }
   function order_create_form() {
      if (
<%=!isLogin%>
   ) {
         alert('로그인 하세요');
         location.href = 'userinfo_login_form.jsp';
      } else {
         document.book_detail_form.method = 'POST';
         document.book_detail_form.action = 'order_create_form.jsp';
         document.book_detail_form.submit();
      }
   }
   function bookList() {
      location.href = 'book_list.jsp';
   }
   function reviewGo() {
      document.book_detail_form.action = "review_book_list.jsp";
      document.book_detail_form.method = 'POST';
      document.book_detail_form.submit();
   }
   function cart_insert_action(formId) {
      if (
<%=!isLogin%>
   ) {
         alert('로그인 하세요');
         location.href = 'userinfo_login_form.jsp';
      } else if (window.confirm('장바구니에 추가하시겠습니까?')) {
         var form = document.getElementById(formId);
         form.method = 'POST';
         form.action = 'cart_insert_action.jsp';
         form.submit();
      }
   }
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
   marginwidth=0 marginheight=0>
   <form name="book_detail_form">
      <input type="hidden" name="b_no" value="<%=book.getB_no()%>">
      <input type="hidden" name="b_qty" id="b_qty" value="1">
		<input type="hidden" name="buyType" value="direct">

   </form>
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
            <table border=0 cellpadding=0 cellspacing=0>
               <tr>
                  <td><br />
                     <table style="padding-left: 10px" border=0 cellpadding=0
                        cellspacing=0>
                        <tr>
                           <td bgcolor="f4f4f4" height="35">&nbsp;&nbsp;<Font
                              size="4">상세 정보</td>
                        </tr>
                     </table> <!-- 
                     <form name="f" method="post">
                     -->
                     <table style="margin-left: 10px" border=0 width=80% height=376
                        align=center>
                        <tr valign=bottom>
                           <td width=10% align=center class=t1><font size=2
                              color=#0000FF><b>주문 권수</b></font></td>
                           <td width=30% align=center class=t1><font size=2
                              color=#0000FF><b>&nbsp;&nbsp;&nbsp;&nbsp;</b></font></td>
                           <td width=60% align=center class=t1><font size=2
                              color=#0000FF><b>도서 정보</b></font></td>
                        </tr>
                        <tr width=100%>
                           <td colspan=3 height=5><hr color=#556b2f></td>
                        </tr>
                        <tr width=100%>
                           <td width=30% height=200 align=center class=t1>
                              <form id="add_cart_from" name="add_cart_form"
                                 onchange="changeqty();" method="post"
                                 action="cart_insert_action.jsp">
                                 수량 :
                                 <!-- 
                                  <input type=text name="cart_qty" value=1 size=4 class=TXTFLD>  
                                 -->
                                 <select id="cart_qty" name="cart_qty">
                                    <option value="1">1
                                    <option value="2">2
                                    <option value="3">3
                                    <option value="4">4
                                    <option value="5">5
                                    <option value="6">6
                                    <option value="7">7
                                    <option value="8">8
                                    <option value="9">9
                                    <option value="10">10


                                 </select> 권<br><br> 
                                    <a href="javascript:cart_insert_action('add_cart_from');" onclick="add_cart_popup_window();">장바구니에담기</a>
                                    <input type="hidden" name=b_no value="<%=book.getB_no()%>">
                              </form>
                           </td>
                           <td width=100 height=200 align=center><img border=0
                              src='image/<%=book.getB_image()%>.jpg' width=120 height=200></td>
                           <td width=100 height=200 class=t1>
                              <ol type="disc">
                                 <li>제&nbsp;&nbsp;&nbsp;목 : <%=book.getB_name()%>&nbsp;
                                 </li>
                                 <li>가&nbsp;&nbsp;&nbsp;격 : <%=book.getB_price()%>&nbsp;
                                 </li>
                                 <li>분&nbsp;&nbsp;&nbsp;야 : <%=book.getB_class()%>&nbsp;
                                 </li>
                                 <li>저&nbsp;&nbsp;&nbsp;자 : <%=book.getB_author()%>&nbsp;
                                 </li>
                                 <li>출판사 : <%=book.getB_publisher()%>&nbsp;
                                 </li>
                                 <li>소&nbsp;&nbsp;&nbsp;개 : <%=book.getB_summary()%>&nbsp;
                                 </li>
                                 <li>대여료 : <%=ebook.getE_price()%> (e-book, 90일)&nbsp;
                                 </li>
                              </ol>
                           </td>
                        </tr>
                        <tr>
                           <td colSpan=3 height=21><hr color=#556b2f></td>
                        </tr>
                        <!-- ----------------------------------------------------- -->
                        <tr style="padding-left: 50px">
                        <td width="65%" colspan="3" align="left">
                        <table width=0 border=0 cellpadding=0 cellspacing=0>
                           <tr>
                              
                              <td>
                                 <!--contents--> <br />
                                 <table style="padding-left: 10px;padding-right: 10px" border=0 cellpadding=0
                                    cellspacing=0>
                                    <tr>
                                       <td bgcolor="f4f4f4" height="20">&nbsp;&nbsp;<Font
                                          size="2">상품 리뷰 </td>
                                    </tr>
                                 </table>
                                 <form name="f" method="post" action="" style="margin: 3px 10px 3px 10px">
                                    <input type="hidden" name="b_no" value="4">
                                    <table border="0" cellpadding="0" cellspacing="1"
                                       width="590" bgcolor="BBBBBB">

                                       <tr height="20">
                                          <td width=280 align=center bgcolor="E6ECDE">리뷰제목</td>
                                          <td width=120 align=center bgcolor="E6ECDE">작성자</td>
                                          <td width=120 align=center bgcolor="E6ECDE">작성날짜</td>
                                       </tr>
                                       <%
                                       for (Review review : reviewBooklistPage.itemList) {
                                       %>
                                       <tr height="20">
                                          <td width=280 bgcolor="ffffff" style="padding-left: 10px" align="left">
                                          <a href='review_view.jsp?r_no=<%=review.getR_no()%>&pageno=<%=reviewBooklistPage.pageMaker.getCurPage()%>&b_no=<%=b_noStr%>'>
                                          <%=getTitleString(review)%>
                                          </a>
                                          </td>
                                          <td width=120 align=center bgcolor="ffffff"><%=review.getU_id()%>
                                          </td>
                                          <td width=120 bgcolor="ffffff" style="padding-left: 10px" align="left">
                                             <%=review.getR_date()%>
                                          </td> 
                                       </tr>
                                                   
                                       <%
                                          }
                                       %>


                                    </table>
                                 </form>
                                 <table border="0" cellpadding="0" cellspacing="1" width="590">
                                    <tr>
                                       <td align="center"><font color='red'><strong>1</strong></font>&nbsp;





                                       </td>
                                    </tr>
                                 </table> <!-- button -->
                              </td>
                           </tr>
                           
                        </table>
                        </td>
                        
                        <!-- ----------------------------------------------------- -->
                        </tr>
                     </table>
                     <table border="0" cellpadding="0" cellspacing="1">
                        <tr>
                           <td align=center><input type="button" value="주문하기"
                              onClick="order_create_form();"> &nbsp; <input
                              type="button" value="상품리스트" onClick="bookList();">&nbsp;
                              <input type="button" value="ebook 90일 대여하기"
                              onClick="ebookBuy()">&nbsp; <input type="button"
                              value="도서 리뷰" onClick="reviewGo()"></td>
                        </tr>
                     </table></td>
               </tr>
            </table>
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