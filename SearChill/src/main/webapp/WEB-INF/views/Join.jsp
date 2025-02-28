<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>회원가입</title>
    <%@ include file="/WEB-INF/views/common/head.jsp"%>

    <script
      src="${pageContext.request.contextPath}/resources/js/join.js"
      defer
    ></script>
  </head>
  <body onload="openJoinPopup()">
    <div id="fh5co-page">
      <%@ include file="/WEB-INF/views/common/fh5co-aside.jsp"%>

      <div id="fh5co-main">
        <div class="fh5co-narrow-content">
          <div class="row row-bottom-padded-md flex-center">
            <div
              class="col-md-6 animate-box"
              data-animate-effect="fadeInLeft"
            ></div>
          </div>
        </div>
      </div>
    </div>

    <!-- ✅ 회원가입 팝업 -->
    <div class="join-overlay" id="joinOverlay">
      <div class="join-box">
        <h2 class="join-title">JOIN US!</h2>

        <form action="memberInsert" method="post">
          <div class="input-group">
            <input
              type="text"
              id="inputID"
              name="mem_id"
              class="form-control"
              placeholder="ID를 입력하세요"
              required
            />
            <button type="button" class="check-btn" onclick="IDCheck()">
              ✔ID 중복체크
            </button>
          </div>
          <!-- ✅ ID 중복 확인 결과를 별도 텍스트로 표시 -->
          <p id="resultCheck" class="check-result"></p>

          <div class="input-group">
            <input
              type="password"
              id="mem_pw"
              name="mem_pw"
              class="form-control"
              placeholder="PW를 입력하세요"
              required
            />
          </div>

          <div class="input-group">
            <input
              type="text"
              id="mem_phone"
              name="mem_phone"
              class="form-control"
              placeholder="전화번호를 입력하세요"
              required
            />
          </div>

          <!-- ✅ QR코드 개인정보 제공 여부를 텍스트 & 선택 버튼으로 변경 -->
          <!-- ✅ 공개/비공개 선택 버튼을 감싸는 컨테이너 추가 -->
          <p class="privacy-text">QR코드 개인정보 제공 여부</p>
          <div class="phone-open">
            <input type="radio" id="public" name="mem_phone_open" value="1" />
            <label for="public" class="radio-label">공개</label>
            <input
              type="radio"
              id="private"
              name="mem_phone_open"
              value="0"
              checked
            />
            <label for="private" class="radio-label">비공개</label>
          </div>

          <div class="input-group">
            <input
              type="text"
              id="mem_name"
              name="mem_name"
              class="form-control"
              placeholder="이름을 입력하세요"
              required
            />
          </div>

          <div class="input-group">
            <input
              type="email"
              id="mem_email"
              name="mem_email"
              class="form-control"
              placeholder="Email을 입력하세요"
              required
            />
          </div>

          <button type="submit" class="join-btn">회원가입</button>
        </form>

        <button class="close-btn" onclick="closeJoinPopup()">✕</button>
      </div>
    </div>

    <%@ include file="/WEB-INF/views/common/bodyScripts.jsp"%>
  </body>
</html>
