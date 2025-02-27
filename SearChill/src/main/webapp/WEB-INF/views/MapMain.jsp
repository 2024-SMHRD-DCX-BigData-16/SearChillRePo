<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지도</title>

<%@ include file="/WEB-INF/views/common/head.jsp"%>
<style>
h2 {
    font-size: 32px;
    font-weight: bold;
    text-align: center;
    color: white;
    text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
    margin-bottom: 20px;
}

/* ✅ 테이블 스타일 (연한 베이지 반투명, 기존 틀 유지) */
table {
    width: 100%;
    border-collapse: collapse;
    background: rgba(245, 235, 220, 0.2); /* 기존과 잘 어울리는 반투명 연베이지 */
    border-radius: 10px;
    overflow: hidden;
    margin-bottom: 20px;
}

/* ✅ 테이블 헤더 */
th {
    background: rgba(240, 230, 210, 0.8); /* 연한 베이지 */
    color: black;
    font-weight: bold;
    padding: 12px;
    text-align: center;
}

/* ✅ 테이블 셀 */
td {
    padding: 12px;
    text-align: center;
    border-bottom: 1px solid rgba(255, 255, 255, 0.2);
}

/* ✅ 입력 필드 */
input {
    width: 100%;
    padding: 10px;
    border: none;
    background: rgba(255, 255, 255, 0.2);
    color: white;
    font-size: 16px;
    border-radius: 5px;
    text-align: center;
}

/* ✅ 버튼 스타일 (기존 스타일 유지하면서 더 세련되게) */
button {
    width: 100%;
    padding: 12px;
    font-size: 16px;
    font-weight: bold;
    border-radius: 5px;
    border: 2px solid rgba(255, 255, 255, 0.2);
    background: rgba(255, 255, 255, 0.2);
    color: white;
    cursor: pointer;
    transition: all 0.3s ease-in-out;
}

/* ✅ 버튼 hover 효과 */
button:hover {
    background: rgba(255, 255, 255, 0.4);
    transform: scale(1.05);
}

/* ✅ 지도 영역 */
.map_wrap {
    width: 100%;
    height: 350px;
    border-radius: 10px;
    overflow: hidden;
}

</style>


</head>
<body>

   <div id="fh5co-page">

      <%@ include file="/WEB-INF/views/common/fh5co-aside.jsp"%>

      <div id="fh5co-main">
         <div class="fh5co-narrow-content">
            <div class="row row-bottom-padded-md flex-center">
               <div class="animate-box  col-md-9" data-animate-effect="fadeInLeft">

                  <!-- 내용 -->

                  <h2>어디에서 잃어버렸나요?</h2>

                  <form action="submitAddress">
                     <table>
                        <tr>
                           <td align="center">잃어버린 위치</td>
                           <td><input type="text" id="roadAddress" name="roadAddress"
                              class="form-control" placeholder="도로명 주소" readonly="readonly"></td>
                        </tr>
                        <tr>
                           <td align="center">물품명</td>
                           <td><input type="text" id="PRDT_NM" name="PRDT_NM"
                              class="form-control" placeholder="ex)지갑"></td>
                        </tr>
                        <tr>
                           <td colspan="2" align="center">
                              <button type="submit" class="btn btn-primary btn-md"
                                 style="width: 100%">인근 분실물 센터 조회</button>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="2">

                              <div class="map_wrap">
                                 <div id="map"></div>
                                 <div class="hAddr" style="display: none">
                                    <span class="title"></span> <span id="centerAddr"></span>
                                 </div>
                              </div>
                              <div>한 달 이내 등록된 분실물 마커</div>

                           </td>
                        </tr>

                     </table>

                     <input type="text" id="jibunAddress" name="jibunAddress"
                        placeholder="지번 주소" style="display: none;"> <input
                        type="text" id="pageNo" name="pageNo" value="1"
                        style="display: none;">

                  </form>

                  <!-- 내용끝 -->

               </div>
            </div>
         </div>
      </div>
   </div>

   <%@ include file="/WEB-INF/views/common/bodyScripts.jsp"%>

   <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=73f10e0ecb2825848d7a1578ec6ca978&libraries=services,clusterer,drawing"></script>
   <script type="text/javascript" src="resources/js/kakao_map_main.js"></script>

</body>

</html>