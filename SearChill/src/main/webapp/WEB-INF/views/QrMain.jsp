<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file="/WEB-INF/views/common/head.jsp"%>

</head>
<body>

	<div id="fh5co-page">

		<%@ include file="/WEB-INF/views/common/fh5co-aside.jsp"%>

		<div id="fh5co-main">
			<div class="fh5co-narrow-content">
				<div class="row row-bottom-padded-md">
					<div class="animate-box flex-center"
						data-animate-effect="fadeInLeft">

						<!-- 내용 -->

						<div class="qr코드" style="display: inline-block;">

							<h3 align="center">QR코드</h3>
							<c:if test="${loginuser != null}">
								<div style="display: none;">
									<label for="url">URL 입력:</label> <input type="text" id="url"
										name="url"
										value="http://localhost:8081/controller/qrScan/?mem_id=${loginuser.mem_id }" />
									<br />
								</div>
							</c:if>
							<div id="qrCodeArea" style="display: none;">
								<img id="qrImage" src="" alt="QR 코드 이미지" />
								<div>
									<a id="down_btn_img" href="" download="qrcode.png"><button
											class="btn-success"
											style="width: 100%; padding-left: 10px; padding-right: 10px; margin-top: 7px;">다운로드(원본)</button></a>
								</div>
							</div>

						</div>
						<br>


						<div class="스티커" style="display: inline-block;">
							<h3 align="center">스티커</h3>

							<canvas id="myCanvas" width="130" height="130" style="border: 1px solid #d3d3d3;">
        Your browser does not support the canvas element.
	</canvas>
							<div>
								<a id="down_btn_canvas" href="" download="qrcode_combined.png"><button
										class="btn-success"
										style="width: 100%; padding-right: 3px; padding-left: 3px;">다운로드(스티커)</button></a>
							</div>
						</div>



						<!-- 						<hr style="border: 1px dashed #d3d3d3; margin: 20px 0;">
 -->
						<br>
<div>
						<h3 align="center">명함</h3>

						<div style="display: none">
							<div id="qrCodeArea_card" style="display: none;">
								<img id="qrImage_card" src="" alt="명함 사이즈 QR 코드 이미지" />
								<div>
									<a id="down_btn_img_card" href="" download="qrcode_card.png"><button
											class="btn-success" style="width: 100%;">다운로드 (원본)</button></a>
									<%-- id 에 _card 접미사 추가 --%>
								</div>
							</div>
						</div>

						<canvas id="myCanvas_card" width="360" height="200"
							<%-- id 에 _card 접미사 추가, 명함 사이즈 캔버스 크기 설정 --%>
		style="border: 1px solid #d3d3d3;">
        Your browser does not support the canvas element.
	</canvas>
						<div>
							<a id="down_btn_canvas_card" href=""
								download="qrcode_combined_card.png"><button
									class="btn-success"
									style="width: 100%; padding-left: 10px; padding-right: 10px;">
									다운로드(명함)</button></a>
							<%-- id 에 _card 접미사 추가 --%>
						</div>
</div>

						<!-- 내용끝 -->

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/bodyScripts.jsp"%>
			<script type="text/javascript" src="resources/js/qr.js"></script>
	
</body>
</html>