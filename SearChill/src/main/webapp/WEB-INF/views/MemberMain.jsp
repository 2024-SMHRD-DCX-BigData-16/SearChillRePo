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

</head>
<body>

	<div id="fh5co-page">


		<%@ include file="/WEB-INF/views/common/fh5co-aside.jsp"%>


		<div id="fh5co-main">
			<div class="fh5co-narrow-content">
				<div class="row row-bottom-padded-md flex-center">
					<div class="col-md-6 animate-box" data-animate-effect="fadeInLeft">

						<!-- 내용 -->
						<div class="login-container">
							<div class="login-box flex-center">
								<!-- 로그인 아이콘 -->
								<div class="login-icon">
									<img src="resources/images/logicon.png" alt="Login Icon">
								</div>

								<!-- 로그인 폼 -->
								<c:if test="${loginuser == null}">
									<h2 class="login-title">로그인</h2>
									<form action="memberLogin" method="post">
										<div class="input-group">
											<label for="mem_id"><i class="icon-mail"></i> 아이디</label> <input
												type="text" id="mem_id" name="mem_id" class="form-control"
												required>
										</div>

										<div class="input-group">
											<label for="mem_pw"><i class="icon-lock"></i> 비밀번호</label> <input
												type="password" id="mem_pw" name="mem_pw"
												class="form-control" required>
										</div>

										<button type="submit" class="login-btn">로그인</button>
									</form>

									<div class="register-link">
										<p>
											계정이 없으신가요? <a href="goJoin">회원가입</a>
										</p>
									</div>
								</c:if>

								<!-- 로그인 후 회원 정보 및 로그아웃 -->
								<c:if test="${loginuser != null}">
									<h2 class="login-link">
										<a href="updateUser">회원정보 수정</a>
									</h2>
									<h2 class="login-link">
										<a href="logout"><b>로그아웃</b></a>
									</h2>
								</c:if>
							</div>
						</div>

						<!-- 내용끝 -->


					</div>
				</div>
			</div>


		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/bodyScripts.jsp" %>

</body>
</html>

