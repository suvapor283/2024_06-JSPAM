<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<Map<String, Object>> articleListMap = (List<Map<String, Object>>)request.getAttribute("articleListMap");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 리스트</title>
</head>
<body>
	<div>
		<div><a href="<%= request.getContextPath() %>/home/main">메인</a></div>
	</div>
	
	<ul>
		<% 
		for (Map<String, Object> articleMap : articleListMap) {
		%>
			<li><%= articleMap.get("id") %> | <%= articleMap.get("updateDate") %> | <a href="detail?id=<%= articleMap.get("id") %>"><%= articleMap.get("title") %></a></li>
		<%
		}
		%>
	</ul>
	
</body>
</html>