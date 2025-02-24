<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#loading {
    border: 16px solid #f3f3f3; /* Light grey - border 전체 색상 지정 */
    border-top: 16px solid #3498db; /* Blue - 로딩 영역 색상 지정 */
    border-radius: 50%; /* 둥근 모서리 효과 */
    width: 120px; /* 크기 지정 */
    height: 120px;
    animation: spin 2s linear infinite;
    /* 키프레임 애니메이션값 2초 가속도 없이 일정하게 연속적인 로딩 */
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    z-index: 20;
}

@keyframes spin {
    0% {
        transform: rotate(0deg);
    }
    100% {
        transform: rotate(360deg);
    }
}

/* ** 추가: 현재 페이지 버튼 스타일 ** */
.current-page {
    background-color: #3498db; /* 파란색 배경 */
    color: white !important; /* 흰색 글자, important로 기존 스타일보다 우선 적용 */
    font-weight: bold; /* 글자 굵게 */
    /* 필요에 따라 다른 스타일 추가 (padding, border 등) */
}
.current-page:link, .current-page:visited, .current-page:hover, .current-page:active {
    color: white !important; /* 링크 관련 상태에서도 흰색 글자 유지 */
    text-decoration: none; /* 밑줄 제거 */
}

</style>

</head>
<body>
<div id="top"></div>
	<h1>습득물 조회 결과</h1>

<%
    String currentPage = request.getParameter("pageNo"); // 현재 페이지 번호 파라미터로 받기
    if (currentPage == null || currentPage.isEmpty()) {
        currentPage = "1"; // 기본값으로 1페이지 설정
    }
	for(int i =1; i<=10; i++){
	%>
    <a href="submitAddress?roadAddress=${sessionScope.mapAddress.roadAddress}&jibunAddress=${sessionScope.mapAddress.jibunAddress}&PRDT_NM=${sessionScope.mapAddress.PRDT_NM}&pageNo=<%=i %>"
    <% if (String.valueOf(i).equals(currentPage)) { // 현재 페이지 번호와 버튼 번호 비교 %>
        class="current-page"  /* ** 현재 페이지 버튼에 current-page 클래스 추가 ** */
    <% } %>
    ><%=i %></a>
<% }
%>

<div style="display: inline;">
<form action="submitAddress">
<input type="text" name="roadAddress" value="${sessionScope.mapAddress.roadAddress}" style="display: none">
<input type="text" name="jibunAddress" value="${sessionScope.mapAddress.jibunAddress}" style="display: none">
<input type="text" name="pageNo" size="1">
<input type="submit" value="원하는 페이지로 이동">
</form>

</div>

	<div id="loading"></div>

	<!-- 세부 정보 테이블 -->
	<table id="detailTable" border="1px" style="display: none;">
		<thead>
			<tr>
				<th>이미지</th>
				<th>물품명</th>
				<th>보관 장소</th>
				<th>습득 날짜
					<button onclick="sortTableByDate()">정렬</button>
				</th>
				<th>전화번호</th>
			</tr>
		</thead>
		<tbody id="detailBody"></tbody>
	</table>


	<h3 id="lostNotice" style="display: none;">분실하신 분께서는 본인을 증명할 수 있는
		서류를 지참하시어 보관중으로 기재되어 있는 기관에 방문하시어 보관물품을 수령하시기 바랍니다.</h3>
		
	<script type="text/javascript">

	
	const serviceKey = "jmcNMfi%2Ftd9tkFOLg5mvQczw6r8Rw1GTrSXFjbTkrSiDZN2wkrQsBdsU9p3%2FOsgFNZFHQcz00Y3%2B2swL0NQgOg%3D%3D";
		let itemData = []; // 습득물 데이터를 저장할 배열
		let sortAscending = true; // 정렬 상태를 나타낼 변수
		let PRDT_NM = '${sessionScope.mapAddress.PRDT_NM}'
		let pageNo = '${pageNo}'; //페이지를 정하는 변수
		let numOfRows = 25;
		// 첫 번째 요청 (경찰청)
		var xhr1 = new XMLHttpRequest();
		var url1 = 'http://apis.data.go.kr/1320000/LosfundInfoInqireService/getLosfundInfoAccToLc';
		var queryParams1 = '?' + encodeURIComponent('serviceKey') + '='
				+ serviceKey; /*Service Key*/
	    queryParams1 += '&' + encodeURIComponent('PRDT_NM') + '=' + encodeURIComponent(PRDT_NM);

		queryParams1 += '&' + encodeURIComponent('pageNo') + '='
				+ encodeURIComponent(pageNo);
		queryParams1 += '&' + encodeURIComponent('numOfRows') + '='
				+ encodeURIComponent(numOfRows);
		queryParams1 += '&' + encodeURIComponent('ADDR') + '='
				+ encodeURIComponent('${sessionScope.mapAddress.roadAddress}');

		xhr1.open('GET', url1 + queryParams1);
		xhr1.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var parser1 = new DOMParser();
				var xmlDoc1 = parser1.parseFromString(this.responseText,
						"text/xml");

				var atcIds = xmlDoc1.getElementsByTagName("atcId");

				// atcId 기반으로 두 번째 요청을 보내는 부분은 동일
				for (var i = 0; i < atcIds.length; i++) {
					var atcId = atcIds[i].textContent;

					var xhr2 = new XMLHttpRequest();
					var url2 = 'http://apis.data.go.kr/1320000/LosfundInfoInqireService/getLosfundDetailInfo';
					var queryParams2 = '?' + encodeURIComponent('serviceKey')
							+ '=' + serviceKey;
					queryParams2 += '&' + encodeURIComponent('pageNo') + '='
							+ encodeURIComponent('1');
					queryParams2 += '&' + encodeURIComponent('numOfRows') + '='
							+ encodeURIComponent('1');
					queryParams2 += '&' + encodeURIComponent('ATC_ID') + '='
							+ encodeURIComponent(atcId);
					queryParams2 += '&' + encodeURIComponent('FD_SN') + '='
							+ encodeURIComponent('1');

					xhr2.open('GET', url2 + queryParams2);
					xhr2.onreadystatechange = function() {
						if (this.readyState == 4 && this.status == 200) {
							var parser2 = new DOMParser();
							var xmlDoc2 = parser2.parseFromString(
									this.responseText, "text/xml");

							var depPlace = xmlDoc2.querySelector("depPlace").textContent; // 보관장소
							var fdFilePathImg = xmlDoc2
									.querySelector("fdFilePathImg").textContent;
							var fdYmd = xmlDoc2.querySelector("fdYmd").textContent; // 습득 일자
							var fdPrdtNm = xmlDoc2.querySelector("fdPrdtNm").textContent; // 물품명
							var tel = xmlDoc2.querySelector("tel").textContent; // 전화번호

							// 데이터 저장
							itemData.push({
								depPlace : depPlace,
								fdFilePathImg : fdFilePathImg,
								fdYmd : fdYmd,
								fdPrdtNm : fdPrdtNm,
								tel : tel
							});

							renderTable();
						}
					};
					xhr2.send('');
				}
				//checkAllRequestsCompleted();
			}
		};
		xhr1.send(''); // 첫 번째 요청 시작

 		// 두 번째 요청 (포털URL)
		var xhr3 = new XMLHttpRequest();
		var url3 = 'http://apis.data.go.kr/1320000/LosPtfundInfoInqireService/getPtLosfundInfoAccToLc'; // 포털 URL
		var queryParams3 = '?' + encodeURIComponent('serviceKey') + '='	+ serviceKey; //Service Key
        queryParams3 += '&' + encodeURIComponent('PRDT_NM') + '=' + encodeURIComponent(PRDT_NM);
		queryParams3 += '&' + encodeURIComponent('pageNo') + '='+ encodeURIComponent(pageNo);
		queryParams3 += '&' + encodeURIComponent('numOfRows') + '='	+ encodeURIComponent('10');
		queryParams3 += '&' + encodeURIComponent('ADDR') + '='+ encodeURIComponent('${sessionScope.mapAddress.roadAddress}');

		xhr3.open('GET', url3 + queryParams3);
		xhr3.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var parser3 = new DOMParser();
				var xmlDoc3 = parser3.parseFromString(this.responseText,
						"text/xml");

				var atcIds3 = xmlDoc3.getElementsByTagName("atcId");

				// atcId 기반으로 두 번째 요청을 보내는 부분은 동일
				for (var i = 0; i < atcIds3.length; i++) {
					var atcId3 = atcIds3[i].textContent;

					var xhr4 = new XMLHttpRequest();
					var url4 = 'http://apis.data.go.kr/1320000/LosPtfundInfoInqireService/getPtLosfundDetailInfo'; // 포털URL
					var queryParams4 = '?' + encodeURIComponent('serviceKey')
							+ '=' + serviceKey;
					queryParams4 += '&' + encodeURIComponent('pageNo') + '='+ encodeURIComponent('1');
					queryParams4 += '&' + encodeURIComponent('numOfRows') + '='	+ encodeURIComponent('1');
					queryParams4 += '&' + encodeURIComponent('ATC_ID') + '='+ encodeURIComponent(atcId3);
					queryParams4 += '&' + encodeURIComponent('FD_SN') + '='	+ encodeURIComponent('1');

					xhr4.open('GET', url4 + queryParams4);
					xhr4.onreadystatechange = function() {
						if (this.readyState == 4 && this.status == 200) {
							var parser4 = new DOMParser();
							var xmlDoc4 = parser4.parseFromString(
									this.responseText, "text/xml");

							var depPlace = xmlDoc4.querySelector("depPlace").textContent; // 보관장소
							var fdFilePathImg = xmlDoc4
									.querySelector("fdFilePathImg").textContent;
							var fdYmd = xmlDoc4.querySelector("fdYmd").textContent; // 습득 일자
							var fdPrdtNm = xmlDoc4.querySelector("fdPrdtNm").textContent; // 물품명
							var tel = xmlDoc4.querySelector("tel").textContent; // 전화번호

							// 데이터 저장
							itemData.push({
								depPlace : depPlace,
								fdFilePathImg : fdFilePathImg,
								fdYmd : fdYmd,
								fdPrdtNm : fdPrdtNm,
								tel : tel
							});

							renderTable();
						}
					};
					xhr4.send('');
				}
				//checkAllRequestsCompleted();
			}
		};
		xhr3.send(''); // 두 번째 요청 시작

		
		// 세번째 요청
		var additionalQueryParams1 = '?' + encodeURIComponent('serviceKey') + '=' + serviceKey;
		additionalQueryParams1 += '&' + encodeURIComponent('PRDT_NM') + '=' + encodeURIComponent(PRDT_NM);
		additionalQueryParams1 += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent(pageNo);
		additionalQueryParams1 += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent(numOfRows);
		additionalQueryParams1 += '&' + encodeURIComponent('ADDR') + '=' + encodeURIComponent('${sessionScope.mapAddress.jibunAddress}');

		// 새로운 요청 실행
		var xhr5 = new XMLHttpRequest();
		xhr5.open('GET', url1 + additionalQueryParams1);
		xhr5.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) {
		        var parser5 = new DOMParser();
		        var xmlDoc5 = parser5.parseFromString(this.responseText, "text/xml");
		        var atcIds5 = xmlDoc5.getElementsByTagName("atcId");

		        for (var i = 0; i < atcIds5.length; i++) {
		            var atcId5 = atcIds5[i].textContent;

		            var xhr6 = new XMLHttpRequest();
		            var url6 = 'http://apis.data.go.kr/1320000/LosfundInfoInqireService/getLosfundDetailInfo';
		            var queryParams6 = '?' + encodeURIComponent('serviceKey') + '=' + serviceKey;
		            queryParams6 += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1');
		            queryParams6 += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('1');
		            queryParams6 += '&' + encodeURIComponent('ATC_ID') + '=' + encodeURIComponent(atcId5);
		            queryParams6 += '&' + encodeURIComponent('FD_SN') + '=' + encodeURIComponent('1');

		            xhr6.open('GET', url6 + queryParams6);
		            xhr6.onreadystatechange = function() {
		                if (this.readyState == 4 && this.status == 200) {
		                    var parser6 = new DOMParser();
		                    var xmlDoc6 = parser6.parseFromString(this.responseText, "text/xml");

		                    var depPlace = xmlDoc6.querySelector("depPlace").textContent;
		                    var fdFilePathImg = xmlDoc6.querySelector("fdFilePathImg").textContent;
		                    var fdYmd = xmlDoc6.querySelector("fdYmd").textContent;
		                    var fdPrdtNm = xmlDoc6.querySelector("fdPrdtNm").textContent;
		                    var tel = xmlDoc6.querySelector("tel").textContent;

		                    itemData.push({
		                        depPlace: depPlace,
		                        fdFilePathImg: fdFilePathImg,
		                        fdYmd: fdYmd,
		                        fdPrdtNm: fdPrdtNm,
		                        tel: tel
		                    });

		                    renderTable();
		                }
		            };
		            xhr6.send('');
		        }
		        //checkAllRequestsCompleted();
		    }
		};
		xhr5.send('');
 
		
		// 테이블 렌더링 함수
		function renderTable() {
			let detailBody = document.getElementById("detailBody");
			detailBody.innerHTML = ""; // 기존 테이블 내용 제거

			itemData.forEach(function(item) {
				var newRow = detailBody.insertRow();

				var cell1 = newRow.insertCell(0);
				var cell2 = newRow.insertCell(1);
				var cell3 = newRow.insertCell(2);
				var cell4 = newRow.insertCell(3);
				var cell5 = newRow.insertCell(4);

				// 이미지 셀
				if (item.fdFilePathImg) {
					var img = document.createElement("img");
					img.src = item.fdFilePathImg ? item.fdFilePathImg
							: "/resources/images/no_image.png"; // 대체 이미지 경로 수정
					img.alt = "이미지 없음";
					img.width = 100;
					img.height = 100;
					cell1.appendChild(img);
				} else {
					cell1.innerText = "이미지 없음";
				}

				cell2.innerText = item.fdPrdtNm;
				cell3.innerText = item.depPlace;
				cell4.innerText = item.fdYmd;
				cell5.innerText = item.tel;
			});

			// 테이블 표시
			document.getElementById("loading").style.display = "none";
			document.getElementById("detailTable").style.display = "table";
			document.getElementById("lostNotice").style.display = "block";

		}

		// 습득 날짜순 정렬 함수
		function sortTableByDate() {
			if (sortAscending) {
				itemData.sort(function(a, b) {
					return new Date(b.fdYmd) - new Date(a.fdYmd); // 내림차순
				});
			} else {
				itemData.sort(function(a, b) {
					return new Date(a.fdYmd) - new Date(b.fdYmd); // 오름차순
				});
			}
			sortAscending = !sortAscending; // 정렬 방향 토글
			renderTable(); // 정렬 후 테이블 다시 렌더링
		}
	</script>
</body>
</html>