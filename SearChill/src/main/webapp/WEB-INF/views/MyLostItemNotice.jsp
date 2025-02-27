<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common/head.jsp"%>
<link rel="stylesheet" href="resources/css/table.css">
<style>
/* ✅ 테이블 제목 스타일 */
 .table-title {
        text-align: center; /* ✅ 가운데 정렬 */
        font-size: 30px; /* ✅ 글씨 크기 확대 */
        font-weight: bold; /* ✅ 굵게 */
        text-transform: uppercase; /* ✅ 대문자로 변환 */
        color: white; /* ✅ 테이블과 어울리도록 유지 */
        margin-bottom: 20px; /* ✅ 테이블과 간격 조정 */
        text-shadow: 3px 3px 10px rgba(0, 0, 0, 0.5); /*
}
</style>
</head>
<body>

	<div id="fh5co-page">

		<%@ include file="/WEB-INF/views/common/fh5co-aside.jsp"%>

		<div id="fh5co-main">
			<div class="fh5co-narrow-content">
				<div class="row row-bottom-padded-md flex-center">
					<div class="col-md-11 animate-box" data-animate-effect="fadeInLeft">

						<!-- 내용 -->

						<!-- ✅ 테이블 제목 -->
						<div class="table-title">${loginuser.mem_id}님의 QR코드로 등록된 분실물
						</div>


						<table border="1px">
							<thead>
								<tr>
									<th width="70px">물품명</th>
									<th width="120px">사진</th>
									<th>보관 장소</th>
									<th>상세 주소</th>
									<th>메시지</th>
									<th>습득 위치</th>
									<th>습득 날짜</th>
									<th>삭제</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${myLostItemList}">
									<tr>
										<td>${item.object_name}</td>
										<td><img
											src='./resources/objectImages/${item.object_photo}'
											width="120px" height="120px"></td>
										<td>${item.object_keeping_place}</td>
										<td>${item.object_keeping_place_info}</td>
										<td>${item.notice_msg}</td>
										<td>${item.object_scan_loc}</td>
										<td>${item.object_date}</td>
										<td><form action="deleteLostItem" method="post">
												<input style="display: none" name="object_idx"
													value="${item.object_idx}"> <input type="submit"
													value="X" class="btn-danger">
											</form></td>

									</tr>
								</c:forEach>
							</tbody>
						</table>

						<!-- 내용끝 -->

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/bodyScripts.jsp"%>

</body>

</html>