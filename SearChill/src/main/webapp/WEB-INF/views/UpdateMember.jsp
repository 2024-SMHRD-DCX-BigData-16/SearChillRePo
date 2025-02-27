<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common/head.jsp"%>
<style>
/* ✅ 제목 스타일 */
h2 {
	font-size: 42px; /* 제목 크기 키움 */
	color: white;
	text-shadow: 2px 2px 8px rgba(255, 255, 255, 0.3);
	text-align: center;
	margin-bottom: 30px;
}

/* ✅ 전체 폼 스타일 */
form {
	width: 100%;
	max-width: 700px; /* 폼 크기 확대 */
	margin: 0 auto;
	background: rgba(255, 255, 255, 0.1);
	padding: 40px; /* 패딩 증가 */
	border-radius: 10px;
	backdrop-filter: blur(8px);
	box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.4);
}

/* ✅ 입력 필드 */
input[type="text"], input[type="email"], input[type="password"] {
	width: 80%;
	padding: 16px; /* 입력 필드 크기 확대 */
	border: 1px solid rgba(255, 255, 255, 0.2);
	background: rgba(255, 255, 255, 0.15);
	color: white;
	font-size: 20px; /* 폰트 크기 키움 */
	border-radius: 5px;
	text-align: center;
	outline: none;
	transition: all 0.3s ease-in-out;
	margin-bottom: 20px; /* 간격 증가 */
}

/* ✅ 입력 필드 포커스 효과 */
input:focus {
	background: rgba(255, 255, 255, 0.3);
	box-shadow: 0px 0px 8px rgba(255, 255, 255, 0.3);
}

/* ✅ 개인정보 공개 여부 스타일 */
.phone-open {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 80%;
	gap: 20px; /* 버튼 간격 조정 */
	margin-top: 20px;
	margin-left: 0px;
	margin-right: 0px;
}

/* ✅ 라디오 버튼 */
.ladioLabel {
	background: rgba(255, 255, 255, 0.2);
	padding: 15px -1px; /* 버튼 크기 확대 */
	border-radius: 8px;
	cursor: pointer;
	transition: all 0.3s ease-in-out;
	color: white;
	font-size: 20px; /* 글씨 키움 */
	font-weight: bold;
	text-align: center;
	border: 2px solid rgba(255, 255, 255, 0.3); /* 테두리 추가 */
}

/* ✅ 라디오 버튼 숨기기 */
input[type="radio"] {
	display: none;
}

input[type="radio"]:checked+.ladioLabel {
	background: rgba(255, 255, 255, 0.4);
	transform: scale(1.05);
	border: 2px solid white; /* 선택된 버튼 강조 */
}

/* ✅ 버튼 스타일 */
.btn-primary {
	width: 80%;
	padding: 20px; /* 버튼 크기 키움 */
	font-size: 20px; /* 폰트 크기 키움 */
	font-weight: bold;
	border-radius: 8px;
	border: 2px solid rgba(255, 255, 255, 0.2);
	background: rgba(255, 255, 255, 0.2);
	color: white;
	cursor: pointer;
	transition: all 0.3s ease-in-out;
	margin-top: 30px;
}

/* ✅ 버튼 hover 효과 */
.btn-primary:hover {
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
					<div class="animate-box col-md-9 flex-center"
						data-animate-effect="fadeInLeft">

						<!-- ✅ 제목 -->
						<h2>회원정보 수정</h2>

						<!-- ✅ 수정 폼 -->
						<form action="UpdateMember" method="post" class="flex-center">
							<input type="text" class="form-control"
								value="접속한 ID : ${loginuser.mem_id}" readonly="readonly">

							<input type="email" class="form-control" name="mem_email"
								value="${loginuser.mem_email}" placeholder="이메일을 입력하세요" required>

							<input type="password" class="form-control" name="mem_pw"
								placeholder="PW를 입력하세요" required> <input type="text"
								class="form-control" name="mem_name"
								value="${loginuser.mem_name}" placeholder="이름을 입력하세요" required>

							<input type="text" class="form-control" name="mem_phone"
								value="${loginuser.mem_phone}" placeholder="전화번호를 입력하세요"
								required>

							<!-- ✅ QR코드 개인정보 제공 여부 선택 (가로 정렬) -->
							<div class="phone-open">
								<input type="radio" id="radioSelect" style="display: none"
									name="mem_phone_open" value="1"
									${loginuser.mem_phone_open == '1' ? 'checked' : ''}> <label
									class="ladioLabel" for="radioSelect">공개</label> <input
									type="radio" id="radioSelect2" name="mem_phone_open" value="0"
									style="display: none"
									${loginuser.mem_phone_open == '0' ? 'checked' : ''}> <label
									class="ladioLabel" for="radioSelect2"">비공개</label>
							</div>

							<!-- ✅ 수정 버튼 -->
							<input type="submit" class="btn-primary" value="회원정보 수정"
								style="padding-bottom: 5px; padding-top: 5px; margin-top: 20px;
								">
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/bodyScripts.jsp"%>

</body>

</html>