<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.entity.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

		<div class="main-link-container">
			<h2 class="main-link">
				<a href="goMain">Searchill</a>
			</h2>
		</div>
메모: 로그인 버튼은 색넣고 흰색글씨? 회원가입은 흰색에 검은색 글씨

		<!-- Header -->
		<c:if test="${loginuser == null}">
			<h2 >로그인</h2>
		
		<nav id="menu">
		<ul class="links">
			<form action="memberLogin" method="post">
				<li><input type="text" placeholder="ID를 입력하세요" name="mem_id"></li>
				<li><input type="password" placeholder="PW를 입력하세요"
					name="mem_pw"></li>
				<li><input type="submit" value="LogIn" class="button fit"></li>
			</form>
		</ul>

		</nav>

		
		</c:if> <c:if test="${loginuser != null}">
			<h2 class="login-link"><a href="updateUser">회원정보 수정</a></h2>
			<h2 class="login-link"><a href="logout"><b>로그아웃</b></a></h2>
		</c:if>

<div><button onclick="location.href='goJoin'">회원가입</button></div>


</body>
</html>

