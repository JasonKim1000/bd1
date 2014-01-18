<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Board-Content</title>	
<script>
function onDownload(idx) {
	var o = document.getElementById("ifrm_filedown");	
	o.src = "download.do?idx="+idx;
}
</script>		
</head>


<body>		
<iframe id="ifrm_filedown" style="position:absolute; z-index:1;visibility : hidden;"></iframe>									
	<h1>Order-Content</h1>						
	<table border="1">							
		<tr>									
			<th>IDX</th>						
			<td>${article.idx}</td>
			<th>Writer</th>
			<td>${article.writer}</td>
			<th>IP</th>
			<td>${article.regip}</td>
			<th>Date</th>
			<td>${article.regdate}</td>
			<th>Count</th>
			<td>${article.count}</td>
		</tr>
		<tr>
			<th colspan="2">Title</th>						
			<td colspan="6">${article.title}</td>
		</tr>
		<tr>
			<th colspan="2">Content</th>						
			<td colspan="6">${article.content}</td>
		</tr>
		<tr>
			<th colspan="2">File</th>			
			<td colspan="8"><a href="#" onclick="onDownload('${article.idx}')">${article.filename}</a></td>
		</tr>
	</table>
	<a href="delete.do?idx=${article.idx}">DELETE</a>
	<a href="index.jsp">LIST</a> 
<%		
	
%>
</body>
</html>