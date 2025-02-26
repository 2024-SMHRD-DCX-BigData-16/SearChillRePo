							//input �±׿� ������ ��� ���� �±� 
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

							// object_loc.value = �ּҸ�;

							var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
							mapOption = {
								center : new kakao.maps.LatLng(37.566826,
										126.9786567), // ������ �߽���ǥ
								level : 4
							// ������ Ȯ�� ����
							};

							//HTML5�� geolocation���� ����� �� �ִ��� Ȯ���մϴ� 
							if (navigator.geolocation) {
								// GeoLocation�� �̿��ؼ� ���� ��ġ�� ���ɴϴ�
								navigator.geolocation
										.getCurrentPosition(function(position) {
											lat = position.coords.latitude, // ����
											lon = position.coords.longitude; // �浵

											var locPosition = new kakao.maps.LatLng(
													lat, lon); // ���� ��ġ ��ǥ

											console.log(lat);
											console.log(lon);

											var message = 'Ŭ���� ��ġ�� ������ ' + lat
													+ ' �̰�, ';
											message += '�浵�� ' + lon + ' �Դϴ�';

											// ����, �浵 ��ǲ �±׿� �� �ֱ�
											object_scan_loc_lat.value = lat;
											object_scan_loc_lon.value = lon;
											getAddressFromCoords(lat, lon,
													"scan");

											// ���� �߽��� ���� ��ġ�� ����
											map.setCenter(locPosition);
										});
							}

							//������ �����մϴ�    
							var map = new kakao.maps.Map(mapContainer,
									mapOption);

							var marker = new kakao.maps.Marker({
								// ���� �߽���ǥ�� ��Ŀ�� �����մϴ� 
								position : map.getCenter()
							});

							// ������ ��Ŀ�� ǥ���մϴ�
							marker.setMap(map);

							kakao.maps.event.addListener(map, 'click',
									function(mouseEvent) {
										// Ŭ���� ����, �浵 ������ �����ɴϴ� 
										var latlng = mouseEvent.latLng;

										// ��Ŀ ��ġ�� Ŭ���� ��ġ�� �ű�ϴ�
										marker.setPosition(latlng);

										var message = 'Ŭ���� ��ġ�� ������ '
												+ latlng.getLat() + ' �̰�, ';
										message += '�浵�� ' + latlng.getLng()
												+ ' �Դϴ�';

										lat = latlng.getLat();
										lon = latlng.getLng();

										// ����, �浵 ��ǲ �±׿� �� �ֱ�
										object_keeping_place_lat.value = lat;
										object_keeping_place_lon.value = lon;
										getAddressFromCoords(lat, lon,
												'keeping');

									});

							//��ġ ��ǥ�� ���� �ּ� ���� ǥ�� �Լ�
							var geocoder = new kakao.maps.services.Geocoder();

							// Ÿ�� �Ķ���ͷ� ��ĵ ���, ���� ��� ���� scan, keeping
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
																.log("�ּҸ� ������ �� �����ϴ�.");
													}
												});
							}

							// ��ġ ��ǥ�� ���� �ּ� ���� ǥ�� ��

							//���� Ÿ�� ���� ��Ʈ���� �����Ѵ�
							var mapTypeControl = new kakao.maps.MapTypeControl();
							//������ ��� ������ ���� Ÿ�� ���� ��Ʈ���� �߰��Ѵ�
							map.addControl(mapTypeControl,
									kakao.maps.ControlPosition.TOPRIGHT);
							//������ Ȯ�� ��� ��Ʈ���� �����Ѵ�
							var zoomControl = new kakao.maps.ZoomControl();
							//������ ������ Ȯ�� ��� ��Ʈ���� �߰��Ѵ�
							map.addControl(zoomControl,
									kakao.maps.ControlPosition.RIGHT);
