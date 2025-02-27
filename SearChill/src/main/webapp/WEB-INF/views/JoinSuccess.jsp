<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
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

						<div
							style="text-align: center; padding: 30px; background-color: #f9f9f9; border-radius: 10px; box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1); font-family: 'Arial', sans-serif;">

							<h1 style="color: #2c3e50; margin-bottom: 15px;">🎉
								SearChill에 오신 것을 환영합니다! 🎉</h1>

							<p style="color: #555; font-size: 18px; line-height: 1.6;">
								이제 <strong>SearChill</strong>을 통해 <br> <span
									style="color: #3498db; font-weight: bold;">부담없이 QR 코드를 발급</span>하고
								물건에 부착하세요! 🏷️<br> 만약 물건을 잃어버려도 <span
									style="color: #e74c3c; font-weight: bold;">분실물 센터나 습득자가
									쉽게 연락</span>할 수 있습니다. 📞<br> 또한, <span
									style="color: #2ecc71; font-weight: bold;">지도를 통해 분실물
									센터에 보관 중인 분실물</span>을 쉽게 확인하고 <br> 빠르게 되찾을 수 있도록 도와드립니다. 🗺️💡
							</p>

							<button onclick='location.href="memberMain"'
								class="btn btn-primary btn-md">login go</button>

						</div>

						<!-- 내용끝 -->

					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/bodyScripts.jsp"%>

</body>

</html>