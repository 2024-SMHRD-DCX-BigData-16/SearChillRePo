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
<link rel="stylesheet" href="../resources/css/animate.css">
<link rel="stylesheet" href="../resources/css/icomoon.css">
<link rel="stylesheet" href="../resources/css/bootstrap.css">
<link rel="stylesheet" href="../resources/css/flexslider.css">
<link rel="stylesheet" href="../resources/css/style.css">

<!-- Modernizr JS 로드 -->
<script src="../resources/js/modernizr-2.6.2.min.js"></script>

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


		<div id="fh5co-main">
			<div class="fh5co-narrow-content">
				<div class="row row-bottom-padded-md">
					<div class="animate-box" data-animate-effect="fadeInLeft">

						<!-- 내용 -->

						<h2>습득물 등록</h2>
						📢 빠른 전달을 위해 최대한 정확한 정보를 입력해 주시면 더욱 도움이 됩니다! 당신의 선한 행동이 큰 힘이 됩니다.
						감사합니다! 😊✨

						<!-- 자동등록 : 분실물 고유번호 object_idx, QR 고유번호 qr_idx, 분실물 스캔 날짜 object_date-->

						<form action="saveLostItem" method="post"
							enctype="multipart/form-data">

							<table border="1">

								<tr>
									<td width="128px">분실물 명:</td>
									<td><input type="text" name="object_name"
										class="form-control" placeholder="ex)지갑, 에어팟"></td>
								</tr>
								<tr>
									<td>분실물 사진:</td>
									<!-- <td><input type="text" name="object_photo"></td> -->
									<td><input type="file" name="object_photo"
										class="form-control"></td>
								</tr>
								<tr>
									<td>메시지:</td>
									<td><textarea name="notice_msg" class="form-control"
											placeholder="분실자에게 전할 메세지&#13;&#10;ex)OO경찰서에 맡겼습니다.&#13;&#10;습득자 연락처:010-0000-0000"
											style="height: 200px;"></textarea></td>
								</tr>
								<tr>
									<td>보관 장소:</td>
									<td><input type="text" id="object_keeping_place"
										class="form-control" name="object_keeping_place"
										placeholder="지도를 클릭해주세요" readonly="readonly"></td>
								</tr>
								<tr>
								<td colspan="2">
										<div class="map_wrap">
							<div id="map"
								style="width: 100%; height: 300px; position: relative; overflow: hidden;">
							</div>
						</div>
								
								</td>
								
								</tr>
								<tr>
									<td>보관 장소 상세 설명:
									<td><input type="text" id="object_keeping_place_info"
										class="form-control" name="object_keeping_place_info"
										placeholder="ex)1층 CU에 맡김"></td>
								</tr>
								<tr style="display: none">
									<td>
										<!-- 숨길 인풋 태그 -->
										<div style="display: none">
											<input type="text" id="object_scan_loc_lat"
												name="object_scan_loc_lat" placeholder="획득위도" value="0"
												readonly="readonly"> <input type="text"
												id="object_scan_loc_lon" name="object_scan_loc_lon"
												placeholder="획득경도" value="180" readonly="readonly">
											<input type="text" id="object_scan_loc"
												name="object_scan_loc" placeholder="획득주소"
												readonly="readonly"> <input type="text"
												id="object_keeping_place_lat"
												name="object_keeping_place_lat" placeholder="보관위도" value="0"
												readonly="readonly"> <input type="text"
												id="object_keeping_place_lon"
												name="object_keeping_place_lon" placeholder="보관경도"
												value="180" readonly="readonly">


											<c:if test="${not empty param.mem_id}">
												<%
												/* mem_id가 null 문자열로 들어가는 경우 admin으로 받음 */
												String submitMem_id = request.getParameter("mem_id");
												if (request.getParameter("mem_id").equals("null")) {
													submitMem_id = "admin";
												}
												%>
												<input type="text" id="mem_id" name="mem_id"
													value="<%=submitMem_id%>">

											</c:if>

										</div>


									</td>

								</tr>
								<tr>
									<td colspan="2" align="center"><input type="submit"
										value="습득물 등록" class="btn btn-primary btn-md"></td>
								</tr>
							</table>

						</form>


						<!-- 내용끝 -->

<br><br><br><br><br><br><br><br><br><br><br>

					</div>
				</div>
			</div>


		</div>
	</div>

	<!-- jQuery 로드 -->
	<script src="../resources/js/jquery.min.js"></script>
	<script src="../resources/js/jquery.scrolly.min.js"></script>
	<script src="../resources/js/jquery.scrollex.min.js"></script>
	<script src="../resources/js/skel.min.js"></script>
	<script src="../resources/js/util.js"></script>
	<!-- jQuery Easing 로드 -->
	<script src="../resources/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap 로드 -->
	<script src="../resources/js/bootstrap.min.js"></script>
	<!-- Waypoints 로드 -->
	<script src="../resources/js/jquery.waypoints.min.js"></script>
	<!-- Flexslider 로드 -->
	<script src="../resources/js/jquery.flexslider-min.js"></script>

	<!-- 메인 JS 로드 -->
	<script src="../resources/js/main.js"></script>

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

						<script type="text/javascript"
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=73f10e0ecb2825848d7a1578ec6ca978&libraries=services,clusterer,drawing"></script>
						<script>
							//input 태그에 정보를 담기 위한 태그 
							var object_scan_loc_lat = document
									.getElementById('object_scan_loc_lat');
							var object_scan_loc_lon = document
									.getElementById('object_scan_loc_lon');
							var object_keeping_place_lat = document
									.getElementById('object_keeping_place_lat');
							var object_keeping_place_lon = document
									.getElementById('object_keeping_place_lon');

							var object_scan_loc = document
									.getElementById('object_scan_loc');
							var object_keeping_place = document
									.getElementById('object_keeping_place');
							var lat = null;
							var lon = null;

							// object_loc.value = 주소명;

							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							mapOption = {
								center : new kakao.maps.LatLng(37.566826,
										126.9786567), // 지도의 중심좌표
								level : 4
							// 지도의 확대 레벨
							};

							//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
							if (navigator.geolocation) {
								// GeoLocation을 이용해서 접속 위치를 얻어옵니다
								navigator.geolocation
										.getCurrentPosition(function(position) {
											lat = position.coords.latitude, // 위도
											lon = position.coords.longitude; // 경도

											var locPosition = new kakao.maps.LatLng(
													lat, lon); // 접속 위치 좌표

											console.log(lat);
											console.log(lon);

											var message = '클릭한 위치의 위도는 ' + lat
													+ ' 이고, ';
											message += '경도는 ' + lon + ' 입니다';

											// 위도, 경도 인풋 태그에 값 넣기
											object_scan_loc_lat.value = lat;
											object_scan_loc_lon.value = lon;
											getAddressFromCoords(lat, lon,
													"scan");

											// 지도 중심을 접속 위치로 변경
											map.setCenter(locPosition);
										});
							}

							//지도를 생성합니다    
							var map = new kakao.maps.Map(mapContainer,
									mapOption);

							var marker = new kakao.maps.Marker({
								// 지도 중심좌표에 마커를 생성합니다 
								position : map.getCenter()
							});

							// 지도에 마커를 표시합니다
							marker.setMap(map);

							kakao.maps.event.addListener(map, 'click',
									function(mouseEvent) {
										// 클릭한 위도, 경도 정보를 가져옵니다 
										var latlng = mouseEvent.latLng;

										// 마커 위치를 클릭한 위치로 옮깁니다
										marker.setPosition(latlng);

										var message = '클릭한 위치의 위도는 '
												+ latlng.getLat() + ' 이고, ';
										message += '경도는 ' + latlng.getLng()
												+ ' 입니다';

										lat = latlng.getLat();
										lon = latlng.getLng();

										// 위도, 경도 인풋 태그에 값 넣기
										object_keeping_place_lat.value = lat;
										object_keeping_place_lon.value = lon;
										getAddressFromCoords(lat, lon,
												'keeping');

									});

							//위치 좌표에 대한 주소 정보 표시 함수
							var geocoder = new kakao.maps.services.Geocoder();

							// 타입 파라미터로 스캔 장소, 보관 장소 구분 scan, keeping
							function getAddressFromCoords(latitude, longitude,
									type) {
								geocoder
										.coord2Address(
												longitude,
												latitude,
												function(result, status) {
													if (status === kakao.maps.services.Status.OK) {
														if (type === "scan") {
															object_scan_loc.value = result[0].address.address_name;
															console
																	.log(result[0].address.address_name);
														} else if (type === "keeping") {
															object_keeping_place.value = result[0].address.address_name;
															console
																	.log(result[0].address.address_name);
														}
													} else {
														console
																.log("주소를 가져올 수 없습니다.");
													}
												});
							}

							// 위치 좌표에 대한 주소 정보 표시 끝

							//지도 타입 변경 컨트롤을 생성한다
							var mapTypeControl = new kakao.maps.MapTypeControl();
							//지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
							map.addControl(mapTypeControl,
									kakao.maps.ControlPosition.TOPRIGHT);
							//지도에 확대 축소 컨트롤을 생성한다
							var zoomControl = new kakao.maps.ZoomControl();
							//지도의 우측에 확대 축소 컨트롤을 추가한다
							map.addControl(zoomControl,
									kakao.maps.ControlPosition.RIGHT);
						</script>

</body>
</html>