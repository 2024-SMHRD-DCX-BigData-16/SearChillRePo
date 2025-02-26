<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Free HTML5 Website Template by FreeHTML5.co" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
<meta name="author" content="FreeHTML5.co" />

<!-- 구글 폰트 로드 -->

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css">

<!-- CSS 파일 로드 -->
<link rel="stylesheet" href="resources/css/animate.css">
<link rel="stylesheet" href="resources/css/icomoon.css">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/flexslider.css">
<link rel="stylesheet" href="resources/css/style.css">
<style type="text/css">
.ladioLabel {
	display: inline-block;
	cursor: pointer;
	height: 35px;
	width: 49%;
	border: 2px solid rgba(0, 0, 0, 0.1);
	-webkit-border-radius: 7px;
	-moz-border-radius: 7px;
	-ms-border-radius: 7px;
	border-radius: 7px;
	line-height: 34px;
	text-align: center;
	font-weight: bold;
	font-size: 25px;
	background-color: #fff;
	color: #333;
}

input[type=radio]:checked+label {
	background-color: #333;
	color: #fff;
}
</style>
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
				<a href="goMain"> <img
					src="<c:url value='/resources/images/searchill.png' />"
					alt="Searchill 로고" style="width: 250px; height: auto;">
				</a>
			</h1>

			<!-- 메인 메뉴 -->
			<nav id="fh5co-main-menu" role="navigation">
				<ul>
					<!-- <li class="fh5co-active"> -->
					<li><a href="goMain" class="menu-btn">Home</a></li>

					<!-- 회원 -->
					<c:if test="${loginuser != null}">

						<li><a href="qrMain" class="menu-btn">QR코드</a></li>
						<li><a href="myLostItemNotice" class="menu-btn">내 분실물 습득
								정보</a></li>
					</c:if>
					<!-- 비회원 -->
					<c:if test="${loginuser == null}">
						<li><a href="memberMain" class="menu-btn">QR코드</a></li>
						<li><a href="memberMain" class="menu-btn">내 분실물 습득 정보</a></li>
					</c:if>
					<li><a href="lostItemForm" class="menu-btn">습득물 신고</a></li>
					<li><a href="mapMain" class="menu-btn">지도</a></li>

				</ul>
			</nav>
			<!-- 푸터 -->
			<div class="fh5co-footer">
				<!-- 로그인 및 회원정보 수정 버튼 추가 -->
					<div class="fh5co-login">
						<c:if test="${loginuser != null}">
							<p>
								<a class="btn btn-primary" href="logout">Logout</a>
							</p>
						</c:if>
					</div>

				<!-- 저작권 및 디자인 정보 -->
<!-- 				<p>
					<small>&copy; 2016 Blend Free HTML5. All Rights Reserved.</span> <span>Designed
							by <a href="http://freehtml5.co/" target="_blank">FreeHTML5.co</a>
					</span> <span>Demo Images: <a href="https://unsplash.com/"
							target="_blank">Unsplash</a></span></small>
				</p> -->
			</div>

		</aside>


		<div id="fh5co-main">
			<div class="fh5co-narrow-content">
				<div class="row row-bottom-padded-md">
					<div class="animate-box" data-animate-effect="fadeInLeft">

						<!-- 내용 -->


						<form action="memberInsert" method="post">
							<div class="row">
								<div class="col-md-12">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<input type="text" class="form-control" id="inputID"
													placeholder="ID를 입력하세요" name="mem_id">
											</div>
											<div class="form-group">
												<input type="button" class="form-control" value="ID 중복체크"
													onclick="IDCheck()">
											</div>
											<div class="form-group">
												<input type="text" class="form-control" id="resultCheck"
													readonly="readonly">
											</div>
											<div class="form-group">
												<input type="password" class="form-control"
													placeholder="PW를 입력하세요" name="mem_pw">
											</div>
											<div class="form-group">
												<input type="text" class="form-control"
													placeholder="전화번호를 입력하세요" name="mem_phone">
											</div>
											<div class="form-group phone-open">
												<input type="text" class="form-control" id="radioMessage"
													placeholder="QR코드의 개인정보 제공 여부" readonly="readonly">
												<input type="radio" id="radioSelect" style="display: none"
													name="mem_phone_open" value="1"><label
													onclick="radioMessage1()" class="ladioLabel"
													for="radioSelect"> 공개</label> <input type="radio"
													id="radioSelect2" name="mem_phone_open" value="0"
													checked="checked" style="display: none"><label
													class="ladioLabel" for="radioSelect2"
													onclick="radioMessage2()"> 비공개</label>
											</div>

											<div class="form-group">
												<input type="text" class="form-control"
													placeholder="이름을 입력하세요" name="mem_name">
											</div>
											<div class="form-group">
												<input type="text" class="form-control" id="inputEmail"
													placeholder="Email을 입력하세요" name="mem_email">
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<input type="submit" class="btn btn-primary btn-md"
														value="회원가입">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>


						<!-- 내용끝 -->


<br><br><br><br><br><br><br><br><br>

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
	<script type="text/javascript">
		function IDCheck() {
			// 입력된 아이디 값 가져오기
			var inputID = $('#inputID').val();
			console.log(inputID);

			// 아이디 입력값이 비어있는지 체크
			if (inputID.trim() === "") {
				alert("아이디를 입력해주세요.");
				return;
			}

			// AJAX 요청 보내기
			$.ajax({
				url : 'IDCheck', // 서버 경로 확인
				data : {
					'inputID' : inputID
				}, // 전달할 데이터
				type : 'GET', // GET 방식으로 요청
				success : function(data) {
					if (data) { // 서버에서 boolean 값을 받았을 때
						$("#resultCheck").attr("placeholder", "사용할 수 있는 아이디")
					} else {
						$("#resultCheck").attr("placeholder", "사용할 수 없는 아이디")
					}
				},
				error : function() {
					alert("통신 실패!!");
				}
			});
		}
	</script>


	<script type="text/javascript">
		function radioMessage1() {
			$("#radioMessage").attr("placeholder",
					"습득자가 QR코드 스캔 시 연락처를 알 수 있습니다.")
		}
		function radioMessage2() {
			$("#radioMessage").attr("placeholder",
					"습득자가 QR코드 스캔 시 연락처를 알 수 없습니다.")
		}
	</script>
</body>
</html>