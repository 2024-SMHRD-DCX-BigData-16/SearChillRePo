프로젝트명

프로젝트 개요

페르소나랑 기타 등등

주요기능

기술스택
사용언어, 라이브러리등

유스케이스

er다이어그램

웹 페이지 이미지

트러블슈팅
### 1. API 요청 최적화

- **문제:** 경찰청 API에서 모든 데이터를 한 번에 받아 테이블을 생성하려다 보니 시간이 오래 걸림.
- **해결:** 요청을 3개로 나누어 데이터를 받는 대로 즉시 테이블을 생성하여 처리 속도를 개선함.

### 2. 습득물 보관장소 선택 오류

- **문제:** 사용자가 보관장소를 선택하지 않으면 오류가 발생함.
- **해결:** 기본값을 위도 0, 경도 180으로 설정하여 미선택 여부를 명확하게 구분함.

### 3. QR 코드 스캔 시 경로 문제

- **문제:** QR 코드로 접속할 경우 URL 경로에 qrScan이 추가되며, 예상과 다른 경로로 이동함. 컨트롤러에서 qrScan 메서드를 거치며 발생한 문제로 예상됨.
- **해결:** QR 스캔이 필요한 기능만 별도의 경로로 매핑하고, QR 스캔과 무관한 기능들은 redirect:/를 사용해 정상적인 경로로 이동하도록 수정함.

팀원 역할

시연영상
