<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.entity.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common/head.jsp"%>
<script src="${pageContext.request.contextPath}/resources/js/login.js"
	defer></script>

</head>
<body>
  <body onload="openLoginPopup()">

	<div id="fh5co-page">

		<%@ include file="/WEB-INF/views/common/fh5co-aside.jsp"%>
      <div id="fh5co-main">
        <div class="fh5co-narrow-content">
          <div class="row row-bottom-padded-md flex-center">
            <div class="col-md-6 animate-box" data-animate-effect="fadeInLeft">
              <!-- ✅ 로그인 버튼 삭제 -->
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- ✅ 로그인 팝업 -->
    <div class="login-overlay" id="loginOverlay">
      <div class="login-box">
        <h2 class="login-title">Login</h2>

        <form action="memberLogin" method="post">
          <div class="input-group">
            <input
              type="text"
              id="mem_id"
              name="mem_id"
              class="form-control"
              placeholder="Id"
              required
            />
          </div>

          <div class="input-group">
            <input
              type="password"
              id="mem_pw"
              name="mem_pw"
              class="form-control"
              placeholder="Password"
              required
            />
          </div>

          <button type="submit" class="login-btn">Login</button>
        </form>

        <div class="login-links">
          <p>
            계정이 없으신가요?
            <a href="goJoin" class="register-link">회원가입하기</a>
          </p>
        </div>

        <button class="close-btn" onclick="closeLoginPopup()">✕</button>
      </div>
    </div>
    
	<%@ include file="/WEB-INF/views/common/bodyScripts.jsp"%>

</body>
</html>

