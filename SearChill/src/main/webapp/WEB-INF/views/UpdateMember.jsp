<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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

						<div id="wrapper">
							<!-- Menu -->
							<nav id="Update">
								<ul class="actions vertical">
									<li><h5>회원정보수정</h5></li>
									<form action="UpdateMember" method="post">
										<li>접속한 ID : ${loginuser.mem_id}</li>


										<li><input type="email" name="mem_email"
											value="${loginuser.mem_email}" placeholder="이메일을 입력하세요"
											required></li>


										<li><input type="password" name="mem_pw"
											placeholder="PW를 입력하세요" required></li>


										<li><input type="text" name="mem_name"
											value="${loginuser.mem_name}" placeholder="이름을 입력하세요"
											required></li>


										<li><input type="text" name="mem_phone"
											value="${loginuser.mem_phone}" placeholder="전화번호를 입력하세요"
											required></li>


										<li><label>연락처 공개 여부:</label><br> <input
											type="radio" id="open" name="mem_phone_open" value="1"
											${loginuser.mem_phone_open == '1' ? 'checked' : ''}>
											공개 <input type="radio" id="close" name="mem_phone_open"
											value="0" ${loginuser.mem_phone_open == '0' ? 'checked' : ''}>
											비공개</li>

										<!-- 수정 버튼 -->
										<li><input type="submit" value="회원정보 수정"
											class="button fit"></li>
									</form>
								</ul>
							</nav>
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


</body>

</html>