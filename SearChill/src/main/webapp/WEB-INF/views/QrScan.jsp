<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>분실물 등록</title>

<%@ include file="/WEB-INF/views/qrcommon/qrhead.jsp"%>

</head>
<body>

	<div id="fh5co-page">

		<%@ include file="/WEB-INF/views/qrcommon/qrfh5co-aside.jsp"%>

		<div id="fh5co-main">
			<div class="fh5co-narrow-content">
				<div class="row row-bottom-padded-md">
					<div class="animate-box flex-center"
						data-animate-effect="fadeInLeft">

						<!-- 내용 -->


						<!-- 습득물 정보 입력 폼 -->
						<div>

							<form action="lostItemForm">
								<input type="text" style="display: none" name="mem_id"
									value="<%=request.getParameter("mem_id")%>"
									class="hidden-input">

								<div class="info-box">
									<h2>📢 소중한 물건을 찾아주세요!</h2>
									<p>
										분실자가 물건을 찾을 수 있도록 도와주세요. <br> 작은 배려가 큰 도움이 됩니다. 💙 <br>
										입력한 정보는 분실자에게 전송됩니다.
									</p>
								</div>

								<input type="submit" style="width: 254px;" value="습득물 정보 입력"
									class="btn btn-primary btn-md">
							</form>

							<br>

							<!-- 연락처 확인 폼 -->
							<form action="phoneCheck">
								<input type="text" style="display: none" name="mem_id"
									value="<%=request.getParameter("mem_id")%>"
									class="hidden-input"> <input type="submit"
									style="width: 254px;" value="분실자 연락처 확인" class="btn btn-primary btn-md">
							</form>

						</div>

						<!-- 내용끝 -->

					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/qrcommon/qrbodyScripts.jsp"%>

</body>
</html>
