<%@page import="com.itwill.book.service.BookService"%>
<%@page import="com.itwill.book.dto.Book"%>
<%@page import="com.itwill.book.dto.OrderDetail"%>
<%@page import="com.itwill.book.dto.ReviewBookListPageMakerDto"%>
<%@page import="com.itwill.book.dto.Review"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.book.service.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   String b_no = request.getParameter("b_no");
   if(b_no==null){
      response.sendRedirect("book_list.jsp");
      return;
      
   }
   BookService bookService =new BookService();
   Book book=bookService.selectByNo(Integer.parseInt(b_no));
    ReviewService reviewService=new ReviewService();
    Review review1=reviewService.findReviewByBook(book);
    if(review1==null){
       review1 = new Review(0,null,null,0 ,null,null,
             new OrderDetail(0,0,0,new Book(Integer.parseInt(b_no),null,null,0,null,null,null,null))
             ,0,0,0);
       
    }
    /*
   
   */
   
   ReviewBookListPageMakerDto reviewBooklistPage = new ReviewService().findReviewBookList(review1, Integer.parseInt(pageNo));
   //ReviewBookListPageMakerDto reviewBooklistPage = new ReviewService().reviewSelectByBookList(review1);
   
   
   
%>
<!DOCTYPE html>
<html>
<head>
<title>상품 리뷰</title>
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
            <table width=0 border=0 cellpadding=0 cellspacing=0>
               <tr>
                  <td>
                     <!--contents--> <br />
                     <table style="padding-left: 10px" border=0 cellpadding=0
                        cellspacing=0>
                        <tr>
                           <td bgcolor="f4f4f4" height="35">&nbsp;&nbsp;<Font size="4">상품 리뷰
                                 </td>
                        </tr>
                     </table> 
               <form name="f" method="post" action="">
                  <input type="hidden" name="b_no" value="<%=b_no%>">
                        <table border="0" cellpadding="0" cellspacing="1" width="590"
                           bgcolor="BBBBBB">

                           <tr height="30">
                              <td width=280 align=center bgcolor="E6ECDE">리뷰제목</td>
                              <td width=120 align=center bgcolor="E6ECDE">작성자</td>
                              <td width=120 align=center bgcolor="E6ECDE">작성날짜</td>
                           </tr>
                           <%
                              for (Review review : reviewBooklistPage.itemList) {
                           %>
                           <tr height="40">
                              <td width=280 bgcolor="ffffff" style="padding-left: 10px" align="left">
                              <a href='review_view.jsp?b_no=<%=review.getOrderDetail().getBook().getB_no() %>&od_no=<%=review.getOrderDetail().getOd_no() %>&r_no=<%=review.getR_no()%>&pageno=<%=reviewBooklistPage.pageMaker.getCurPage()%>'>
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
                           <td align="center">
                          
                               <%if(reviewBooklistPage.pageMaker.getPrevGroupStartPage()>0) {%>    
                                  <a href="./review_book_list.jsp?b_no=<%=review1.getOrderDetail().getBook().getB_no() %>&pageno=1">◀◀</a>&nbsp;
                               <%}%>
                               <%if(reviewBooklistPage.pageMaker.getPrevPage()>0) {%>    
                                 <a href="./review_book_list.jsp?b_no=<%=review1.getOrderDetail().getBook().getB_no() %>&pageno=<%=reviewBooklistPage.pageMaker.getPrevPage()%>">◀</a>&nbsp;&nbsp;
                               <%}%>
                              
                              <%
                                 for (int i = reviewBooklistPage.pageMaker.getBlockBegin(); i <= reviewBooklistPage.pageMaker.getBlockEnd(); i++) {
                                  if (reviewBooklistPage.pageMaker.getCurPage() == i) {
                              %>
                               <font color='red'><strong><%=i%></strong></font>&nbsp;
                              <%} else {%>
                              <a href="./review_book_list.jsp?b_no=<%=review1.getOrderDetail().getBook().getB_no() %>&pageno=<%=i%>"><strong><%=i%></strong></a>&nbsp;
                              <%
                                 }
                                }%>
                                
                                
                               <%if(reviewBooklistPage.pageMaker.getCurPage()< reviewBooklistPage.pageMaker.getTotPage()){%>
                                <a href="./review_book_list.jsp?b_no=<%=review1.getOrderDetail().getBook().getB_no() %>&pageno=<%=reviewBooklistPage.pageMaker.getNextPage()%>">▶&nbsp;</a>
                               <%}%>
                               <%if(reviewBooklistPage.pageMaker.getNextGroupStartPage()< reviewBooklistPage.pageMaker.getTotPage()){%>
                              <a
                              href="./review_book_list.jsp?b_no=<%=review1.getOrderDetail().getBook().getB_no() %>&pageno=<%=reviewBooklistPage.pageMaker.getTotPage()%>">▶▶</a>&nbsp;
                               <%}%>
                           </td>
                        </tr>
                     </table> <!-- button -->
                     </td>
               </tr>
            </table>
                        
            
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


