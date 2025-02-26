<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지도</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Free HTML5 Website Template by FreeHTML5.co" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
<meta name="author" content="FreeHTML5.co" />

<!-- 구글 폰트 로드 -->

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css">
<style>
map_wrap {
	justify-content: center top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 100%;
	height: 350px;
}
</style>
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
         class="border js-fullheight"> <!-- 로고 -->
      <h1 id="fh5co-logo">
         <a href="goMain"> <img
            src="<c:url value='/resources/images/searchill.png' />"
            alt="Searchill 로고" style="width: 250px; height: auto;">
         </a>
      </h1>

      <!-- 메인 메뉴 --> <nav id="fh5co-main-menu" role="navigation">
      <ul>
         <!-- <li class="fh5co-active"> -->
         <li><a href="goMain" class="menu-btn">Home</a></li>

         <!-- 회원 -->
         <c:if test="${loginuser != null}">

            <li><a href="qrMain" class="menu-btn">QR코드</a></li>
            <li><a href="myLostItemNotice" class="menu-btn">내 분실물 습득 정보</a></li>
         </c:if>
         <!-- 비회원 -->
         <c:if test="${loginuser == null}">
            <li><a href="memberMain" class="menu-btn">QR코드</a></li>
            <li><a href="memberMain" class="menu-btn">내 분실물 습득 정보</a></li>
         </c:if>
         <li><a href="lostItemForm" class="menu-btn">습득물 신고</a></li>
         <li><a href="mapMain" class="menu-btn">지도</a></li>

      </ul>
      </nav> <!-- 푸터 -->
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
        <!--  <p>
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
					<div class="animate-box flex-center" data-animate-effect="fadeInLeft">

						<!-- 내용 -->


						<h2>어디에서 잃어버렸나요?</h2>

						<form action="submitAddress">
							<table>
								<tr>
									<td>잃어버린 위치</td>
									<td><input type="text" id="roadAddress" name="roadAddress" class="form-control"
										placeholder="도로명 주소" readonly="readonly"></td>
								</tr>
								<tr>
									<td>물품명</td>
									<td><input type="text" id="PRDT_NM" name="PRDT_NM" class="form-control"
										placeholder="ex)지갑"></td>
								</tr>
								<tr>
								<td></td>
									<td>
										<button type="submit" class="btn btn-primary btn-md">인근 분실물 센터 조회</button>
									</td>
								</tr>
<tr>
<td colspan="2">

						<div class="map_wrap">
							<div id="map">
							</div>
							<div class="hAddr" style="display: none">
								<span class="title"></span> <span id="centerAddr"></span>
							</div>
						</div>

</td>
</tr>

							</table>


							<input type="text" id="jibunAddress" name="jibunAddress"
								placeholder="지번 주소" style="display: none;"> <input
								type="text" id="pageNo" name="pageNo" value="1"
								style="display: none;">
						</form>




						<div>한 달 이내 등록된 분실물 마커</div>




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
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=73f10e0ecb2825848d7a1578ec6ca978&libraries=services,clusterer,drawing"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 4
		// 지도의 확대 레벨
		};

		//지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {
			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {
				var lat = position.coords.latitude, // 위도
				lon = position.coords.longitude; // 경도

				var locPosition = new kakao.maps.LatLng(lat, lon); // 접속 위치 좌표

				// 지도 중심을 접속 위치로 변경
				map.setCenter(locPosition);
			});
		}

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
		infowindow = new kakao.maps.InfoWindow({
			zindex : 1
		}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);

		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', function() {
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});

		function searchAddrFromCoords(coords, callback) {
			// 좌표로 행정동 주소 정보를 요청합니다
			geocoder.coord2RegionCode(coords.getLng(), coords.getLat(),
					callback);
		}

		function searchDetailAddrFromCoords(coords, callback) {
			// 좌표로 법정동 상세 주소 정보를 요청합니다
			geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}

		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
		function displayCenterInfo(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				var infoDiv = document.getElementById('centerAddr');

				for (var i = 0; i < result.length; i++) {
					if (result[i].region_type === 'H') {
						infoDiv.innerHTML = result[i].address_name;

						var addressParts = result[i].address_name.split(' ');
						var shortAddress = addressParts.slice(0, 2).join(' '); // 도로명 주소 (ex. 서울특별시 중구)
						document.getElementById("roadAddress").value = shortAddress;

						// 추가: 화면 중심 좌표로 지번 주소 가져오기
						searchDetailAddrFromCoords(
								map.getCenter(),
								function(result, status) {
									if (status === kakao.maps.services.Status.OK) {
										var jibunAddr = result[0].address.address_name;
										var jibunShortAddr = jibunAddr.split(
												' ').slice(0, 2).join(' '); // 지번 주소 (ex. 서울 중구)
										document.getElementById("jibunAddress").value = jibunShortAddr;
									}
								});

						break;
					}
				}
			}
		}

		//지도 타입 변경 컨트롤을 생성한다
		var mapTypeControl = new kakao.maps.MapTypeControl();
		//지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		//지도에 확대 축소 컨트롤을 생성한다
		var zoomControl = new kakao.maps.ZoomControl();
		//지도의 우측에 확대 축소 컨트롤을 추가한다
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		
	 
	// 마커 추가
    var markerData = null; // lostitemList를 저장할 변수
    var currentInfowindow = null; // 현재 열려 있는 인포윈도우를 저장할 변수


 var lostItemClusterer = new kakao.maps.MarkerClusterer({ map: map });

 $.ajax({
     url: "lostitemList",
     type: "get",
     success: (res) => {
         markerData = res;

         // 유실물 마커 생성 및 클러스터러에 추가
         var lostItemMarkers = $(markerData).map(function(i, item) { // jQuery.map() 사용
             var markerLat = parseFloat(item.object_keeping_place_lat);
             var markerLon = parseFloat(item.object_keeping_place_lon);

             if (!isNaN(markerLat) && !isNaN(markerLon) && markerLon !== 180) {
                 var markerPosition = new kakao.maps.LatLng(markerLat, markerLon);

                 var marker = new kakao.maps.Marker({
                     position: markerPosition,
                 });

                 var infowindow = new kakao.maps.InfoWindow({
                     content: '<div style="padding:5px;font-size:12px; width:200px; height:250px; ">' + 
                     '<strong>물품명:</strong> ' + (item.object_name || "이름 없음") + '<br>' +
                     '<strong>보관 장소:</strong> ' + (item.object_keeping_place || "정보 없음") + '<br>' +
                     '<strong>보관 장소 설명:</strong> ' + (item.object_keeping_place_info || "정보 없음") + '<br>' +
                     '<strong>습득 일시:</strong> ' + (item.object_date || "정보 없음") + '<br>' +
/*                      '<strong>사진:</strong> ' + (item.object_photo || "사진 없음") + '<br>' +
 */                     
                     // 사진 첨부되면 바꿀 것
                  '<strong>사진:</strong> ' + (item.object_photo ? '<img src="./resources/objectImages/' + item.object_photo + '" width="100" height="100" >  ' : "사진 없음") + '<br>' +

                     '<strong>참고 메시지:</strong> ' + (item.notice_msg || "없음") +
                  '</div>'
                 });

                 kakao.maps.event.addListener(marker, 'click', function() {
                     if (currentInfowindow && currentInfowindow.getMap()) {
                         currentInfowindow.close();
                         currentInfowindow = null;
                     } else {
                         infowindow.open(map, marker);
                         currentInfowindow = infowindow;
                     }
                 });
                 return marker; 
             } else {
                 return null; // 좌표가 유효하지 않은 경우 null 반환 (마커 생성 X)
             }
         }).get(); // .get() 을 사용하여 jQuery 객체를 배열로 변환

         // 클러스터러에 마커 배열 추가 (addMarkers 사용)
         lostItemClusterer.addMarkers(lostItemMarkers);


     },
     error: (err) => {
         alert(err);
     },
 });
    
    

	</script>

</body>

</html>