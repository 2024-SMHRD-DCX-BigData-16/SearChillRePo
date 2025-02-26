<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file="/WEB-INF/views/common/head.jsp" %>


</head>
<body>



	<div id="fh5co-page">


	    <%@ include file="/WEB-INF/views/common/fh5co-aside.jsp" %>

		<div id="fh5co-main">
			<div class="fh5co-narrow-content">
				<div class="row row-bottom-padded-md">
					<div class="animate-box" data-animate-effect="fadeInLeft">

						<!-- 내용 -->


						<form action="memberInsert" method="post">
							<div class="row">
								<div class="col-md-12">
									<div class="row flex-center">
										<div class="col-md-6">
											<div class="form-group">
												<input type="text" class="form-control" id="inputID"
													placeholder="ID를 입력하세요" name="mem_id">
											</div>
											<div class="form-group">
												<input type="button" class="form-control" value="ID 중복체크"
													onclick="IDCheck()">
											</div>
											<div class="form-group">
												<input type="text" class="form-control" id="resultCheck"
													readonly="readonly">
											</div>
											<div class="form-group">
												<input type="password" class="form-control"
													placeholder="PW를 입력하세요" name="mem_pw">
											</div>
											<div class="form-group">
												<input type="text" class="form-control"
													placeholder="전화번호를 입력하세요" name="mem_phone">
											</div>
											<div class="form-group phone-open">
												<input type="text" class="form-control" id="radioMessage"
													placeholder="QR코드의 개인정보 제공 여부" readonly="readonly">
												<input type="radio" id="radioSelect" style="display: none"
													name="mem_phone_open" value="1"><label
													onclick="radioMessage1()" class="ladioLabel"
													for="radioSelect"> 공개</label> <input type="radio"
													id="radioSelect2" name="mem_phone_open" value="0"
													checked="checked" style="display: none"><label
													class="ladioLabel" for="radioSelect2"
													onclick="radioMessage2()"> 비공개</label>
											</div>

											<div class="form-group">
												<input type="text" class="form-control"
													placeholder="이름을 입력하세요" name="mem_name">
											</div>
											<div class="form-group">
												<input type="text" class="form-control" id="inputEmail"
													placeholder="Email을 입력하세요" name="mem_email">
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<input type="submit" class="btn btn-primary btn-md"
														value="회원가입">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>


						<!-- 내용끝 -->


					</div>
				</div>
			</div>


		</div>
	</div>





<%@ include file="/WEB-INF/views/common/bodyScripts.jsp" %>

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
						$("#resultCheck").attr("placeholder", "사용할 수 있는 아이디")
					} else {
						$("#resultCheck").attr("placeholder", "사용할 수 없는 아이디")
					}
				},
				error : function() {
					alert("통신 실패!!");
				}
			});
		}
	</script>


	<script type="text/javascript">
		function radioMessage1() {
			$("#radioMessage").attr("placeholder",
					"습득자가 QR코드 스캔 시 연락처를 알 수 있습니다.")
		}
		function radioMessage2() {
			$("#radioMessage").attr("placeholder",
					"습득자가 QR코드 스캔 시 연락처를 알 수 없습니다.")
		}
	</script>
</body>
</html>