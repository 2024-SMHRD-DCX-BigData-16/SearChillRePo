<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <h1>QR 코드 생성기</h1>

    <%-- form 태그 제거, div 태그로 대체 --%>
    <div>
        <label for="url">URL 입력:</label>
        <input type="text" id="url" name="url" value="https://www.example.com" />
        <br />
        <%-- button type="button" 으로 변경, onclick 이벤트 핸들러 연결 --%>
        <button type="button" onclick="displayQrCode()">QR 코드 생성</button>
    </div>

    <%-- QR 코드 이미지를 표시할 영역 (초기에는 숨김) --%>
    <div id="qrCodeArea" style="display:none;">
        <h2>QR 코드 이미지</h2>
        <img id="qrImage" src="" alt="QR 코드 이미지" /> <%-- src 속성 초기화 --%>
    </div>
    
    
<script>
function displayQrCode() {
    var url = document.getElementById("url").value;
    if (url) {
        var qrCodeImageUrl = "/controller/qrMake?url=" + encodeURIComponent(url); // 컨트롤러 URL 정확하게 지정

        // QR 코드 이미지를 표시할 <img> 태그의 src 속성 변경
        document.getElementById("qrImage").src = qrCodeImageUrl;

        // (선택 사항) QR 코드 이미지 영역을 보이도록 설정 (만약 숨겨져 있었다면)
        document.getElementById("qrCodeArea").style.display = "block";

    } else {
        alert("URL을 입력해주세요.");
    }
    return false; // 폼 기본 제출 방지 (필요한 경우, 현재는 form 태그 제거했으므로 불필요)
}
</script>

</body>
</html>