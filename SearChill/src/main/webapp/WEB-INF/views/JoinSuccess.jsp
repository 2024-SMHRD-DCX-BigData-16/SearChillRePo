<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<%@ include file="/WEB-INF/views/common/head.jsp"%>

<style type="text/css">
        /* ✅ 중앙 컨텐츠 */
        .welcome-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            max-width: 900px;
            width: 90%;
            position: relative;
        }
      /* ✅ 제목 스타일 (강조 효과 추가) */
        .welcome-title {
            font-size: 36px; /* ✅ 제목 크기 키움 */
            font-weight: 800; /* ✅ 글씨 더 굵게 */
            text-transform: uppercase; /* ✅ 대문자로 변환 */
            letter-spacing: 2px; /* ✅ 글자 간격 추가 */
            text-align: center;
            margin-bottom: 15px; /* ✅ 말풍선과 간격 조정 */
           color: white; /* ✅ 색상 흰색 유지 */
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3); /* ✅ 은은한 그림자 추가 */
        }

        /* ✅ 말풍선 이미지 컨테이너 */
        .speech-bubble-container {
            position: relative;
            max-width: 750px; /* ✅ 크기 유지 */
            width: 65%;
            height: auto;
            margin-left: -40px; /* ✅ 왼쪽으로 살짝 이동 */
        }

        .speech-bubble-container img {
            width: 100%;
            height: auto;
        }

        /* ✅ 말풍선 내부 텍스트 */
        .bubble-text {
            position: absolute;
            top: 7%; /* ✅ 텍스트를 말풍선 최상단으로 이동 */
            left: 10%;
            width: 80%;
            height: 80%;
            display: flex;
            flex-direction: column;
            justify-content: flex-start; /* ✅ 최상단 정렬 */
            align-items: center; /* ✅ 중앙 정렬 */
            text-align: center;
            font-size: 19px; /* ✅ 글씨 크기 조정 */
            font-weight: 500;
            color: #111; /* ✅ 가독성 좋은 색상 */
            line-height: 1.4;
            word-wrap: break-word;
            padding: 10px;
        }

        /* ✅ 강조 텍스트 */
        .highlight { color: #007BFF; font-weight: 600; }

        /* ✅ 로그인 버튼 (말풍선 내부) */
        .login-button {
            padding: 5px 10px;
            font-size: 16px; /* ✅ 버튼 글씨 크기 유지 */
            font-weight: 600;
            color: #333;
            border: 2px solid #CCCCCC;
            background: #F0F0F0;
            border-radius: 4px;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
            margin-top: 3px; /* ✅ 버튼 위치를 최소한으로 조정 */
        }

        .login-button:hover {
            background: #007BFF;
            color: white;
            border-color: #007BFF;
            box-shadow: 0 0 15px rgba(0, 123, 255, 0.6);
        }
</style>

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
  <div class="welcome-container">

                <!-- ✅ 강조된 제목 (이미지 위쪽) -->
                <h1 class="welcome-title">Hello Chill Chill guy!</h1>

                <!-- ✅ 말풍선 이미지 (캐릭터 포함된 하나의 이미지) -->
                <div class="speech-bubble-container">
                    <img src="<c:url value='/resources/images/IMG_8674.png' />" alt="말풍선 캐릭터">
                    
                    <!-- ✅ 말풍선 내부에 텍스트 & 로그인 버튼 포함 -->
                    <div class="bubble-text">
                        <p>
                            이제 <strong>SearChill</strong>을 통해 <br> 
                             부담없이 <span class="highlight"> QR 코드를 발급</span>하고 물건에 부착하세요! <br> 
                            만약 물건을 잃어버려도 <span class="highlight">분실물 센터나 습득자가 쉽게 연락</span><br>할 수 있습니다. <br> 
                            또한, <span class="highlight">지도를 통해 분실물 센터에 보관 중인 분실물</span>을 <br>확인하고  
                            빠르게 되찾을 수 있도록 도와드립니다!<br>"Good Luck!" 😊🍀
                        </p>

                        <!-- ✅ 로그인 버튼도 말풍선 내부에 포함 -->
                        <button onclick='location.href="memberMain"' class="login-button">LOGIN GO</button>
                    </div>
                </div>

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