<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

${loginuser.mem_id}님의 QR코드로 등록된 분실물

<div>

<table border="1px">
    <thead>
        <tr>
            <th>물품명</th>
            <th>사진</th>
            <th>습득 위치</th>
            <th>습득 날짜</th>
            <th>보관 장소</th>
            <th>보관 장소 정보</th>
            <th>메시지</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="item" items="${myLostItemList}">
            <tr>
                <td>${item.object_name}</td>
                <td>${item.object_photo}</td>
 			<td><img src='./resources/objectImages/${item.object_photo}' width="100px" height="100px"></td>

                <td>${item.object_scan_loc}</td>
                <td>${item.object_date}</td>
                <td>${item.object_keeping_place}</td>
                <td>${item.object_keeping_place_info}</td>
                <td>${item.notice_msg}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</div>

</body>
</html>