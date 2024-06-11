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
<title>Insert title here</title>
</head>
<body>
	<h1>article list</h1>
	
	<ul>
		<% 
		for (Map<String, Object> articleMap : articleListMap) { 
		%>
		
		<li><%= articleMap.get("id") %> | <%= articleMap.get("updateDate") %> | <%= articleMap.get("title") %> </li>
		<%
		} 
		%>
	</ul>
	
</body>
</html>