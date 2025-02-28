<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common/head.jsp"%>
<style>
.flex-center {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

/* ✅ 제목 스타일 */
h1 {
	font-size: 50px;
	font-weight: bold;
	color: white;
	text-shadow: 3px 3px 10px rgba(0, 0, 0, 0.4);
	text-align: center;
	margin-bottom: 20px;
}

/* ✅ 본문 텍스트 스타일 */
h3 {
	font-size: 28px;
	font-weight: 400;
	color: white;
	opacity: 0.9;
	text-align: center;
	margin-bottom: 20px;
	line-height: 1.6;
}

/* ✅ 강조된 문구 */
h3 .highlight {
	color: #000; /* 블랙 */
	font-weight: bold;
	text-shadow: 0 0 5px rgba(255, 255, 255, 0.8), 0 0 10px
		rgba(255, 255, 255, 0.6), 0 0 15px rgba(255, 255, 255, 0.4);
}
/* ✅ 버튼 스타일 */
.return-btn {
	display: inline-block;
	padding: 15px 30px;
	font-size: 22px;
	font-weight: bold;
	border-radius: 10px;
	border: 2px solid rgba(255, 255, 255, 0.3);
	background: rgba(255, 255, 255, 0.2);
	color: white;
	text-decoration: none;
	cursor: pointer;
	transition: all 0.3s ease-in-out;
	margin-top: 20px;
}

/* ✅ 버튼 hover 효과 */
.return-btn:hover {
	background: rgba(255, 255, 255, 0.4);
	transform: scale(1.05);
}
</style>
</head>
<body>

	<div id="fh5co-page">
		<%@ include file="/WEB-INF/views/common/fh5co-aside.jsp"%>

		<div id="fh5co-main">
			<div class="fh5co-narrow-content">
				<div class="row row-bottom-padded-md flex-center">

					<!-- ✅ 분실물 등록 완료 메시지 -->
					<h1>분실물 등록이 완료되었습니다!</h1>

					<h3>
						당신의 따뜻한 배려 덕분에 <br> 잃어버린 물건의 주인이 다시 찾을 수 있는 기회가 생겼습니다. <br>
						<br> <span class="highlight">작은 선행이 큰 감동을 만듭니다🤍</span>
					</h3>
					<c:if test="${not empty param.success}">
						<h3 style="color: #ffeb3b;">📩 등록된 이메일로 알림이 발송되었습니다.</h3>
					</c:if>
					<!-- ✅ 메인으로 돌아가기 버튼 -->
					<a href="/controller/goMain" class="return-btn">RETURN</a>

				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/bodyScripts.jsp"%>

</body>

</html>