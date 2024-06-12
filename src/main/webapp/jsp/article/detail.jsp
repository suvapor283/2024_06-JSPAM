<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Map<String, Object> articleMap = (Map<String, Object>)request.getAttribute("articleMap");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Article Detail</title>
</head>
<body>
	<h1>Article Detail</h1>
	<div>
		<div><a href="<%= request.getContextPath() %>/home/main">메인</a></div>
	</div>
	
	<div>
		<h2><%= articleMap.get("id") %>번 게시물 상세보기</h2>
		<div>작성일 : <%= articleMap.get("regDate") %></div>
		<div>수정일 : <%= articleMap.get("updateDate") %></div>
		<div>제목 : <%= articleMap.get("title") %></div>
		<div>내용 : <%= articleMap.get("body") %></div>
	</div>
	
	<div>
		<div><a href="list">목록</a></div>
		<div><a href="delete?id=<%= articleMap.get("id") %>">삭제</a></div>
	</div>

</body>
</html>