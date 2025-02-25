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

<!-- ���� ��Ʈ �ε� -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700"
	rel="stylesheet">

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
				<a href="goMain">Searchill</a>
			</h1>
			<!-- ���� �޴� -->
			<nav id="fh5co-main-menu" role="navigation">
				<ul>
					<li><a href="goMain">Home</a></li>
					<!-- ȸ�� -->
					<c:if test="${loginuser != null}">

						<li><a href="qrMain">QR�ڵ�</a></li>
						<li><a href="myLostItemNotice">�� �нǹ� ���� ����</a></li>
					</c:if>
					<!-- ��ȸ�� -->
					<c:if test="${loginuser == null}">
						<li><a href="memberMain">QR�ڵ�</a></li>
						<li><a href="memberMain">�� �нǹ� ���� ����</a></li>
					</c:if>
					<li><a href="lostItemForm">���湰 �Ű�(������ ã�����)</a></li>
					<li><a href="mapMain">����</a></li>

				</ul>
			</nav>
			<!-- Ǫ�� -->
			<div class="fh5co-footer">
				<!-- �α��� �� ȸ������ ���� ��ư �߰� -->
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

				<!-- ���۱� �� ������ ���� -->
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

						<!-- ���� -->

						<div id="wrapper">
							<!-- Menu -->
							<nav id="Update">
								<ul class="actions vertical">
									<li><h5>ȸ����������</h5></li>
									<form action="UpdateMember" method="post">
										<li>������ ID : ${loginuser.mem_id}</li>


										<li><input type="email" name="mem_email"
											value="${loginuser.mem_email}" placeholder="�̸����� �Է��ϼ���"
											required></li>


										<li><input type="password" name="mem_pw"
											placeholder="PW�� �Է��ϼ���" required></li>


										<li><input type="text" name="mem_name"
											value="${loginuser.mem_name}" placeholder="�̸��� �Է��ϼ���"
											required></li>


										<li><input type="text" name="mem_phone"
											value="${loginuser.mem_phone}" placeholder="��ȭ��ȣ�� �Է��ϼ���"
											required></li>


										<li><label>����ó ���� ����:</label><br> <input
											type="radio" id="open" name="mem_phone_open" value="1"
											${loginuser.mem_phone_open == '1' ? 'checked' : ''}>
											���� <input type="radio" id="close" name="mem_phone_open"
											value="0" ${loginuser.mem_phone_open == '0' ? 'checked' : ''}>
											�����</li>

										<!-- ���� ��ư -->
										<li><input type="submit" value="ȸ������ ����"
											class="button fit"></li>
									</form>
								</ul>
							</nav>
						</div>



						<!-- ���볡 -->


						<h2 class="fh5co-heading">About Company</h2>
						<p>���볻��</p>
						<p>����</p>
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
								<p>�ؽ�Ʈ</p>
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
								<p>�ؽ�Ʈ</p>
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
								<p>�ؽ�Ʈ</p>
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
								<p>�ؽ�Ʈ</p>
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
						<p class="fh5co-lead">������������</p>
						<p>
							<a href="#" class="btn btn-primary">Learn More</a>
						</p>
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