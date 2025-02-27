<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>분실물 등록</title>

<%@ include file="/WEB-INF/views/qrcommon/qrhead.jsp"%>
<style>


/* ✅ 전체 컨테이너 정렬 */
.flex-center {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 85vh; /* 화면 높이 기준으로 중앙 정렬 */
}

/* ✅ 제목 스타일 */
h2 {
    font-size: 30px;
    font-weight: bold;
    color: white;
    text-shadow: 3px 3px 10px rgba(0, 0, 0, 0.4);
    margin-bottom: 15px;
    text-align: center;
}

/* ✅ 설명 스타일 */
.description-text {
    font-size: 18px;
    font-weight: 400;
    color: white;
    opacity: 0.85;
    text-align: center;
    margin-bottom: 30px; /* 버튼과 거리 조정 */
}

/* ✅ 버튼 스타일 */
.custom-btn {
    display: block;
    width: 260px;
    padding: 12px;
    font-size: 16px;
    font-weight: bold;
    border-radius: 8px;
    border: 2px solid rgba(255, 255, 255, 0.2);
    background: rgba(255, 255, 255, 0.2);
    color: white;
    cursor: pointer;
    transition: all 0.3s ease-in-out;
    text-align: center;
    margin: 10px auto;
}

/* ✅ 버튼 hover 효과 */
.custom-btn:hover {
    background: rgba(255, 255, 255, 0.4);
    transform: scale(1.05);
}

</style>
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

                        <div class="flex-center">
    <h2>📢 소중한 물건을 찾아주세요!</h2>
    <p class="description-text">
        분실자가 물건을 찾을 수 있도록 도와주세요. <br>
        작은 배려가 큰 도움이 됩니다!<br>
        입력한 정보는 분실자에게 전송됩니다.
    </p>

    <!-- 습득물 정보 입력 버튼 -->
    <form action="lostItemForm">
        <input type="hidden" name="mem_id" value="<%=request.getParameter("mem_id")%>">
        <input type="submit" value="습득물 정보 입력" class="custom-btn">
    </form>

    <!-- 연락처 확인 버튼 -->
    <form action="phoneCheck">
        <input type="hidden" name="mem_id" value="<%=request.getParameter("mem_id")%>">
        <input type="submit" value="분실자 연락처 확인" class="custom-btn">
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
