<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file="/WEB-INF/views/qrcommon/qrhead.jsp" %>

<link rel="stylesheet" href="resources/css/maptable.css">
<link rel="stylesheet" href="../resources/css/maptable.css">

</head>
<body>

	<div id="fh5co-page">

		<%@ include file="/WEB-INF/views/qrcommon/qrfh5co-aside.jsp" %>

		<div id="fh5co-main">
			<div class="fh5co-narrow-content">
				<div class="row row-bottom-padded-md">
					<div class="animate-box flex-center" data-animate-effect="fadeInLeft">

						<!-- 내용 -->

						<h2>습득물 등록</h2>
						<h5>📢 빠른 전달을 위해 최대한 정확한 정보를 입력해 주시면 더욱 도움이 됩니다! ✨</h5>

						<!-- 자동등록 : 분실물 고유번호 object_idx, QR 고유번호 qr_idx, 분실물 스캔 날짜 object_date-->

						<form action="saveLostItem" method="post"
							enctype="multipart/form-data">

							<table border="1">

								<tr>
									<td width="128px" align="center">분실물 명</td>
									<td><input type="text" name="object_name"
										class="form-control" placeholder="ex)지갑, 에어팟"></td>
								</tr>
								<tr>
									<td align="center">분실물 사진</td>
									<!-- <td><input type="text" name="object_photo"></td> -->
									<td><input type="file" name="object_photo"
										class="form-control"></td>
								</tr>
								<tr>
									<td align="center">메시지</td>
									<td><textarea name="notice_msg" class="form-control"
											placeholder="분실자에게 전할 메세지&#13;&#10;ex)OO경찰서에 맡겼습니다.&#13;&#10;습득자 연락처:010-0000-0000"
											style="height: 200px;"></textarea></td>
								</tr>
								<tr>
									<td align="center">보관 장소</td>
									<td><input type="text" id="object_keeping_place"
										class="form-control" name="object_keeping_place"
										placeholder="지도를 클릭해주세요" readonly="readonly"></td>
								</tr>
								<tr>
									<td align="center">보관 장소 상세 설명
									<td><input type="text" id="object_keeping_place_info"
										class="form-control" name="object_keeping_place_info"
										placeholder="ex)1층 CU에 맡김"></td>
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
										value="습득물 등록" style="width: 100%" class="btn btn-primary btn-md"></td>
								</tr>
							</table>

						</form>

						<!-- 내용끝 -->

					</div>
				</div>
			</div>
		</div>
	</div>

<%@ include file="/WEB-INF/views/qrcommon/qrbodyScripts.jsp" %>

						<script type="text/javascript"
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=73f10e0ecb2825848d7a1578ec6ca978&libraries=services,clusterer,drawing"></script>
		<script type="text/javascript" src="resources/js/kakao_map_lost_item_form.js"></script>
		<script type="text/javascript" src="../resources/js/kakao_map_lost_item_form.js"></script>
		
</body>
</html>