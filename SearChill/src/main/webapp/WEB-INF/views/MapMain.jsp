<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지도</title>

<%@ include file="/WEB-INF/views/common/head.jsp"%>

<style>
map_wrap {
	justify-content: center top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 100%;
	height: 350px;
}

table {
	width: 100%; /* 테이블을 부모 요소 기준 100% 크기로 설정 */
	table-layout: fixed; /* 고정된 레이아웃 */
	border-collapse: collapse; /* 경계선 겹침 */
}

td, th {
	padding: 10px; /* 셀 안쪽 여백 */
	border: 1px solid #ddd; /* 테두리 추가 */
}

input {
	width: 100%; /* 입력 필드가 셀 크기에 맞게 늘어나도록 설정 */
	box-sizing: border-box; /* padding과 border가 width에 포함되도록 설정 */
}
</style>

</head>
<body>

	<div id="fh5co-page">

		<%@ include file="/WEB-INF/views/common/fh5co-aside.jsp"%>

		<div id="fh5co-main">
			<div class="fh5co-narrow-content">
				<div class="row row-bottom-padded-md flex-center">
					<div class="animate-box  col-md-9" data-animate-effect="fadeInLeft">

						<!-- 내용 -->

						<h2>어디에서 잃어버렸나요?</h2>

						<form action="submitAddress">
							<table>
								<tr>
									<td align="center">잃어버린 위치</td>
									<td><input type="text" id="roadAddress" name="roadAddress"
										class="form-control" placeholder="도로명 주소" readonly="readonly"></td>
								</tr>
								<tr>
									<td align="center">물품명</td>
									<td><input type="text" id="PRDT_NM" name="PRDT_NM"
										class="form-control" placeholder="ex)지갑"></td>
								</tr>
								<tr>
									<td colspan="2" align="center">
										<button type="submit" class="btn btn-primary btn-md"
											style="width: 100%">인근 분실물 센터 조회</button>
									</td>
								</tr>
								<tr>
									<td colspan="2">

										<div class="map_wrap">
											<div id="map"></div>
											<div class="hAddr" style="display: none">
												<span class="title"></span> <span id="centerAddr"></span>
											</div>
										</div>
										<div>한 달 이내 등록된 분실물 마커</div>

									</td>
								</tr>

							</table>

							<input type="text" id="jibunAddress" name="jibunAddress"
								placeholder="지번 주소" style="display: none;"> <input
								type="text" id="pageNo" name="pageNo" value="1"
								style="display: none;">

						</form>

						<!-- 내용끝 -->

					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/bodyScripts.jsp"%>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=73f10e0ecb2825848d7a1578ec6ca978&libraries=services,clusterer,drawing"></script>
	<script type="text/javascript" src="resources/js/kakao_map_main.js"></script>

</body>

</html>