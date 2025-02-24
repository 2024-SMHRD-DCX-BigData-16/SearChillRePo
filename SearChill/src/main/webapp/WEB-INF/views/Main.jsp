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
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/mainset.css" />

<!--   .video-container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 70vh;
        }

        video {
            width: 70%;
            height: 100%;
            object-fit: cover;
        } -->
</style>
<!-- Scripts -->
</head>
<body>

	<div class="header">

		<div class="main-link-container">
			<h2 class="main-link">
				<a href="goMain">Searchill</a>
			</h2>
		</div>
		<div>
			<c:if test="${loginuser == null}">
				<h2 class="login-link">
					<a href="memberMain"><b>로그인</b></a>
				</h2>
			</c:if>
			<c:if test="${loginuser != null}">
				<h2 class="login-link">
					<a href="logout"><b>로그아웃</b></a>
				</h2>
				<div class="login-link">
					<a href="updateUser">회원정보 수정</a>
				</div>

			</c:if>
		</div>
	</div>


	<div class="menu">

		<!-- 회원 -->
		<c:if test="${loginuser != null}">
			<a href="qrMain">QR코드 발급</a>
			<a href="myLostItemNotice">내 분실물 습득 정보</a>
		</c:if>
		
		<!-- 비회원 -->
		<c:if test="${loginuser == null}">
			<a href="memberMain">QR코드 발급</a>
			<a href="memberMain">내 분실물 습득 정보</a>
		</c:if>
			<a href="lostItemForm">습득물 신고(주인을 찾아줘요)</a>
 			<a href="mapMain">지도</a>
			<!-- <a href="lostGuide">유실물 종합안내</a> -->
	</div>



</body>
</html>

