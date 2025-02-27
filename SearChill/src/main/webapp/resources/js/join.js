document.addEventListener("DOMContentLoaded", function() {
    const joinOverlay = document.getElementById("joinOverlay");

    if (joinOverlay) {
        console.log("🔹 joinOverlay 요소 찾음");

        // 회원가입 팝업 열기
        function openJoinPopup() {
            joinOverlay.style.display = "flex";
            document.body.classList.add("modal-open");
            console.log("✅ 회원가입 팝업 열림");
        }

        // 회원가입 팝업 닫기 (Spring MVC의 `/goMain`으로 이동)
        function closeJoinPopup() {
            document.body.classList.remove("modal-open");
            joinOverlay.style.display = "none";
            console.log("✅ 회원가입 팝업 닫힘");

            setTimeout(() => { 
                window.location.href = "goMain";
            }, 300);
        }

        document.querySelector(".close-btn").addEventListener("click", closeJoinPopup);
        openJoinPopup();
    } else {
        console.error("❌ joinOverlay 요소를 찾을 수 없음");
    }
});

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
						$("#resultCheck").text("사용할 수 있는 아이디");
					} else {
						$("#resultCheck").text("사용할 수 없는 아이디");
					}
				},
				error : function() {
					alert("통신 실패!!");
				}
			});
		}

