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
				<li><h5>ȸ����������</h5></li>
				<form action="UpdateMember" method="post">
					<li>������ ID : ${loginuser.mem_id}</li>


					<li><input type="email" name="mem_email"
						value="${loginuser.mem_email}" placeholder="�̸����� �Է��ϼ���" required></li>


					<li><input type="password" name="mem_pw"
						placeholder="PW�� �Է��ϼ���" required></li>


					<li><input type="text" name="mem_name"
						value="${loginuser.mem_name}" placeholder="�̸��� �Է��ϼ���" required></li>


					<li><input type="text" name="mem_phone"
						value="${loginuser.mem_phone}" placeholder="��ȭ��ȣ�� �Է��ϼ���" required></li>


					<li><label>����ó ���� ����:</label><br> <input type="radio"
						id="open" name="mem_phone_open" value="1"
						${loginuser.mem_phone_open == '1' ? 'checked' : ''}> ���� <input
						type="radio" id="close" name="mem_phone_open" value="0"
						${loginuser.mem_phone_open == '0' ? 'checked' : ''}> �����</li>

					<!-- ���� ��ư -->
					<li><input type="submit" value="ȸ������ ����" class="button fit"></li>
				</form>
			</ul>
		</nav>
	</div>
</html>