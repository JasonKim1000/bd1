<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.board.beans.Board"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>board</title>
<style type="text/css">
table,td,th {
	border: 1px solid green;
}

th {
	background-color: green;
	color: white;
}
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
</head>

<body>
	<h1>Order List</h1>
	<table>
		<tr>
			<th>ID</th>
			<th>Title</th>
			<th>Writer</th>
			<th>Date</th>
			<th>Count</th>
		</tr>

		<c:forEach items="${articleList}" var="article">

			<tr>

				<td>${article.idx}</td>

				<td><a href='count.do?idx=${article.idx}'>${article.title}</a></td>

				<td>${article.writer}</td>

				<td>${article.regdate}</td>

				<td>${article.count}</td>

			</tr>

		</c:forEach>

	</table>

	<div id="append_article"></div>

	<c:if test="${page > 0}">
		<a href="list.do?page=${page-5}">previous</a>
	</c:if>
	<c:if test="${page == 0}">
		<a href="#">previous</a>
	</c:if>

	<fmt:parseNumber value="${page/5+1 }" type="number" integerOnly="True" />
	page

	<c:if test="${fn:length( articleList ) < 5}">
		<a href="#">next</a>
	</c:if>
	<c:if test="${fn:length( articleList ) == 5}">
		<a href="#" onclick="loadNextPage('${page+5}')">next</a>
	</c:if>
	
	<input type="hidden" name="page" id="page" value="${page}">
	<a href="#" onclick="loadNextPage()">MORE..</a>

	<script>

	/*function loadNextPage(page){
	
	var param = "page="+page;
	
	$('#append_article').load("list.do", param, function(data){
	
	alert(data);
	
	});
	
	}*/
	
	function loadNextPage(){
		var page=$('#page').val();
		page=parseInt(page);
		page += 10;
		
		$.ajax({type:'post',url:'ajaxList.do',data:({page:page}),success:function(data){$('table').append(data); $('#page').val(page);}
			});
	}
	
	
	</script>

	<a href="write.jsp">Write</a>

</body>
</html>