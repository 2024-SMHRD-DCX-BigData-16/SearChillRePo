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

