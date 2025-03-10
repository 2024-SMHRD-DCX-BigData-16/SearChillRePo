# 📌 SearChill

## 🚀 프로젝트 개요

**주제:** QR 코드 기반 분실물 찾기 서비스 및 경찰청 API 기반 분실물 등록 현황 지도 웹서비스

- QR 코드 발급 기능을 통해 소유자가 직접 물건에 부착 가능
- 습득자가 QR 코드를 스캔하고 분실물 정보를 입력하면 분실자에게 전달되는 시스템 제공
- 분실자가 QR코드 개인정보 제공 여부 동의 시 습득자가 연락처 확인 가능 
- 사용자가 분실물을 등록하고 쉽게 찾을 수 있도록 지원
- 지도 기반 검색을 통해 주변 분실물 센터에서 보관 중인 분실물 확인 가능

---

## 🎯 주요 기능

- 사용자 ID 기반 QR코드를 발급해 습득자가 분실자에게 연락 가능
- QR코드를 스캔하고 습득물 데이터를 입력해 분실자에게 전송 및 연락처 확인 가능 (이메일 자동 전송)
- 지도상으로 주변 분실물 센터와 웹사이트 등록 분실물 현황 확인 가능
- 습득물을 지도에 등록하여 마커로 표시

---

## 👤 페르소나

### **남숙희(25세, 사회초년생)**

- 출퇴근이 바쁘고 소지품을 많이 들고 다님
- 지갑이나 디지털 기기(스마트폰, 에어팟)를 자주 잃어버림

**니즈**
- 잃어버린 물건을 빠르게 찾을 수 있는 서비스
- 습득자가 쉽게 주인을 찾아 연락할 수 있는 시스템

**Pain Point**
- 물건을 잃어버리면 어디서부터 찾아야 할지 막막함
- 습득자가 연락할 방법이 없음

**행동 패턴**
- 스마트폰을 활용해 문제를 빠르게 해결하려고 함
- 복잡한 절차 없이 직관적이고 간편한 서비스 선호

---

## 🛠 기술 스택

| 분류 | 내용 |
|------|------|
| **언어** | Java(JDK1.8), JavaScript, Python |
| **개발 도구** | STS, vscode, Colab, Jupyter |
| **프레임워크 및 라이브러리** | Spring, Bootstrap, MyBatis, ZXing, Selenium, Pandas, Numpy, Matplotlib |
| **서버 환경** | Apache Tomcat |
| **데이터베이스** | MySQL |
| **버전 관리 및 협업** | GitHub, Notion |
| **API 활용** | 경찰청 API, Naver Works Mail API, Kakao Map API |

---

## 📑 유스케이스 다이어그램

<img src="https://github.com/user-attachments/assets/1c385605-f3ba-43c4-bd9b-2e6a099b7bb7" width="600px">

---

## 📊 ER 다이어그램

<img src="https://github.com/user-attachments/assets/d01cdb93-e93e-4656-b546-8a2572a15969" width="600px">

---

## 🌐 웹 페이지 미리보기

### 메인 페이지
<img src="https://github.com/user-attachments/assets/25e095ac-a792-4f1a-aa2d-4fc019652567" width="700px">

<table>
  <tr>
    <td align="center">
      <strong>QR 다운로드 페이지</strong><br>
      <img src="https://github.com/user-attachments/assets/6315c7fd-43b0-46e4-97d7-7b53211b48ae" width="500px" height="800px">
    </td>
    <td align="center">
      <strong>습득물 등록 페이지</strong><br>
      <img src="https://github.com/user-attachments/assets/0e4b98fa-e361-41e0-8dc2-c4963a2aa9db" width="500px" height="800px">
    </td>
  </tr>

  <tr>
    <td align="center">
      <strong>습득물 정보 페이지</strong><br>

      <img src="https://github.com/user-attachments/assets/e3491e51-42b7-4a52-abf4-ba30cd13b3ff" width="700px" height="500px">
    </td>
    <td align="center">
      <strong>습득물 조회 페이지</strong><br>
      <img src="https://github.com/user-attachments/assets/9fedc251-7421-403c-a69b-ba8defa03a27" width="700px" height="500px">
    </td>
  </tr>
</table>

---

## 🚨 트러블슈팅

### 1. API 요청 최적화
- **문제:** 경찰청 API 데이터를 한 번에 모두 요청하여 처리 시간이 오래 걸림.
- **해결:** 데이터를 나누어 요청한 뒤 즉시 테이블 생성으로 처리 속도 개선.

### 2. 습득물 보관장소 선택 오류
- **문제:** 사용자가 보관장소를 미선택 시 오류 발생.
- **해결:** 기본값을 위도 0, 경도 180으로 설정하여 미선택 여부 명확히 구분.

### 3. QR 코드 스캔 시 경로 문제
- **문제:** QR 코드 접속 시 예상치 못한 경로로 이동됨(qrScan 추가 경로 문제).
- **해결:** QR 관련 기능에만 별도의 경로 매핑을 하고 무관한 기능은 redirect를 사용해 정상 경로로 이동하도록 수정.

---


## 🙋 팀원 역할 분담

<img src="https://github.com/user-attachments/assets/f242b5a2-418b-416d-b4fb-9b338c67516f" width="600px">


---

## 📽 시연 영상

[▶ 시연 영상 보러가기](https://github.com/user-attachments/assets/db12f83b-a8fb-4259-b306-216587cb6fd1)

---  

