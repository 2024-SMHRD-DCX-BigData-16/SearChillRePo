<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <h2>분실물 등록</h2>
    <form action="saveLostItem" method="post">
        <table border="1">
            <tr>
                <td>분실물 명:</td>
                <td><input type="text" name="object_name" ></td>
            </tr>
            <tr>
                <td>분실물 사진 (URL):</td>
                <td><input type="text" name="object_photo"></td>
            </tr>
            <tr>
                <td>분실물 보관 장소:</td>
                <!-- 지도에서 선택할 수 있도록 변경 -->
                <td><input type="text" name="object_keeping_place"></td>
            </tr>
            <tr>
                <td>알림 메시지:</td>
                <td><textarea name="notice_msg"></textarea></td>
            </tr>
            
            <tr style="display: none">
                <td>분실물 획득 장소:</td>
                <!-- 분실물 보관 장소 처음에 위치 허용하면 그 위치 
                위도 경도도 따로 보내기
                -->
                <td><input type="text" name="object_loc" ></td>
            </tr>
            
            
            
        </table>
        <br>
        <input type="submit" value="등록">
    </form>

</body>
</html>