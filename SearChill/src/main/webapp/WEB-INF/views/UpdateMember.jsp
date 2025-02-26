<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
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
						<form action="UpdateMember" method="post">
							<div class="row">
								<div class="col-md-12">
									<div class="row flex-center">
										<div class="col-md-6">
											<div class="form-group">
												<input type="text" class="form-control"
													placeholder="접속한 ID : ${loginuser.mem_id}"
													readonly="readonly">
											</div>
											<div class="form-group">
												<input type="email" class="form-control" name="mem_email"
													value="${loginuser.mem_email}" placeholder="이메일을 입력하세요"
													required>
											</div>
											<div class="form-group">
												<input type="password" class="form-control" name="mem_pw"
													placeholder="PW를 입력하세요" required>
											</div>
											<div class="form-group">
												<input type="text" class="form-control" name="mem_name"
													value="${loginuser.mem_name}" placeholder="이름을 입력하세요"
													required>
											</div>
											<div class="form-group">
												<input type="text" class="form-control" name="mem_phone"
													value="${loginuser.mem_phone}" placeholder="전화번호를 입력하세요"
													required>
											</div>
											<div class="form-group phone-open">
												<input type="text" class="form-control" id="radioMessage"
													placeholder="QR코드의 개인정보 제공 여부" readonly="readonly">
												<input type="radio" id="radioSelect" style="display: none"
													name="mem_phone_open" value="1"
													${loginuser.mem_phone_open == '1' ? 'checked' : ''}><label
													onclick="radioMessage1()" class="ladioLabel"
													for="radioSelect"> 공개</label> <input type="radio"
													id="radioSelect2" name="mem_phone_open" value="0"
													style="display: none"
													${loginuser.mem_phone_open == '0' ? 'checked' : ''}><label
													class="ladioLabel" for="radioSelect2"
													onclick="radioMessage2()"> 비공개</label>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<input type="submit" class="btn btn-primary btn-md"
													value="회원정보 수정">
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