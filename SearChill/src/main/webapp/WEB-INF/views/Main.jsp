<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.entity.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page session="true" %>

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
        <div></div>
        <div class="main-link-container">
            <h2 class="main-link"><a href="goMain">Searchill</a></h2>
        </div>
        
	<c:if test="${loginuser == null}">
			<h2 class="login-link"><a href="memberMain"><b>로그인</b></a></h2>
		</c:if> <c:if test="${loginuser != null}">
			<h2 class="login-link"><a href="logout"><b>로그아웃</b></a></h2>
		</c:if> 
		   </div>

    <div class="menu">
        <a href="qrMain">QR코드 발급</a> 
        <a href="lostItemForm">테스트용 lostItemForm</a>
        <a href="qrScan">테스트용 qrScan</a>
        <a href="mapMain">지도</a>
        <a href="lost">유실물 종합안내</a>
        <a href="contact">문의사항</a>
    </div>

    <!-- <div class="video-container">
        <video src="/스마트폰 캐릭터 애니메이션을 사용하는 사람_preview.mp4" controls autoplay loop muted></video>
    </div> -->
	
	
	
	
	
	
	
	
	
	

	</body>
</html>

