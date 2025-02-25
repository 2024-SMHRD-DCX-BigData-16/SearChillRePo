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
						<nav id="menu">
							<ul class="actions vertical">
								<form action="memberInsert" method="post">
									<li><input type="text" id="inputID"
										placeholder="ID를 입력하세요" name="mem_id"></li>
									<li><input type="button" value="ID 중복체크"
										onclick="IDCheck()"></li>
									<li><span id="resultCheck"></span></li>

									<li><input type="password" placeholder="PW를 입력하세요"
										name="mem_pw"></li>
									<li><input type="text" placeholder="전화번호를 입력하세요"
										name="mem_phone"></li>
									<li><input type="text" placeholder="이름을 입력하세요"
										name="mem_name"></li>
									<li><input type="text" id="inputEmail"
										placeholder="Email을 입력하세요" name="mem_email"></li>
									<li><label>연락처 공개 여부</label><br> <input type="radio"
										name="mem_phone_open" value="1"> O <input type="radio"
										name="mem_phone_open" value="0" checked> X</li>

									<li><input type="submit" value="회원가입" class="button fit"></li>
								</form>
							</ul>
						</nav>

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




	<form action="">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Name">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Email">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Phone">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<textarea name="" id="message" cols="30" rows="7"
								class="form-control" placeholder="Message"></textarea>
						</div>
						<div class="form-group">
							<input type="submit" class="btn btn-primary btn-md"
								value="Send Message">
						</div>
					</div>

				</div>
	</form>













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
						$('#resultCheck').text('사용할 수 있는 아이디');
					} else {
						$('#resultCheck').text('사용할 수 없는 아이디');
					}
				},
				error : function() {
					alert("통신 실패!!");
				}
			});
		}
	</script>

</body>
</html>