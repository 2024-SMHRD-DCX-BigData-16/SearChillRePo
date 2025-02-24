<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>

		<div class="main-link-container">
			<h2 class="main-link">
				<a href="goMain">Searchill</a>
			</h2>
		</div>

		<nav id="menu">
		<ul class="actions vertical">
			<form action="memberInsert" method="post">
				<li><input type="text" id="inputID" placeholder="ID를 입력하세요"
					name="mem_id"></li>
				<li><input type="button" value="ID 중복체크" onclick="IDCheck()"></li>
				<li><span id="resultCheck"></span></li>

				<li><input type="password" placeholder="PW를 입력하세요"
					name="mem_pw"></li>
				<li><input type="text" placeholder="전화번호를 입력하세요"
					name="mem_phone"></li>
				<li><input type="text" placeholder="이름을 입력하세요" name="mem_name"></li>
				<li><input type="text" id="inputEmail"
					placeholder="Email을 입력하세요" name="mem_email"></li>
				<li><label>연락처 공개 여부</label><br> <input type="radio"
					name="mem_phone_open" value="1"> O <input type="radio"
					name="mem_phone_open" value="0" checked> X</li>

				<li><input type="submit" value="회원가입" class="button fit"></li>
			</form>
		</ul>
		</nav>
		<script src="resources/js/jquery.min.js"></script>
		<script src="resources/js/jquery.scrolly.min.js"></script>
		<script src="resources/js/jquery.scrollex.min.js"></script>
		<script src="resources/js/skel.min.js"></script>
		<script src="resources/js/util.js"></script>
		<script type="text/javascript">
			function IDCheck() {
				// 입력된 아이디 값 가져오기
				var inputID = $('#inputID').val();
				console.log(inputID);

				// 아이디 입력값이 비어있는지 체크
				if (inputID.trim() === "") {
					alert("아이디를 입력해주세요.");
					return;
				}

				// AJAX 요청 보내기
				$.ajax({
					url : 'IDCheck', // 서버 경로 확인
					data : {
						'inputID' : inputID
					}, // 전달할 데이터
					type : 'GET', // GET 방식으로 요청
					success : function(data) {
						if (data) { // 서버에서 boolean 값을 받았을 때
							$('#resultCheck').text('사용할 수 있는 아이디');
						} else {
							$('#resultCheck').text('사용할 수 없는 아이디');
						}
					},
					error : function() {
						alert("통신 실패!!");
					}
				});
			}
		</script>

</body>
</html>