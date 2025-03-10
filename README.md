프로젝트명

SearChill

프로젝트 개요

주제: QR 코드 기반 분실물 찾기 서비스 및 경찰청 API 기반 분실물 등록 현황 지도 웹서비스


- QR 코드 발급 기능을 통해 소유자가 직접 물건에 부착 가능
- 습득자가 QR 코드를 스캔하고 분실물 정보를 입력하면 분실자에게 전달되는 시스템 제공
- 사용자가 분실물을 등록하고 쉽게 찾을 수 있도록 지원
- 지도 기반 검색을 통해 주변 분실물 센터에서 보관 중인 분실물 확인 가능


- QR 코드를 통해 분실물 정보 등록 시 알림 발송 서비스
- Kakao Map API와 경찰철 API를 통해 위치기반 분실물 등록 현황을 확인할 수 있는 서비스
- 회원 ID를 통해 고유 QR코드를 발급해주는 서비스

페르소나

● 남숙희(25세, 사회초년생)
- 출퇴근이 바쁘고 소지품을 많이 들고 다님
- 지갑이나 디지털 기기(스마트폰, 에어팟)를 자주 잃어버림
● 니즈 
- 잃어버린 물건을 빠르게 찾을 수 있는 서비스
- 물건을 주운 사람이 쉽게 주인을 찾고 연락할 수 있는 시스템
● Pain Point
- 물건을 잃어버리면 어디서부터 찾아야 할지 막막함
- 누군가 물건을 주워도 자신에게 연락할 방법이 없음
● 행동패턴
- 스마트폰을 활용해 문제를 빠르게 해결하려고 함
- 복잡한 절차 없이 직관적이고 간편한 서비스를 선호

주요기능

● 사용자 ID기반 QR코드를 발급해 습득자가 분실자에게
    연락이 가능
● QR코드를 스캔하고 습득물 데이터를 입력해 분실자에게 전송,
    연락처를 확인하고 연락, 분실자에게 email 전송
● 분실물 지도로 주변 분실물 센터에 보관 중인 분실물과
    웹사이트에 등록된 분실물 확인
● 습득물을 등록해 분실물 지도에 분실물 마커를 등록





기술스택
사용언어, 라이브러리등
- **언어**: Java(JDK1.8), JavaScript, Python
- **개발 도구**: STS, vscode, Colab, Jupyter
- **프레임워크 및 라이브러리**: Spring, Bootstrap, MyBatis, ZXing, Selenium, Pandas, Numpy, Matplotlib
- **서버 환경**: Apache Tomcat
- **데이터베이스**: MySQL
- **버전 관리 및 협업**: GitHub, Notion
- **API 활용**: 경찰청 API, Naver Works Mail API, Kakao Map API

유스케이스
![image](https://github.com/user-attachments/assets/1c385605-f3ba-43c4-bd9b-2e6a099b7bb7)

er다이어그램

![image](https://github.com/user-attachments/assets/d01cdb93-e93e-4656-b546-8a2572a15969)

웹 페이지 이미지

메인

![image](https://github.com/user-attachments/assets/25e095ac-a792-4f1a-aa2d-4fc019652567)

QR다운로드

![image](https://github.com/user-attachments/assets/6315c7fd-43b0-46e4-97d7-7b53211b48ae)

습득물 등록

![image](https://github.com/user-attachments/assets/0e4b98fa-e361-41e0-8dc2-c4963a2aa9db)

습득물 정보

![image](https://github.com/user-attachments/assets/e3491e51-42b7-4a52-abf4-ba30cd13b3ff)

습득물 조회

![image](https://github.com/user-attachments/assets/9fedc251-7421-403c-a69b-ba8defa03a27)


트러블슈팅
### 1. API 요청 최적화

- **문제:** 경찰청 API에서 모든 데이터를 한 번에 받아 테이블을 생성하려다 보니 시간이 오래 걸림.
- **해결:** 요청을 3개가 데이터를 받는 대로 즉시 테이블을 생성하여 처리 속도를 개선함.

### 2. 습득물 보관장소 선택 오류

- **문제:** 사용자가 보관장소를 선택하지 않으면 오류가 발생함.
- **해결:** 기본값을 위도 0, 경도 180으로 설정하여 미선택 여부를 명확하게 구분함.

### 3. QR 코드 스캔 시 경로 문제

- **문제:** QR 코드로 접속할 경우 URL 경로에 qrScan이 추가되며, 예상과 다른 경로로 이동함. 컨트롤러에서 qrScan 메서드를 거치며 발생한 문제로 예상됨.
- **해결:** QR 스캔이 필요한 기능만 별도의 경로로 매핑하고, QR 스캔과 무관한 기능들은 redirect:/를 사용해 정상적인 경로로 이동하도록 수정함.

팀원 역할
![image](https://github.com/user-attachments/assets/f242b5a2-418b-416d-b4fb-9b338c67516f)

시연영상


https://github.com/user-attachments/assets/db12f83b-a8fb-4259-b306-216587cb6fd1

