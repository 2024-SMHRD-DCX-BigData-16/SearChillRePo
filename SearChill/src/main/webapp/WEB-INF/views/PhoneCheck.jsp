<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>분실자 연락처 확인</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f4f4f9;
        text-align: center;
        margin: 0;
        padding: 0;
    }
    .container {
        width: 50%;
        margin: 50px auto;
        padding: 20px;
        background: #fff;
        border-radius: 10px;
        box-shadow: 2px 2px 15px rgba(0, 0, 0, 0.1);
    }
    .info-box {
        background-color: #f9f9f9;
        padding: 15px;
        border-radius: 10px;
        box-shadow: 2px 2px 10px rgba(0,0,0,0.1);
        margin-bottom: 20px;
    }
    .info-box h2 {
        color: #2c3e50;
        margin-bottom: 10px;
    }
    .info-box p {
        color: #555;
        font-size: 16px;
        line-height: 1.5;
    }
    .btn {
        background-color: #3498db;
        color: white;
        border: none;
        padding: 10px 20px;
        font-size: 16px;
        border-radius: 5px;
        cursor: pointer;
        margin: 10px 0;
    }
    .btn:hover {
        background-color: #2980b9;
    }
    .hidden-input {
        display: none;
    }
</style>
</head>
<body>

<div class="container">

    <div class="info-box">
        <h2>📞 분실자 연락처 확인</h2>
        <p>분실자의 연락처를 확인하여 도와주세요. <br> 작은 관심이 큰 도움이 됩니다. 💙</p>
    </div>

    <div>
        <h3>📌 분실자 연락처:</h3>
        <p style="font-size: 18px; font-weight: bold; color: #2c3e50;">
            ${phone}
        </p>
    </div>

    <c:if test="${phone eq '비공개 상태입니다.'}">
        <div class="info-box">
            <p>분실자의 연락처가 비공개 상태입니다. <br> 물건을 주운 위치를 입력해 주세요.</p>
        </div>
        
        <form action="lostItemForm">
            <input type="text" name="mem_id" value="<%= request.getParameter("mem_id") %>" class="hidden-input">
            <input type="submit" value="📋 분실물 등록 페이지 이동" class="btn">
        </form>
    </c:if>

</div>

</body>
</html>
