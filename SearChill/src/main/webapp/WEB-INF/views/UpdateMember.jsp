<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id="wrapper">
		<!-- Menu -->
		<nav id="Update">
			<ul class="actions vertical">
				<li><h5>회원정보수정</h5></li>
				<form action="UpdateMember" method="post">
					<li>접속한 ID : ${loginuser.mem_id}</li>


					<li><input type="email" name="mem_email"
						value="${loginuser.mem_email}" placeholder="이메일을 입력하세요" required></li>


					<li><input type="password" name="mem_pw"
						placeholder="PW를 입력하세요" required></li>


					<li><input type="text" name="mem_name"
						value="${loginuser.mem_name}" placeholder="이름을 입력하세요" required></li>


					<li><input type="text" name="mem_phone"
						value="${loginuser.mem_phone}" placeholder="전화번호를 입력하세요" required></li>


					<li><label>연락처 공개 여부:</label><br> <input type="radio"
						id="open" name="mem_phone_open" value="1"
						${loginuser.mem_phone_open == '1' ? 'checked' : ''}> 공개 <input
						type="radio" id="close" name="mem_phone_open" value="0"
						${loginuser.mem_phone_open == '0' ? 'checked' : ''}> 비공개</li>

					<!-- 수정 버튼 -->
					<li><input type="submit" value="회원정보 수정" class="button fit"></li>
				</form>
			</ul>
		</nav>
	</div>
</html>