<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function keywordCheck() {
		var str_keyword = window.searchform.keyword.value;
		if (!str_keyword || str_keyword === "") {
			window.alert("검색어를 입력하세요.");
			window.searchform.keyword.focus();
			return false;
		}
		window.searchform.submit();
	}
</script>
</head>
<body>
<h3>검색</h3><hr/>
<form action="book_search_result.jsp" method="get">
	<select data-trigger="" name="searchType">
								<option value="name">제목</option>
								<option value="author">저자</option>
								<option value="class">분야</option>
							</select>
	<div class="input-field second-wrap">
						<input id="search" type="text" name="keyword" placeholder="검색어를 입력하세요" />
					</div>
					<input type="submit" value="검색" action="book_search_result.jsp">

</form>

</body>
</html>