<!-- /WEB-INF/views/qrcommon/qrfh5co-aside.jsp -->
<!--
LostItemForm
PhoneCheck
QrScan -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
					<li><a href="goMain" class="menu-btn">습득물 신고</a></li>
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