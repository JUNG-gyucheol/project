# GGYUSTORE / 2020.06 - 2020.07
<p align="center"> Main Page Preview </p>
<p align="center"> <img src="https://user-images.githubusercontent.com/59688264/95819100-4e808880-0d60-11eb-9ac0-21c07018a137.png" width="800px"> </p>
<br>

## 주제
* **미니쇼핑몰프로젝트**

## 개발환경
* 개발도구
  * IntelliJ
  * MySQL 8.0.19
  <br>
* 언어
  * JAVA 8 (JDK1.8)
  * JSP(model1)
  * HTML5 / CSS3
  * JavaScript / jQuery
  * JSTL
  * Ajax
  <br>
* 서버
  * Apache Tomcat v 9.0.38
  <br>
* API
  * CKeditor4
 
## 개요

### GGYUSTORE 소개
쇼핑몰을 통해 옷을 구매하고 게시판을 통해 사람들과 공유 할 수 있는 서비스
### 선정이유
패션관련해서 관심이 많았기에 무신사스토어같은 쇼핑몰을 만들고 싶어서 선정하였음
### 주요기능
* 회원가입 / 로그인 / 이메일을 인증을 통한 패스워드찾기 / 정보수정
* 구매기능
* 환불기능
* 관리자페이지  
  * 상품등록 / 수정 / 삭제
  * 회원목록조회
  * 환불내역리스트
  * 구매내역리스트
* 게시판
  * 갤러리게시판
  * 문의게시판
  * 일반게시판

## 회원가입 및 로그인
* Ajax를 이용한 아이디 중복확인체크 및 로그인체크
* 카카오 우편번호 API를 이용하여 주소 찾기기능 구현
<p align="center"><img src="https://user-images.githubusercontent.com/59688264/95819103-504a4c00-0d60-11eb-9638-e81bc0fb0869.png" width="400px" height="400px"></p>
<p align="center"><img src="https://user-images.githubusercontent.com/59688264/95819109-50e2e280-0d60-11eb-9459-4923fa456524.png" width="400px" height="400px"></p>
<br>

## 패스워드찾기
* 이메일을 통해 인증번호를 받아 패스워드 수정
<p align="center"><img src="https://user-images.githubusercontent.com/59688264/95822556-1d578680-0d67-11eb-8ed9-a4238b8f6b8e.png" height="400px"></p>
<br>

## 쇼핑몰 리스트
* 전체 / 상의 / 하의 / 신발 리스트

<p align="center"><img src="https://user-images.githubusercontent.com/59688264/95819125-550f0000-0d60-11eb-8d13-72437e05e786.png" width="500px" height="400px"></p>
<p align="center"><img src="https://user-images.githubusercontent.com/59688264/95819127-55a79680-0d60-11eb-827f-a14b63d51212.png" width="500px" height="400px"></p>
<p align="center"><img src="https://user-images.githubusercontent.com/59688264/95819134-56d8c380-0d60-11eb-9677-9edc8edbd00c.png" width="500px" height="400px"></p>
<p align="center"><img src="https://user-images.githubusercontent.com/59688264/95819136-57715a00-0d60-11eb-9e73-3ab4dd55ccf4.png" width="500px" height="400px"></p>
<br>

## 상품구매
* 상품을 클릭 후 사이즈를 누르면 개수 입력란과 가격 표시 / 구매버튼 / 장바구니 기능구현
* 사이즈 추가 후 취소기능 구현
* 상품구매버튼 클릭 시 구매페이지로 이동 및 구매완료페이지로 이동
<p align="center"><img src="https://user-images.githubusercontent.com/59688264/95824152-c1dac800-0d69-11eb-839e-ca05770f1d25.png" height="400px"></p>
<p align="center"><img src="https://user-images.githubusercontent.com/59688264/95824161-c4d5b880-0d69-11eb-9258-08450d5db448.png" height="400px"></p>
<br>

## 구매내역 및 장바구니
* 구매내역페이지에서 환불기능 구현
* 장바구니페이지에서 구매할 상품을 체크하면 체크한 상품 구매가능 및 장바구니에 있는 상품 삭제기능 구현
<p align="center"><img src="https://user-images.githubusercontent.com/59688264/95824639-9f957a00-0d6a-11eb-98ed-53460f939c43.png" height="400px"></p>
<br>

## 게시판
* 등록 / 검색 / 수정 / 삭제 기능구현
* 댓글 및 대댓글 등록 / 수정 / 삭제 기능구현  
<p align="center"><img src="https://user-images.githubusercontent.com/59688264/95824957-20547600-0d6b-11eb-96fe-1b18f2a899b2.png" height="400px"></p>
<br>

## 갤러리 게시판
* 좋아요 / 이미지다운로드 / 이미지등록 / 삭제 / 수정 / 조회수 기능
* 사진클릭 시 모달창으로 보여짐
<p align="center"><img src="https://user-images.githubusercontent.com/59688264/95825182-70333d00-0d6b-11eb-952c-4531943dd74f.png" height="400px"></p>
<br>
