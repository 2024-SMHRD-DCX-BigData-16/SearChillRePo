<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Free HTML5 Website Template by FreeHTML5.co" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
<meta name="author" content="FreeHTML5.co" />

<!-- 구글 폰트 로드 -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700"
	rel="stylesheet">

<!-- CSS 파일 로드 -->
<link rel="stylesheet" href="resources/css/animate.css">
<link rel="stylesheet" href="resources/css/icomoon.css">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/flexslider.css">
<link rel="stylesheet" href="resources/css/style.css">

<!-- Modernizr JS 로드 -->
<script src="resources/js/modernizr-2.6.2.min.js"></script>


</head>
<body>

	<div id="fh5co-page">


		<!-- 네비게이션 토글 버튼 -->
		<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
		<aside id="fh5co-aside" role="complementary"
			class="border js-fullheight">
			<!-- 로고 -->
			<h1 id="fh5co-logo">
				<a href="goMain">Searchill</a>
			</h1>
			<!-- 메인 메뉴 -->
			<nav id="fh5co-main-menu" role="navigation">
				<ul>
					<li><a href="goMain">Home</a></li>
					<!-- 회원 -->
					<c:if test="${loginuser != null}">

						<li><a href="qrMain">QR코드</a></li>
						<li><a href="myLostItemNotice">내 분실물 습득 정보</a></li>
					</c:if>
					<!-- 비회원 -->
					<c:if test="${loginuser == null}">
						<li><a href="memberMain">QR코드</a></li>
						<li><a href="memberMain">내 분실물 습득 정보</a></li>
					</c:if>
					<li><a href="lostItemForm">습득물 신고(주인을 찾아줘요)</a></li>
					<li><a href="mapMain">지도</a></li>

				</ul>
			</nav>
			<!-- 푸터 -->
			<div class="fh5co-footer">
				<!-- 로그인 및 회원정보 수정 버튼 추가 -->
				<div class="fh5co-login">
					<c:if test="${loginuser == null}">
						<p>
							<a class="btn btn-primary" href="memberMain">Login</a>
						</p>
					</c:if>
					<c:if test="${loginuser != null}">
						<p>
							<a class="btn btn-primary" href="logout">Logout</a>
						</p>
						<p>
							<a class="btn btn-secondary" href="updateUser">Edit Profile</a>
						</p>
					</c:if>

				</div>

				<!-- 저작권 및 디자인 정보 -->
				<p>
					<small>&copy; 2016 Blend Free HTML5. All Rights Reserved.</span> <span>Designed
							by <a href="http://freehtml5.co/" target="_blank">FreeHTML5.co</a>
					</span> <span>Demo Images: <a href="https://unsplash.com/"
							target="_blank">Unsplash</a></span></small>
				</p>
			</div>

		</aside>


		<div id="fh5co-main">
			<div class="fh5co-narrow-content">
				<div class="row row-bottom-padded-md">
					<div class="col-md-6 animate-box" data-animate-effect="fadeInLeft">

						<!-- 내용 -->

		

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









						<!-- 내용끝 -->


						<h2 class="fh5co-heading">About Company</h2>
						<p>내용내용</p>
						<p>내용</p>
					</div>
				</div>
			</div>

			<div class="fh5co-narrow-content">
				<h2 class="fh5co-heading animate-box"
					data-animate-effect="fadeInLeft">Our Services</h2>
				<div class="row">
					<div class="col-md-6">
						<div class="fh5co-feature animate-box"
							data-animate-effect="fadeInLeft">
							<div class="fh5co-icon">
								<i class="icon-settings"></i>
							</div>
							<div class="fh5co-text">
								<h3>Strategy</h3>
								<p>텍스트</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="fh5co-feature animate-box"
							data-animate-effect="fadeInLeft">
							<div class="fh5co-icon">
								<i class="icon-search4"></i>
							</div>
							<div class="fh5co-text">
								<h3>Explore</h3>
								<p>텍스트</p>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div class="fh5co-feature animate-box"
							data-animate-effect="fadeInLeft">
							<div class="fh5co-icon">
								<i class="icon-paperplane"></i>
							</div>
							<div class="fh5co-text">
								<h3>Direction</h3>
								<p>텍스트</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="fh5co-feature animate-box"
							data-animate-effect="fadeInLeft">
							<div class="fh5co-icon">
								<i class="icon-params"></i>
							</div>
							<div class="fh5co-text">
								<h3>Expertise</h3>
								<p>텍스트</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="fh5co-narrow-content">
				<div class="row">
					<div class="col-md-4 animate-box" data-animate-effect="fadeInLeft">
						<h1 class="fh5co-heading-colored">Get in touch</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 col-md-offset-3 col-md-pull-3 animate-box"
						data-animate-effect="fadeInLeft">
						<p class="fh5co-lead">ㄱㄴㄷㄹㅁㅂ</p>
						<p>
							<a href="#" class="btn btn-primary">Learn More</a>
						</p>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- jQuery 로드 -->
	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/jquery.scrolly.min.js"></script>
	<script src="resources/js/jquery.scrollex.min.js"></script>
	<script src="resources/js/skel.min.js"></script>
	<script src="resources/js/util.js"></script>
	<!-- jQuery Easing 로드 -->
	<script src="resources/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap 로드 -->
	<script src="resources/js/bootstrap.min.js"></script>
	<!-- Waypoints 로드 -->
	<script src="resources/js/jquery.waypoints.min.js"></script>
	<!-- Flexslider 로드 -->
	<script src="resources/js/jquery.flexslider-min.js"></script>

	<!-- 메인 JS 로드 -->
	<script src="resources/js/main.js"></script>
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