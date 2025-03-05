var mapContainer = document.getElementById('map');
var mapOption = {
    center : new kakao.maps.LatLng(37.566826, 126.9786567),
    level : 7
};

var map = new kakao.maps.Map(mapContainer, mapOption);

if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
        var lat = position.coords.latitude;
        var lon = position.coords.longitude;

        var locPosition = new kakao.maps.LatLng(lat, lon);
        map.setCenter(locPosition);
    });
}

var geocoder = new kakao.maps.services.Geocoder();
var marker = new kakao.maps.Marker();
var infowindow = new kakao.maps.InfoWindow({
    zindex : 1
});

searchAddrFromCoords(map.getCenter(), displayCenterInfo);

kakao.maps.event.addListener(map, 'idle', function() {
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
});

function searchAddrFromCoords(coords, callback) {
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
}

function searchDetailAddrFromCoords(coords, callback) {
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

function displayCenterInfo(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        var infoDiv = document.getElementById('centerAddr');
        for (var i = 0; i < result.length; i++) {
            if (result[i].region_type === 'H') {
                infoDiv.innerHTML = result[i].address_name;
                var addressParts = result[i].address_name.split(' ');
                var shortAddress = addressParts.slice(0, 2).join(' ');
                document.getElementById("roadAddress").value = shortAddress;

                searchDetailAddrFromCoords(
                        map.getCenter(),
                        function(result, status) {
                            if (status === kakao.maps.services.Status.OK) {
                                var jibunAddr = result[0].address.address_name;
                                var jibunShortAddr = jibunAddr.split(' ').slice(0, 2).join(' ');
                                document.getElementById("jibunAddress").value = jibunShortAddr;
                            }
                        });
                break;
            }
        }
    }
}

var mapTypeControl = new kakao.maps.MapTypeControl();
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);


var markerData = null;
var currentInfowindow = null;
var lostItemClusterer = new kakao.maps.MarkerClusterer({ map: map });

$.ajax({
    url: "lostitemList",
    type: "get",
    success: (res) => {
        markerData = res;
        var lostItemMarkers = $(markerData).map(function(i, item) {
            var markerLat = parseFloat(item.object_keeping_place_lat);
            var markerLon = parseFloat(item.object_keeping_place_lon);

            if (!isNaN(markerLat) && !isNaN(markerLon) && markerLon !== 180) {
                var markerPosition = new kakao.maps.LatLng(markerLat, markerLon);
                var marker = new kakao.maps.Marker({
                    position: markerPosition,
                });

                var infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="color:black;padding:5px;font-size:12px; width:200px; height:250px; ">' +
                    '<strong>물품명:</strong> ' + (item.object_name || "이름 없음") + '<br>' +
                    '<strong>보관 장소:</strong> ' + (item.object_keeping_place || "정보 없음") + '<br>' +
                    '<strong>장소 상세:</strong> ' + (item.object_keeping_place_info || "정보 없음") + '<br>' +
                    '<strong>습득 일시:</strong> ' + (item.object_date || "정보 없음") + '<br>' +
                    '<strong>사진:</strong> ' + (item.object_photo ? '<img src="./resources/objectImages/' + item.object_photo + '" width="100" height="100" >  ' : "사진 없음") + '<br>' +
                    '<strong>메시지:</strong> ' + (item.notice_msg || "없음") +
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
                return null;
            }
        }).get();
        lostItemClusterer.addMarkers(lostItemMarkers);
    },
    error: (err) => {
        alert(err);
    },
});