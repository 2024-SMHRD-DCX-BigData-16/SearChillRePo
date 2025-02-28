<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>분실자 연락처 확인</title>
<%@ include file="/WEB-INF/views/qrcommon/qrhead.jsp"%>
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
      <%@ include file="/WEB-INF/views/qrcommon/qrfh5co-aside.jsp"%>

      <div id="fh5co-main">
         <div class="fh5co-narrow-content">
            <div class="row row-bottom-padded-md flex-center">

               <!-- ✅ 분실물 등록 완료 메시지 -->
               <h1 >📞 분실자 연락처 확인</h1>

               <c:if test="${phone ne '비공개 상태입니다.'}">
                  <h3>
                     <p>
                        분실자의 연락처를 통해 분실물을 되돌려주세요<br>작은 관심이 큰 힘이 됩니다ꉂ☻ᵎᵎᵎ
                     </p>
                     📌 분실자 연락처: ${phone}
                  </h3>
               </c:if>

               <c:if test="${phone eq '비공개 상태입니다.'}">
                  <h3>
                     등록된 연락처가 없습니다. <br>습득물 정보를 입력하면 분실자가 확인할 수 있습니다.<br>작은 관심이 큰 힘이 됩니다ꉂ☻ᵎᵎᵎ
                  </h3>
               </c:if>
               <form action="lostItemForm">
                  <input type="text" name="mem_id" style="display: none"
                     value="<%=request.getParameter("mem_id")%>" class="hidden-input">
                  <input type="submit" value="📋 분실물 등록하기 " class="return-btn">
               </form>

            </div>
         </div>
      </div>
   </div>

   <%@ include file="/WEB-INF/views/qrcommon/qrbodyScripts.jsp"%>

</body>
</html>
