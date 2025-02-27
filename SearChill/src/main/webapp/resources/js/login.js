document.addEventListener("DOMContentLoaded", function() {
    const loginOverlay = document.getElementById("loginOverlay");

    if (loginOverlay) {
        console.log("🔹 loginOverlay 요소 찾음");

        // 로그인 팝업 열기
        function openLoginPopup() {
            loginOverlay.style.display = "flex";
            document.body.classList.add("modal-open"); // 🔥 배경 흐리게 적용
            console.log("✅ 로그인 팝업 열림");
        }

        // 로그인 팝업 닫기 (Spring MVC의 `/goMain`으로 이동)
        function closeLoginPopup() {
            document.body.classList.remove("modal-open");
            loginOverlay.style.display = "none";
            console.log("✅ 로그인 팝업 닫힘");

            setTimeout(() => { 
                window.location.href = "goMain";
            }, 300);
        }

        // 닫기 버튼(X)에 이벤트 리스너 추가
        document.querySelector(".close-btn").addEventListener("click", closeLoginPopup);

        // 자동으로 로그인 팝업 열기
        openLoginPopup();
    } else {
        console.error("❌ loginOverlay 요소를 찾을 수 없음");
    }
});
