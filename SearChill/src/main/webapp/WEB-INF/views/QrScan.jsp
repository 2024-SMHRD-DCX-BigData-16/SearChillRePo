<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


http://localhost:8081/controller/qrScan/?mem_id=1

<br>
mem_id = <%= request.getParameter("mem_id") %>



만들거
id에 맞는 qr번호에 맞는 분실물 등록 사이트 ->LostItemForm 들어가는거
<form action="lostItemForm">
<input type="text" name="mem_id" value="<%= request.getParameter("mem_id") %>" >
<input type="submit" value="LostItemFrom">
</form>


<!-- <a href="lostItemForm">LostItemFrom</a>
 -->
<br>
 
연락처 확인 버튼
<a href="phoneCheck">phoneCheck</a>
 
</body>
</html>