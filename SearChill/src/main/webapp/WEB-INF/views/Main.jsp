<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.entity.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>SearChill Main</title>

<%@ include file="/WEB-INF/views/common/head.jsp" %>

</head>
<body>

	<div id="fh5co-page">

    <%@ include file="/WEB-INF/views/common/fh5co-aside.jsp" %>

		<div id="fh5co-main">
			<!-- 메인 히어로 섹션 -->
			<aside id="fh5co-hero" class="js-fullheight">
			<div class="flexslider js-fullheight">
				<ul class="slides">
					<li style="background-color: #3d4f66;">

						<div class="overlay"></div>
						<div class="container-fluid">
							<div class="row ">
								<div
									class="col-md-8 col-md-offset-2 text-center js-fullheight slider-text">
									<div class="slider-text-inner">
										<!-- 메인 문구1 -->
										<h1 class="welcome-text">
											Welcome <span class="searchill-text">SearChill</span> <img
												id="search-icon"
												src="<c:url value='/resources/images/pngegg.png' />"
												alt="돋보기 아이콘">
										</h1>

										<h2 class="welcome-subtext">
											"쉽고 빠르게 분실물을 찾고, 소중한 것을 되찾으세요." <br> <span
												class="english-text">Find what you’ve lost, faster
												and easier with SearChill.</span>
										</h2>
										
										<!-- 회원 -->
										<c:if test="${loginuser != null}">
											<p>
												<a class="btn btn-primary btn-demo popup-vimeo"
													href="logout">Logout→</a> <a
													class="btn btn-primary btn-demo popup-vimeo"
													href="updateUser">Edit Profile</a>
											</p>

											
										</c:if>
										<!-- 비회원 -->
										<c:if test="${loginuser == null}">
											<p>
												<a class="btn btn-primary btn-demo popup-vimeo"
													href="<c:url value='/goJoin' />"> <i
													class="icon-monitor"></i> JOIN US!
												</a> <a href="memberMain" class="btn btn-primary btn-learn">LOGIN<i
													class="icon-arrow-right3"></i></a>
											</p>
										</c:if>

									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
			</aside>
			
			<!-- 서비스 섹션 -->

					</div>
				</div>
			</div>
		</div>
	</div>

<%@ include file="/WEB-INF/views/common/bodyScripts.jsp" %>

</body>
</html>

