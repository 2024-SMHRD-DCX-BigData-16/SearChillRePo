<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Free HTML5 Website Template by FreeHTML5.co" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
<meta name="author" content="FreeHTML5.co" />

<!-- ���� ��Ʈ �ε� -->

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css">

<!-- CSS ���� �ε� -->
<link rel="stylesheet" href="resources/css/animate.css">
<link rel="stylesheet" href="resources/css/icomoon.css">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/flexslider.css">
<link rel="stylesheet" href="resources/css/style.css">

<!-- Modernizr JS �ε� -->
<script src="resources/js/modernizr-2.6.2.min.js"></script>


</head>
<body>

	<div id="fh5co-page">


		<!-- �׺���̼� ��� ��ư -->
		<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
		<aside id="fh5co-aside" role="complementary"
			class="border js-fullheight">
			<!-- �ΰ� -->
			<h1 id="fh5co-logo">
				<a href="goMain"> <img
					src="<c:url value='/resources/images/searchill.png' />"
					alt="Searchill �ΰ�" style="width: 250px; height: auto;">
				</a>
			</h1>

			<!-- ���� �޴� -->
			<nav id="fh5co-main-menu" role="navigation">
				<ul>
					<!-- <li class="fh5co-active"> -->
					<li><a href="goMain" class="menu-btn">Home</a></li>

					<!-- ȸ�� -->
					<c:if test="${loginuser != null}">

						<li><a href="qrMain" class="menu-btn">QR�ڵ�</a></li>
						<li><a href="myLostItemNotice" class="menu-btn">�� �нǹ� ����
								����</a></li>
					</c:if>
					<!-- ��ȸ�� -->
					<c:if test="${loginuser == null}">
						<li><a href="memberMain" class="menu-btn">QR�ڵ�</a></li>
						<li><a href="memberMain" class="menu-btn">�� �нǹ� ���� ����</a></li>
					</c:if>
					<li><a href="lostItemForm" class="menu-btn">���湰 �Ű�</a></li>
					<li><a href="mapMain" class="menu-btn">����</a></li>

				</ul>
			</nav>
			<!-- Ǫ�� -->
			<div class="fh5co-footer">
				<!-- �α��� �� ȸ������ ���� ��ư �߰� -->
				<div class="fh5co-login">
					<c:if test="${loginuser != null}">
						<p>
							<a class="btn btn-primary" href="logout">Logout</a>
						</p>
					</c:if>
				</div>
				<!-- ���۱� �� ������ ���� -->
<!-- 				<p>
					<small>&copy; 2016 Blend Free HTML5. All Rights Reserved.</span> <span>Designed
							by <a href="http://freehtml5.co/" target="_blank">FreeHTML5.co</a>
					</span> <span>Demo Images: <a href="https://unsplash.com/"
							target="_blank">Unsplash</a></span></small>
				</p>
 -->			</div>

		</aside>


		<div id="fh5co-main">
			<div class="fh5co-narrow-content">
				<div class="row row-bottom-padded-md">
					<div class="animate-box" data-animate-effect="fadeInLeft">

						<!-- ���� -->



						<div>
							<nav>
								<ul>
									<li><h1>${loginuser.mem_id}ȯ���մϴ�!</h1></li>
									<li>ȸ�������� �����մϴ�.</li>

									<li><button onclick='location.href="memberMain"'>login
											go</button></li>
								</ul>
							</nav>
						</div>





						<!-- ���볡 -->


<br><br><br><br><br><br><br><br><br>

					</div>
				</div>
			</div>


		</div>
	</div>

	<!-- jQuery �ε� -->
	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/jquery.scrolly.min.js"></script>
	<script src="resources/js/jquery.scrollex.min.js"></script>
	<script src="resources/js/skel.min.js"></script>
	<script src="resources/js/util.js"></script>
	<!-- jQuery Easing �ε� -->
	<script src="resources/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap �ε� -->
	<script src="resources/js/bootstrap.min.js"></script>
	<!-- Waypoints �ε� -->
	<script src="resources/js/jquery.waypoints.min.js"></script>
	<!-- Flexslider �ε� -->
	<script src="resources/js/jquery.flexslider-min.js"></script>

	<!-- ���� JS �ε� -->
	<script src="resources/js/main.js"></script>


</body>

</html>