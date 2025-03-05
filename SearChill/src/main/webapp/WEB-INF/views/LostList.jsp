<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file="/WEB-INF/views/common/head.jsp" %>

<link rel="stylesheet" href="resources/css/table.css">
<style>
/* ✅ "습득물 조회 결과" 제목 스타일 */
h1 {
    font-size: 35px; /* 제목 크기 */
    font-weight: bold;
    text-align: center;
    color: white;
    background:transparent /* 반투명 배경 */
    padding: 15px;
    border-radius: 10px;
    backdrop-filter: blur(5px); /* 블러 효과 */
    margin-bottom: 20px;
    text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3); /* 텍스트 그림자 */
}

/* ✅ 습득물 테이블 전체 스타일 */
#detailTable {
    width: 100%;
    border-collapse: collapse;
    background: rgba(255, 255, 255, 0.08); /* 부드러운 반투명 배경 */
    border-radius: 10px;
    overflow: hidden;
    margin-top: 20px;
    backdrop-filter: blur(10px);
    box-shadow: 0px 4px 8px rgba(255, 255, 255, 0.2);
    color: white;
}

/* ✅ 테이블 헤더 스타일 */
#detailTable th {
    background: rgba(255, 255, 255, 0.15); /* 살짝 밝은 톤 */
    color: white;
    font-weight: bold;
    padding: 15px;
    text-align: center;
    border-bottom: 2px solid rgba(255, 255, 255, 0.3);
}

/* ✅ 테이블 셀 스타일 */
#detailTable td {
    padding: 12px;
    text-align: center;
    border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}

/* ✅ 홀수 행 배경 */
#detailTable tbody tr:nth-child(odd) {
    background: rgba(255, 255, 255, 0.05);
}

/* ✅ 짝수 행 배경 */
#detailTable tbody tr:nth-child(even) {
    background: rgba(255, 255, 255, 0.12);
}

/* ✅ 이미지 셀 */
#detailTable img {
    max-width: 100px;
    height: auto;
    display: block;
    margin: 0 auto;
    border-radius: 5px;
    box-shadow: 0px 2px 6px rgba(255, 255, 255, 0.3);
}

/* ✅ 정렬 버튼 (⇅) 스타일 */
.sort-btn {
    background: rgba(255, 255, 255, 0.2);
    border: none;
    color: white;
    font-size: 14px;
    font-weight: bold;
    padding: 5px 8px;
    cursor: pointer;
    border-radius: 50%;
    transition: all 0.3s ease-in-out;
    width: 26px;
    height: 26px;
    display: inline-flex;
    justify-content: center;
    align-items: center;
}

/* ✅ 정렬 버튼 hover 효과 */
.sort-btn:hover {
    background: rgba(255, 255, 255, 0.4);
    transform: scale(1.1);
}

/* ✅ 정렬 버튼 active (눌렀을 때) 효과 */
.sort-btn:active {
    background: rgba(255, 255, 255, 0.6);
    transform: scale(1.05);
}
/* ✅ 페이지네이션 스타일 */
#tabs ul {
    display: flex;
    justify-content: center;
    list-style: none;
    padding: 10px;
    background: rgba(255, 255, 255, 0.1); /* 반투명 회색 */
    border-radius: 10px;
    backdrop-filter: blur(8px);
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2);
}

#tabs ul li {
    margin: 0 5px;
}

#tabs ul li a {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 35px;
    height: 35px;
    font-size: 16px;
    font-weight: bold;
    color: white;
    text-decoration: none;
    background: rgba(255, 255, 255, 0.1);
    border-radius: 8px;
    transition: all 0.3s ease-in-out;
}

/* ✅ 현재 페이지 스타일 */
#tabs ul li a.current-page {
    background: rgba(255, 255, 255, 0.4);
    box-shadow: 0px 0px 10px rgba(255, 255, 255, 0.3);
}

/* ✅ 호버 효과 */
#tabs ul li a:hover {
    background: rgba(255, 255, 255, 0.3);
    transform: scale(1.1);
}

/* ✅ 페이지 이동 입력창 */
#tabs input[type="text"] {
    width: 40px;
    height: 30px;
    text-align: center;
    font-size: 16px;
    color: white;
    background: rgba(255, 255, 255, 0.2);
    border: none;
    border-radius: 5px;
    outline: none;
    justify-content: center;
}

/* ✅ 페이지 이동 버튼 */
#tabs input[type="submit"] {
    height: 35px;
    font-size: 14px;
    font-weight: bold;
    color: white;
    background: rgba(255, 255, 255, 0.1);
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: all 0.3s ease-in-out;
}

#tabs input[type="submit"]:hover {
    background: rgba(255, 255, 255, 0.4);
}


/* ✅ 하단 안내 문구 정리 */
#lostNotice {
    width: 100%;
    text-align: center;
    padding: 10px;
    border-radius: 5px;
    font-size: 24px;
    color: white;
    text-shadow: 3px 3px 10px rgba(255, 255, 255, 0.4);
    margin-top: 20px;
}

/* ✅ 로딩 스피너 */
#loading {
    border: 8px solid rgba(255, 255, 255, 0.2);
    border-top: 8px solid #A7E0E2;
    border-radius: 50%;
    width: 80px;
    height: 80px;
    animation: spin 1.5s linear infinite;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    z-index: 20;
}

@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}

</style>
</head>
<body>

	<div id="fh5co-page">

	 <%@ include file="/WEB-INF/views/common/fh5co-aside.jsp" %>

		<div id="fh5co-main">
			<div class="fh5co-narrow-content">
				<div class="row row-bottom-padded-md flex-center">
					<div class="col-md-9 animate-box " data-animate-effect="fadeInLeft">

						<!-- 내용 -->
		
	<h1>습득물 조회 결과</h1>

	<!-- 세부 정보 테이블 -->
	<table id="detailTable" class="table table-bordered" border="1px" style="display: none;">
    <thead>
        <tr>
            <th>이미지</th>
            <th>물품명</th>
            <th width="120px">보관 장소</th>
            <th width="120px">습득 날짜
                <button class="sort-btn" onclick="sortTableByDate()">⇅</button>
            </th>
            <th>전화번호</th>
        </tr>
    </thead>
    <tbody id="detailBody"></tbody>
</table>
</div>
<!-- 페이지 -->

<div id="tabs">
  <ul>

<%
    String currentPage = request.getParameter("pageNo"); // 현재 페이지 번호 파라미터로 받기
    if (currentPage == null || currentPage.isEmpty()) {
        currentPage = "1"; // 기본값으로 1페이지 설정
    }
	for(int i =1; i<=10; i++){
	%>
    <li><a href="submitAddress?roadAddress=${sessionScope.mapAddress.roadAddress}&jibunAddress=${sessionScope.mapAddress.jibunAddress}&PRDT_NM=${sessionScope.mapAddress.PRDT_NM}&pageNo=<%=i %>"
    <% if (String.valueOf(i).equals(currentPage)) { // 현재 페이지 번호와 버튼 번호 비교 %>
        class="current-page"
    <% } %>
    ><span><%=i %></span></a></li>
<% }
%>
</ul>
<div style="text-align:center; margin-top: 10px;">
    <form action="submitAddress">
        <input type="text" name="roadAddress" value="${sessionScope.mapAddress.roadAddress}" style="display: none">
        <input type="text" name="jibunAddress" value="${sessionScope.mapAddress.jibunAddress}" style="display: none">
        <input type="text" name="pageNo" size="1">
        <input type="submit" value="이동">
    </form>

</div>

</div>

	<h3 id="lostNotice" style="display: none;">분실자는 신분을 증명할 수 있는 서류를 지참하고 보관 기관을 방문하여<br>물품을 수령하시기 바랍니다❕</h3>

						<!-- 내용끝 -->

					</div>
				</div>
			</div>
	<div id="loading"></div>
<div class="table-responsive">
		</div>
	</div>

<%@ include file="/WEB-INF/views/common/bodyScripts.jsp" %>

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
							: "./resources/images/no_image.png"; // 대체 이미지 경로 수정
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