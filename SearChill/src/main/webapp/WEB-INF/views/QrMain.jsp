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

	<div id="qrCodeArea" style="display: none;">
		<img id="qrImage" src="" alt="QR 코드 이미지" />
		<div>
			<a id="down_btn_img" href="" download="qrcode.png"><button>QR코드
					다운로드 (원본)</button></a>
		</div>
	</div>
	
	<hr style="border: 1px dashed #d3d3d3; margin: 20px 0;">
	<h2>QR코드 스티커</h2>

	<canvas id="myCanvas" width="130" height="130"
		style="border: 1px solid #d3d3d3;">
        Your browser does not support the canvas element.
	</canvas>
	<div>
		<a id="down_btn_canvas" href="" download="qrcode_combined.png"><button>QR코드
				다운로드 (스티커)</button></a>
	</div>

	<hr style="border: 1px dashed #d3d3d3; margin: 20px 0;">

	<h2>명함 사이즈 QR코드</h2>

	<div style="display: none">
		<div id="qrCodeArea_card" style="display: none;">
			<img id="qrImage_card" src="" alt="명함 사이즈 QR 코드 이미지" />
			<div>
				<a id="down_btn_img_card" href="" download="qrcode_card.png"><button>QR코드
						다운로드 (원본)</button></a>
				<%-- id 에 _card 접미사 추가 --%>
			</div>
		</div>
	</div>

	<canvas id="myCanvas_card" width="360" height="200"
		<%-- id 에 _card 접미사 추가, 명함 사이즈 캔버스 크기 설정 --%>
		style="border: 1px solid #d3d3d3;">
        Your browser does not support the canvas element.
	</canvas>
	<div>
		<a id="down_btn_canvas_card" href=""
			download="qrcode_combined_card.png"><button>QR코드 다운로드
				(명함)</button></a>
		<%-- id 에 _card 접미사 추가 --%>
	</div>

	<script>
		function displayQrCode() {
			// QR 코드 생성 
			var url = document.getElementById("url").value;
			if (url) {
				var qrCodeImageUrl = "/controller/qrMake?url="
						+ encodeURIComponent(url);

				document.getElementById("qrImage").src = qrCodeImageUrl;
				document.getElementById("down_btn_img").href = qrCodeImageUrl;
				document.getElementById("qrCodeArea").style.display = "block";


				var centerImage;
				var canvas = document.getElementById("myCanvas");
				var context = canvas.getContext("2d");
				var backgroundImage = new Image();
				centerImage = new Image();

				backgroundImage.onload = function() {
					context.drawImage(backgroundImage, 0, 0, canvas.width,
							canvas.height);

					centerImage.onload = function() {
						// 중심 이미지 크기를 3/5로 축소 (기존 2/3 에서 3/5 로 변경)
						var centerImageWidth = centerImage.width * (3/5);
						var centerImageHeight = centerImage.height * (3/5);

						var centerX = (canvas.width - centerImageWidth) / 2;
						var centerY = (canvas.height - centerImageHeight) / 2;
						context.drawImage(centerImage, centerX, centerY, centerImageWidth, centerImageHeight);

						var canvasDataUrl = canvas.toDataURL("image/png");
						document.getElementById("down_btn_canvas").href = canvasDataUrl;

					};
					centerImage.src = qrCodeImageUrl;
				};
				backgroundImage.src = "./resources/images/안내문구.png";


			} else {
				alert("QR코드 오류");
			}
			return false;
		}

		
		function displayQrCodeCard() {  // 명함 사이즈 QR 코드 생성 함수 
			var url = document.getElementById("url").value;
			if (url) {
				var qrCodeImageUrl = "/controller/qrMake?url="
						+ encodeURIComponent(url);

				document.getElementById("qrImage_card").src = qrCodeImageUrl;  
				document.getElementById("down_btn_img_card").href = qrCodeImageUrl;
				document.getElementById("qrCodeArea_card").style.display = "block";


				var centerImageCard;  
				var canvasCard = document.getElementById("myCanvas_card"); 
				var contextCard = canvasCard.getContext("2d"); 
				var backgroundImageCard = new Image();  
				centerImageCard = new Image();  

				backgroundImageCard.onload = function() {
					contextCard.drawImage(backgroundImageCard, 0, 0, canvasCard.width,  // 변수명 수정: contextCard, canvasCard
							canvasCard.height);

					centerImageCard.onload = function() {
						// 중심 이미지 크기를 명함 사이즈에 맞춰 조절 (예: 1/2 크기로 축소)
						var centerImageWidth = centerImageCard.width *(4/5);
						var centerImageHeight = centerImageCard.height *(4/5);

						// QR 코드를 캔버스 왼쪽에 거의 붙여서 배치 (centerX 값을 조정)
						var centerX = canvasCard.width - centerImageWidth - 20; // 오른쪽 여백 10px (원하는 여백 값으로 조절 가능)
						
						var centerY = (canvasCard.height - centerImageHeight) / 2; // 세로 중앙 정렬 유지
						centerY = centerY - 20;
						contextCard.drawImage(centerImageCard, centerX, centerY, centerImageWidth, centerImageHeight);

						var canvasDataUrl = canvasCard.toDataURL("image/png");
						document.getElementById("down_btn_canvas_card").href = canvasDataUrl;

					};
					centerImageCard.src = qrCodeImageUrl;
				};
				backgroundImageCard.src = "./resources/images/명함배경.png"; 


			} else {
				alert("QR코드 오류");
			}
			return false;
		}

		displayQrCode();  // 기존 QR 코드 생성 함수 호출
		displayQrCodeCard();  // 명함 사이즈 QR 코드 생성 함수 호출 (새로 추가)

	</script>


</body>
</html>