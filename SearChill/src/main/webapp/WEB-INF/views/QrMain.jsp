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

	<h1>QR코드</h1>

	<c:if test="${loginuser != null}">
		<div style="display: none;">
			<label for="url">URL 입력:</label> <input type="text" id="url"
				name="url"
				value="http://localhost:8081/controller/qrScan/?mem_id=${loginuser.mem_id }" />
			<br />
		</div>
	</c:if>

	<%-- QR 코드 이미지를 표시할 영역 --%>
	<div id="qrCodeArea" style="display: none;">
		<img id="qrImage" src="" alt="QR 코드 이미지" />
		<%-- src 속성 초기화 --%>
		<div>
			<a id="down_btn" href="" download><button>QR코드 다운로드</button></a>
		</div>
	</div>


	<script>
		function displayQrCode() {
			var url = document.getElementById("url").value;
			if (url) {
				var qrCodeImageUrl = "/controller/qrMake?url="
						+ encodeURIComponent(url); // 컨트롤러 URL 정확하게 지정

				// QR 코드 이미지를 표시할 <img> 태그의 src 속성 변경
				document.getElementById("qrImage").src = qrCodeImageUrl;

				// QR 코드 다운로드 버튼의 href 속성 설정
				document.getElementById("down_btn").href = qrCodeImageUrl;

				// QR 코드 이미지 영역을 보이도록 설정
				document.getElementById("qrCodeArea").style.display = "block";

			} else {
				alert("QR코드 오류");
			}
			return false; // 폼 기본 제출 방지 (필요한 경우, 현재는 form 태그 제거했으므로 불필요)
		}

		displayQrCode();
	</script>

</body>
</html>