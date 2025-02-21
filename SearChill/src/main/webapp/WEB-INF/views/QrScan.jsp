<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>qr스캔시 접속할 페이지</h1>

<br>
mem_id = <%= request.getParameter("mem_id") %>


<form action="lostItemForm">
<input type="text" name="mem_id" value="<%= request.getParameter("mem_id") %>" >
<input type="submit" value="LostItemFrom 분실물 등록 페이지">
</form>


<!-- <a href="lostItemForm">LostItemFrom</a>
 -->
<br>
 
연락처 확인 버튼(미완)
<a href="phoneCheck">phoneCheck</a>
 
</body>
</html>