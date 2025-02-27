<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>분실자 연락처 확인</title>
<%@ include file="/WEB-INF/views/qrcommon/qrhead.jsp"%>

</head>
<body>

	<div id="fh5co-page">

		<%@ include file="/WEB-INF/views/qrcommon/qrfh5co-aside.jsp"%>

		<div id="fh5co-main">
			<div class="fh5co-narrow-content">
				<div class="row row-bottom-padded-md">
					<div class="animate-box flex-center" data-animate-effect="fadeInLeft">

						<!-- 내용 -->

						<div class="info-box">
							<h2>📞 분실자 연락처 확인</h2>
							<p>
								분실자의 연락처를 확인하여 도와주세요. <br> 작은 관심이 큰 도움이 됩니다. 💙
							</p>
						</div>

						<div>
							<h3>📌 분실자 연락처:</h3>
							<p style="font-size: 18px; font-weight: bold; color: white;">
								${phone}</p>
						</div>

						<c:if test="${phone eq '비공개 상태입니다.'}">
							<div class="info-box">
								<p>
									분실자의 연락처가 비공개 상태입니다. <br> 물건을 주운 위치를 입력해 주세요.
								</p>
							</div>

							<form action="lostItemForm">
								<input type="text" name="mem_id"
									value="<%=request.getParameter("mem_id")%>"
									class="hidden-input"> <input type="submit"
									value="📋 분실물 등록 페이지 이동" class="btn">
							</form>
						</c:if>

						<!-- 내용끝 -->

					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/views/qrcommon/qrbodyScripts.jsp" %>

</body>
</html>
