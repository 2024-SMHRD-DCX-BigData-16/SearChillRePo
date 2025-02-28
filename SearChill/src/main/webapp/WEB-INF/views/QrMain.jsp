<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QR 코드 다운로드</title>
<%@ include file="/WEB-INF/views/common/head.jsp"%>
<style>
/* ✅ 다운로드 제목 스타일 */
.download-title {
    font-size: 32px;
    font-weight: bold;
    color: white;
    text-shadow: 3px 3px 10px rgba(255, 255, 255, 0.4);
    text-align: center;
    margin-bottom: 25px;
}

/* ✅ 전체 컨테이너 */
.flex-center {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-align: center;
}

/* ✅ QR 코드 & 스티커를 가로 정렬 */
.qr-container {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 50px;
    margin-top: 20px;
}

/* ✅ QR 코드 & 스티커 박스 */
.qr-box {
    display: flex;
    flex-direction: column;
    align-items: center;
    background: rgba(255, 255, 255, 0.1); /* 반투명 배경 */
    padding: 20px;
    border-radius: 12px;
    backdrop-filter: blur(10px);
    box-shadow: 0px 4px 8px rgba(255, 255, 255, 0.2);
    width: 200px;
}

/* ✅ QR 코드 / 캔버스 스타일 */
.qr-box img, .qr-box canvas {
    border-radius: 8px;
    border: 1px solid rgba(255, 255, 255, 0.2);
    width: 150px;
    height: 150px;
}

/* ✅ 다운로드 버튼 그룹 (QR & 스티커를 같은 선상에 배치) */
.button-group {
    display: flex;
    justify-content: center;
    gap: 10px;
    margin-top: 8px;
}

/* ✅ QR 코드 & 스티커 다운로드 버튼 크기 조정 */
.qr-box button {
    width: 80px;
    padding: 8px;
    font-size: 12px;
    font-weight: bold;
    border-radius: 8px;
    border: 2px solid rgba(255, 255, 255, 0.3);
    background: rgba(255, 255, 255, 0.2);
    color: white;
    cursor: pointer;
    transition: all 0.3s ease-in-out;
}

/* ✅ 버튼 hover 효과 */
.qr-box button:hover {
    background: rgba(255, 255, 255, 0.4);
    transform: scale(1.05);
}

/* ✅ 명함 스타일 (아래쪽 배치) */
.card-container {
    margin-top: 40px;
    display: flex;
    flex-direction: column;
    align-items: center;
    background: rgba(255, 255, 255, 0.1); /* 반투명 배경 추가 */
    padding: 20px;
    border-radius: 12px;
    backdrop-filter: blur(10px);
    box-shadow: 0px 4px 8px rgba(255, 255, 255, 0.2);
    width: 400px;
}

/* ✅ 명함 캔버스 스타일 */
.card-container canvas {
    width: 360px;
    height: 200px;
    border-radius: 10px;
    border: 1px solid rgba(255, 255, 255, 0.2);
}

/* ✅ 명함 다운로드 버튼 */
.card-container button {
    margin-top: 12px;
    width: 100%;
    padding: 12px;
    font-size: 14px;
    font-weight: bold;
    border-radius: 8px;
    border: 2px solid rgba(255, 255, 255, 0.3);
    background: rgba(255, 255, 255, 0.2);
    color: white;
    cursor: pointer;
    transition: all 0.3s ease-in-out;
}

.card-container button:hover {
    background: rgba(255, 255, 255, 0.4);
    transform: scale(1.05);
}

/* ✅ "다운로드 (원본)" 버튼 숨기기 */
#down_btn_img_card, #qrImage_card {
    display: none !important;
}
</style>
</head>
<body>

    <div id="fh5co-page">
        <%@ include file="/WEB-INF/views/common/fh5co-aside.jsp"%>

        <div id="fh5co-main">
            <div class="fh5co-narrow-content">
                <div class="row row-bottom-padded-md flex-center animate-box" data-animate-effect="fadeInLeft">

<h2 class="download-title">DOWNLOAD HERE!</h2>

<!-- ✅ QR 코드 & 스티커 -->
<div class="qr-container">
    <!-- QR 코드 -->
    <div class="qr-box">
        <h3>QR 코드</h3>
        <c:if test="${loginuser != null}">
            <div style="display: none;">
                <input type="text" id="url" name="url"
                    value="http://localhost:8081/controller/qrScan/?mem_id=${loginuser.mem_id }" />
            </div>
        </c:if>
        <div id="qrCodeArea" style="display: none;">
            <img id="qrImage" src="" alt="QR 코드 이미지" />
        </div>
        <div class="button-group">
            <a id="down_btn_img" href="" download="qrcode.png">
                <button>다운로드</button>
            </a>
        </div>
    </div>

    <!-- 스티커 -->
    <div class="qr-box">
        <h3>스티커</h3>
        <canvas id="myCanvas"></canvas>
        <div class="button-group">
            <a id="down_btn_canvas" href="" download="qrcode_combined.png">
                <button>다운로드</button>
            </a>
        </div>
    </div>
</div>

<!-- ✅ 명함 (아래쪽 배치) -->
<div class="card-container">
    <h3>명함</h3>
    <div id="qrCodeArea_card" style="display: none;">
        <img id="qrImage_card" src="" alt="명함 QR 코드 이미지" />
        <a id="down_btn_img_card" href="" download="qrcode_card.png">
            <button>다운로드 (원본)</button>
        </a>
    </div>

    <canvas id="myCanvas_card"></canvas>
    <a id="down_btn_canvas_card" href="" download="qrcode_combined_card.png">
        <button>다운로드 (명함)</button>
    </a>
</div>

                </div>
            </div>
        </div>
    </div>

    <%@ include file="/WEB-INF/views/common/bodyScripts.jsp"%>
    <script type="text/javascript" src="resources/js/qr.js"></script>

</body>
</html>
