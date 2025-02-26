<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Free HTML5 Website Template by FreeHTML5.co" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
<meta name="author" content="FreeHTML5.co" />

<!-- 구글 폰트 로드 -->

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css">

<!-- CSS 파일 로드 -->
<link rel="stylesheet" href="resources/css/animate.css">
<link rel="stylesheet" href="resources/css/icomoon.css">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/flexslider.css">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/table.css">

<!-- Modernizr JS 로드 -->
<script src="resources/js/modernizr-2.6.2.min.js"></script>


</head>
<body>

	<div id="fh5co-page">


		<!-- 네비게이션 토글 버튼 -->
		<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
      <aside id="fh5co-aside" role="complementary"
         class="border js-fullheight"> <!-- 로고 -->
      <h1 id="fh5co-logo">
         <a href="goMain"> <img
            src="<c:url value='/resources/images/searchill.png' />"
            alt="Searchill 로고" style="width: 250px; height: auto;">
         </a>
      </h1>

      <!-- 메인 메뉴 --> <nav id="fh5co-main-menu" role="navigation">
      <ul>
         <!-- <li class="fh5co-active"> -->
         <li><a href="goMain" class="menu-btn">Home</a></li>

         <!-- 회원 -->
         <c:if test="${loginuser != null}">

            <li><a href="qrMain" class="menu-btn">QR코드</a></li>
            <li><a href="myLostItemNotice" class="menu-btn">내 분실물 습득 정보</a></li>
         </c:if>
         <!-- 비회원 -->
         <c:if test="${loginuser == null}">
            <li><a href="memberMain" class="menu-btn">QR코드</a></li>
            <li><a href="memberMain" class="menu-btn">내 분실물 습득 정보</a></li>
         </c:if>
         <li><a href="lostItemForm" class="menu-btn">습득물 신고</a></li>
         <li><a href="mapMain" class="menu-btn">지도</a></li>

      </ul>
      </nav> <!-- 푸터 -->
      <div class="fh5co-footer">
         <!-- 로그인 및 회원정보 수정 버튼 추가 -->
				<div class="fh5co-login">
					<c:if test="${loginuser != null}">
						<p>
							<a class="btn btn-primary" href="logout">Logout</a>
						</p>
					</c:if>
				</div>

         <!-- 저작권 및 디자인 정보 -->
       <!--   <p>
            <small>&copy; 2016 Blend Free HTML5. All Rights Reserved.</span> <span>Designed
                  by <a href="http://freehtml5.co/" target="_blank">FreeHTML5.co</a>
            </span> <span>Demo Images: <a href="https://unsplash.com/"
                  target="_blank">Unsplash</a></span></small>
         </p> -->
      </div>

      </aside>


		<div id="fh5co-main">
			<div class="fh5co-narrow-content">
				<div class="row row-bottom-padded-md">
					<div class="col-md-11 animate-box" data-animate-effect="fadeInLeft">

						<!-- 내용 -->

		


${loginuser.mem_id}님의 QR코드로 등록된 분실물


<table border="1px">
    <thead>
        <tr>
            <th width="70px">물품명</th>
            <th width="120px">사진</th>
            <th>보관 장소</th>
            <th>상세 주소</th>
            <th>메시지</th>
            <th>습득 위치</th>
            <th>습득 날짜</th>
            <th>삭제</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="item" items="${myLostItemList}">
            <tr>
                <td>${item.object_name}</td>
 				<td><img src='./resources/objectImages/${item.object_photo}' width="120px" height="120px"></td>
                <td>${item.object_keeping_place}</td>
                <td>${item.object_keeping_place_info}</td>
                <td>${item.notice_msg}</td>
                <td>${item.object_scan_loc}</td>
                <td>${item.object_date}</td>
                <td><form action="deleteLostItem" method="post">
                <input style="display: none" name="object_idx" value="${item.object_idx}">
                <input type="submit" value="X" class="btn-danger">
                </form></td>
                
            </tr>
        </c:forEach>
    </tbody>
</table>

						<!-- 내용끝 -->

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>


					</div>
				</div>
			</div>


		</div>
	</div>

	<!-- jQuery 로드 -->
	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/jquery.scrolly.min.js"></script>
	<script src="resources/js/jquery.scrollex.min.js"></script>
	<script src="resources/js/skel.min.js"></script>
	<script src="resources/js/util.js"></script>
	<!-- jQuery Easing 로드 -->
	<script src="resources/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap 로드 -->
	<script src="resources/js/bootstrap.min.js"></script>
	<!-- Waypoints 로드 -->
	<script src="resources/js/jquery.waypoints.min.js"></script>
	<!-- Flexslider 로드 -->
	<script src="resources/js/jquery.flexslider-min.js"></script>

	<!-- 메인 JS 로드 -->
	<script src="resources/js/main.js"></script>


</body>

</html>