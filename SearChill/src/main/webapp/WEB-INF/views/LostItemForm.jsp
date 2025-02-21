<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <h2>분실물 등록</h2>
	<div>입력 데이터는 분실자에게 전송됩니다.</div>
<!-- 자동등록 : 분실물 고유번호 object_idx, QR 고유번호 qr_idx, 분실물 스캔 날짜 object_date-->

<form action="saveLostItem" method="post">
	
	        <table border="1">
            <tr>
                <td>분실물 명:</td>
                <td><input type="text" name="object_name" placeholder="ex)지갑, 에어팟"></td>
            </tr>
            <tr>
                <td>분실물 사진 (URL):</td>
                <td><input type="text" name="object_photo"></td>
            </tr>
            <tr>
                <td>알림 메시지:</td>
                <td><textarea name="notice_msg" placeholder="ex)OO경찰서에 맡겼습니다. 습득자 연락처:010-0000-0000"></textarea></td>
            </tr>   
            <tr>
            <td>보관 장소: </td>
				<td>
            		<input type="text" id="object_keeping_place" name="object_keeping_place"
            		 placeholder="지도를 클릭해주세요" readonly="readonly"> 
				</td>            
            </tr>
            <tr>
            <td>보관 장소 상세 설명: 
				<td>
					<input type="text" id="object_keeping_place_info"
					 name="object_keeping_place_info" placeholder="ex)1층 CU에 맡김">
				</td>            
            </tr>
             
        </table>
		<!-- 숨길 인풋 태그 -->
	<div >
	<input type="text" id="object_scan_loc_lat" name="object_scan_loc_lat"
			placeholder="획득위도" value="0" readonly="readonly">
	<input type="text" id="object_scan_loc_lon" name="object_scan_loc_lon"
			placeholder="획득경도" value="180" readonly="readonly">
	<input type="text" id="object_scan_loc" name="object_scan_loc"
		placeholder="획득주소" readonly="readonly"> 
	<input type="text" id="object_keeping_place_lat" name="object_keeping_place_lat"
			placeholder="보관위도" value="0" readonly="readonly">
	<input type="text" id="object_keeping_place_lon" name="object_keeping_place_lon"
			placeholder="보관경도" value="180" readonly="readonly">
	<c:if test="${not empty param.mem_id}">
	<input type="text" id="mem_id" name="mem_id" value="<%= request.getParameter("mem_id") %>">
	</c:if>
	
	
	</div>
		
<input type="submit" value="위도경도주소 등록">
</form>



	<div class="map_wrap">
		<div id="map"
			style="width: 350px; height: 300px; position: relative; overflow: hidden;">
		</div>
 	</div>



	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=73f10e0ecb2825848d7a1578ec6ca978&libraries=services,clusterer,drawing"></script>
	<script>
		
	    //input 태그에 정보를 담기 위한 태그 
		var object_scan_loc_lat = document.getElementById('object_scan_loc_lat'); 
		var object_scan_loc_lon = document.getElementById('object_scan_loc_lon'); 
		var object_keeping_place_lat = document.getElementById('object_keeping_place_lat'); 
		var object_keeping_place_lon = document.getElementById('object_keeping_place_lon'); 

		
		var object_scan_loc = document.getElementById('object_scan_loc');
		var object_keeping_place = document.getElementById('object_keeping_place');
		var lat = null;
		var lon = null;
	
		
		// object_loc.value = 주소명;
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 4
		// 지도의 확대 레벨
		};

		

		//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {
			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {
				lat = position.coords.latitude, // 위도
				lon = position.coords.longitude; // 경도


				var locPosition = new kakao.maps.LatLng(lat, lon); // 접속 위치 좌표
				
				console.log(lat);
				console.log(lon);

			    var message = '클릭한 위치의 위도는 ' + lat + ' 이고, ';
			    message += '경도는 ' + lon + ' 입니다';
		    
			    // 위도, 경도 인풋 태그에 값 넣기
			    object_scan_loc_lat.value = lat;
			    object_scan_loc_lon.value = lon;
		        getAddressFromCoords(lat, lon, "scan");

			    
			    // 지도 중심을 접속 위치로 변경
				map.setCenter(locPosition);
			});
		}

		
		
		//지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		
		var marker = new kakao.maps.Marker({ 
		    // 지도 중심좌표에 마커를 생성합니다 
		    position: map.getCenter() 
		}); 
		
		// 지도에 마커를 표시합니다
		marker.setMap(map);

		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {           
	    // 클릭한 위도, 경도 정보를 가져옵니다 
	    var latlng = mouseEvent.latLng; 
	    
	    
	    // 마커 위치를 클릭한 위치로 옮깁니다
	    marker.setPosition(latlng);
	    
	    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
	    message += '경도는 ' + latlng.getLng() + ' 입니다';
	    
	    lat = latlng.getLat();
	    lon = latlng.getLng();
	    
	    // 위도, 경도 인풋 태그에 값 넣기
	    object_keeping_place_lat.value = lat;
	    object_keeping_place_lon.value = lon;
	    getAddressFromCoords(lat, lon, 'keeping');
		
	});
		

	    //위치 좌표에 대한 주소 정보 표시 함수
		var geocoder = new kakao.maps.services.Geocoder();
	    
	    // 타입 파라미터로 스캔 장소, 보관 장소 구분 scan, keeping
		function getAddressFromCoords(latitude, longitude, type) {
		    geocoder.coord2Address(longitude, latitude, function(result, status) {
		        if (status === kakao.maps.services.Status.OK) {
		            if (type === "scan") {
		                object_scan_loc.value = result[0].address.address_name;
		                console.log(result[0].address.address_name);
		            } else if (type === "keeping") {
		                object_keeping_place.value = result[0].address.address_name;
		                console.log(result[0].address.address_name);
		            }
		        } else {
		            console.log("주소를 가져올 수 없습니다.");
		        }
		    });
		}
		
	    // 위치 좌표에 대한 주소 정보 표시 끝
	

		//지도 타입 변경 컨트롤을 생성한다
		var mapTypeControl = new kakao.maps.MapTypeControl();
		//지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		//지도에 확대 축소 컨트롤을 생성한다
		var zoomControl = new kakao.maps.ZoomControl();
		//지도의 우측에 확대 축소 컨트롤을 추가한다
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	</script>




</body>
</html>