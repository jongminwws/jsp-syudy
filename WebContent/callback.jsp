<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.io.OutputStreamWriter" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="org.json.simple.parser.ParseException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.IOException" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="google-signin-client_id"
	content="YOUR_CLIENT_ID.apps.googleusercontent.com">
<title>로그인  성공</title>
<link
	href="https://db.onlinewebfonts.com/c/67680f2eb947c5cbd58b40961b4a61e9?family=Apple+SD+Gothic+Neo+Bold"
	rel="stylesheet">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<style>
/* body 전체적인 설정*/
body {
	margin: 0;
	padding: 0px;
}

* {
	margin: 0;
	padding: 0;
}

header {
	background-color: #FD6161;
	height: 130px;
	max-width: 1920px;
	min-width: 1440px;
}

.topbar {
	background-color: #ffffff;
	border-radius: 200px 0px 0px 0px/100px 0px 0px 0px;
	height: 100px;
	z-index: 3;
}

.navMenu {
	display: flex;
	justify-content: space-evenly;
	align-items: center;
	height: 100%;
}

.dropdown {
	display: inline-block;
}

.dropbtn {
	border: none;
	background-color: transparent;
	font-size: 1em;
	height: 20px;
	width: 100px;
	margin: 40px auto;
	font-weight: bold;
	font-family: AppleSDGothicNeoEB;
}

.dropbtnLeanguage {
	border: none;
	font-size: 1em;
	background-color: transparent;
	font-family: AppleSDGothicNeoEB;
}

.leanguageMenu {
	width: auto;
	height: auto;
	display: none;
	position: absolute;
	z-index: 5;
}

.dropbtnLeanguage:hover .leanguageMenu {
	display: block;
}

.dropdownMenu {
	width: auto;
	height: auto;
	display: none;
	border-radius: 15px;
	position: absolute;
	background-color: #ffffff;
	z-index: 4;
}

.dropdownMenu a {
	color: #000000;
	margin: 20px 25px;
	border-bottom: 3px solid transparent;
	display: block;
	text-decoration: none;
	text-align: center;
}

.dropdownMenu a:hover {
	border-bottom: 3px solid #FD6161;
	transition: all 0.4s;
}

.dropdown:hover .dropdownMenu {
	display: block;
}

.logo img {
	height: 45px;
	width: 236.5px;
}

.rightMenu {
	position: relative;
	display: inline-block;
}

.rightMenu button {
	text-decoration: none;
	border: none;
	background-color: transparent;
}

/* 뒤에 배경*/
#container {
	height: 100vh;
	max-width: 1920px;
	min-width: 1440px;
	display: flex;
	margin: 0;
	justify-content: center;
	background: linear-gradient(90deg, Violet, Orange);
	align-items: center;
	position: relative;
	overflow: hidden;
	background-size: 100% 100vh;
}

/* 후지산 사진 전체블록 설정*/
#huzi-container {
	position: relative;
	display: flex;
	align-items: center;
	height: 100%;
}

/* 후지산 사진*/
#huzi {
	border: 1px solid black;
	border: none;
	border-radius: 10px 0px 0px 10px;
	box-shadow: -5px 5px 10px gray;
	width: 500px;
	height: 700px;
	padding: auto;
}

/* 후지산 사진 밑에 로고*/
#huzilogo {
	position: absolute;
	bottom: 150px;
	left: 25%;
}

/* main 전체적인 화면*/
#main-container {
	display: flex;
	align-items: center;
}

/* main 화면*/
#main {
	position: relative;
	background-color: white;
	border: none;
	border-radius: 0px 10px 10px 0px;
	width: 500px;
	padding: 10px;
	height: 700px;
	box-shadow: 5px 5px 10px gray;
	box-sizing: border-box;
}

/* 로고 사진*/
#logo {
	margin: 15px auto;
	display: grid;
}

/* 로그인 제목*/
h1 {
	padding-left: 20px;
	margin-bottom: 15px;
	/* 왼쪽 패딩을 추가하여 오른쪽으로 이동 */
}

/*아이디 */
#id {
	float: left;
}

/*비밀번호 */
#password {
	float: left;
}

/*아이디, 비밀번호 찾기 스타일 */
#name, #pass {
	box-sizing: border-box;
	display: block;
	width: 90%;
	height: 2rem;
	border: 0;
	border-bottom: 1px solid #00256c;
	border-radius: 0;
	color: #000;
	font-size: 20px;
}

/*아이디 비밀번호 칸 마우스 클릭했을 때 */
#name:hover, #pass:hover {
	border-width: 0 0 1px;
	border-color: black;
	box-shadow: 0 0 0 1px lightcoral;
	transition: padding .2s, border .2s, background .2s, color .2s,
		box-shadow .2s;
	outline: 0;
	border-bottom-color: transparent;
	border-radius: .2rem;
}

/*비밀번호 저장 체크 박스 위치 */
[type="checkbox"] {
	float: left;
	/* 왼쪽으로 이동 */
	margin-right: 5px;
	/* 원하는 만큼 오른쪽 여백 추가 */
}

/*비밀번호 저장 체크 박스 색상 */
[type="checkbox"] {
	accent-color: red;
}

/*아이디, 저장 체크버튼 */
label[for="checkin"] {
	position: relative;
	top: -5.5px;
	float: left;
}

/*전체적인 라벨 */
#label {
	width: 100%;
	padding: 0 20px;
	box-sizing: border-box;
	text-align: center;
}

/*이건 머임 */
#sw, #sa {
	margin-top: 10px;
	padding: 10px;
	width: 100%;
}

/*로그인 버튼 */
#login {
	background-color: lightcoral;
	width: 95%;
}

#login:hover {
	background: linear-gradient(90deg, Violet, Orange);
}

/*회원가입 버튼 */
.lojo {
	padding: 10px 20px;
	border: 1px solid black;
	color: white;
	border: none;
	background-color: lightcoral;
	position: relative;
	/* 부모 요소(main)를 기준으로 위치 조정 */
	border-radius: 30px 50px 50px 0px;
	text-align: center;
	padding: 10px;
	width: 20%;
	text-decoration: none;
	margin-top: 25px;
	margin-left: auto;
	margin-right: auto;
	font-size: 20px;
	float: right;
	transition: background-color 0.3s;
}

.lojo:hover {
	background: linear-gradient(90deg, Violet, Orange);
	color: white;
}

/*아이디, 비밀번호 찾기 스타일 */
#findid, #findpa {
	display: inline-block;
	text-align: center;
	margin-top: 35px;
	margin-left: 30px;
	text-decoration: none;
	color: black;
	border: 1px solid transparent;
	border-radius: 5px;
	padding: 5px 10px;
	transition: border-color 0.3s;
	background-color: white;
	margin-right: 20px;
	font-size: 15px;
}

#findpa {
	margin-left: 15px;
}

#findid, #findpa>a {
	text-decoration: none;
}

a {
	text-decoration: none;
}

/*아이디, 비밀번호 찾기 마우스 올렸을 때 */
#findid:hover, #findpa:hover {
	border-color: lightcoral;
}

/*main2 구역 */
#main2 {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin-top: 20px;
}

#kakao, #google, #naver {
	width: 100%;
	margin-bottom: 10px;
}

#kakao>a, #google>a, #naver>a {
	display: block;
	width: 100%;
	text-align: center;
	text-decoration: none;
	color: black;
	border: 1px solid black;
	border-radius: 5px;
	padding: 5px;
	border: none;
}

.container {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-top: 50px;
}

.item {
	display: flex;
	align-items: center;
	margin-bottom: 10px;
	border: 1px solid transparent;
	/* 투명한 테두리 설정 */
	padding: 5px;
	/* 내부 여백 조정 */
	border-radius: 20px;
	transition: border-color 0.3s, background-color 0.3s;
}

/* 호버 시 테두리와 배경색 변경 */
.item:hover {
	border-color: lightcoral;
}

/* 이미지에 여백 추가 */
.item img {
	margin-right: 15px;
}

/* 텍스트 스타일 조정 */
.item div {
	display: flex;
	flex-direction: column;
}

.item strong {
	font-size: 18px;
	color: #00256c;
}

.item span {
	color: #555;
}

.item a {
	display: flex;
	align-items: center;
	text-decoration: none;
}

.item div {
	display: flex;
	flex-direction: column;
}

.item span {
	margin-bottom: 5px;
}

footer {
	max-width: 1920px;
	min-width: 1440px;
}

.footerInfos {
	display: flex;
	padding: 0.5% 15%;
	justify-content: space-between;
	text-align: left;
	border-top: 1px solid #939393;
}

.fooerInfoSns {
	display: flex;
}

.footerInfoTitle {
	color: #FD6161;
	font-weight: bold;
	font-size: 1.5em;
}

.snsIcon {
	padding: 10% 8%;
}

.snsIcon a {
	text-decoration: none;
}

.snsIcon img {
	display: flex;
	margin: 0px auto;
}

.snsIcon p {
	color: #000000;
	font-size: 0.3em;
	font-weight: bolder;
}

.footerLinks {
	padding: 0 15%;
}

.links {
	display: flex;
	width: 50%;
	justify-content: space-between;
}

.links a {
	margin-top: 1%;
	color: #000000;
	font-weight: bold;
}

.companyInfo {
	margin-top: 2%
}
</style>
</head>

<body>
	<header>
		<div class="topbar">
			<div class="navMenu">
				<div class="logo">
					<a href="#"> <!--메인화면 이동 링크--> <img src="img/logo.png">
					</a>
				</div>
				<div class="dropdown">
					<button class="dropbtn">항공권예매</button>
					<div class="dropdownMenu">
						<a href="#">항공권 예매</a> <a href="#">단체 예매(10인 이상)</a> <a href="#">항공권
							선물하기</a> <a href="#">이용 안내</a> <a href="#">전자 항공권</a> <a href="#">항공권
							재발행</a>
					</div>
				</div>
				<div class="dropdown">
					<button class="dropbtn">예매 조회</button>
					<div class="dropdownMenu">
						<a href="#">나의 여정</a> <a href="#">여정 변경</a> <a href="#">여정 취소</a>
					</div>
				</div>
				<div class="dropdown">
					<button class="dropbtn">멤버십</button>
					<div class="dropdownMenu">
						<a href="#">제트 멤버십 혜택</a> <a href="#">제트 멤버십 가입</a> <a href="#">멤버십
							가입 해지</a>
					</div>
				</div>
				<div class="dropdown">
					<button class="dropbtn">온라인면세점</button>
					<div class="dropdownMenu">
						<a href="#">공항별 면세점 위치</a> <a href="#">Jet Shop</a> <a href="#">면세점
							이용 안내</a>
					</div>
				</div>
				<div class="rightMenu">
					<button href="#">로그아웃</button>
					<span>&nbsp|&nbsp</span>
					<div class="dropdown">
						<button class="dropdownMen">한국어 / Korean ▼</button>
						<div class="dropdownMenu">
							<a href="#">한국어</a> <a href="#">English</a> <a href="#">日本語</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<main>
        로그인 성공~
        
    </main>
	<footer>
		<div class="footerInfos">
			<div class="fooerInfo">
				<p class="footerInfoTitle">예약센터</p>
				<p>1234-5678</p>
				<p>00:00 ~ 24:00</p>
				<p>연중휴무</p>
			</div>
			<div class="fooerInfo">
				<p class="footerInfoTitle">고객센터</p>
				<p>5678-9123</p>
				<p>00:00 ~ 24:00</p>
				<p>연중휴무</p>
			</div>
			<div class="fooerInfo">
				<p class="footerInfoTitle">점검시간</p>
				<strong><span>월~금</span> </strong> <span>00:00 ~ 24:00</span> <br>
				<strong><span>토~일</span></strong> <span>00:00 ~ 24:00</span>
				<p>(한국시간 기준)</p>
			</div>
			<div class="fooerInfo">
				<p class="footerInfoTitle">마케팅/광고 문의</p>
				<p>wkdwhd43@naver.com</p>
				<p>디자이너 이메일</p>
			</div>
			<div class="fooerInfoSns">
				<div class="snsIcon">
					<a href="#"> <img src="img/instagram.png">
						<p>@___jm109</p>
					</a>
				</div>
				<div class="snsIcon">
					<a href="#"> <img src="img/youtube.png">
						<p>Jet_Airlines</p>
				</div>
				</a>
			</div>
		</div>
		<div class="footerLinks" style="background-color: #8F8F8F;">
			<div class="links">
				<a href="#">
					<p>회사안내</p>
				</a> <a href="#">
					<p>보도자료</p>
				</a> <a href="#">
					<p>채용정보</p>
				</a> <a href="#">
					<p>운송약관</p>
				</a> <a href="#">
					<p>이용약관</p>
				</a> <a href="#">
					<p>개인정보이용안내</p>
				</a>
			</div>
			<div class="companyInfo">
				<p>JetAirlines㈜ 대표이사 곽두팔 사랑시 고백구 행복동 (우)12345</p>
				<p>개인정보보호책임자 강백호</p>
				<p>온라인 마케팅 팀장 김청룡</p>
				<p>Copyright 2024 BY ZET AIRLINES. All Rights reserved</p>
			</div>
		</div>
	</footer>
<%
    String clientId = "RhYUDtcrGAZKn45AMi7b";
    String clientSecret = "tZJcX7bgm9";
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String redirectURI = URLEncoder.encode("http://localhost:8080/jspexample/callback.jsp", "UTF-8");
    String apiURL = "https://nid.naver.com/oauth2.0/token";

    try {
        URL url = new URL(apiURL);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("POST");
        con.setDoOutput(true);
        con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

        // 요청 파라미터 전송
        OutputStreamWriter writer = new OutputStreamWriter(con.getOutputStream());
        writer.write("grant_type=authorization_code&client_id=" + clientId +
                     "&client_secret=" + clientSecret + "&redirect_uri=" + redirectURI +
                     "&code=" + code + "&state=" + state);
        writer.flush();
        writer.close();

        int responseCode = con.getResponseCode();
        BufferedReader br;
        if (responseCode == 200) { // 정상 호출
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
        } else {  // 에러 발생
            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        }
        String inputLine;
        StringBuilder responseStr = new StringBuilder();
        while ((inputLine = br.readLine()) != null) {
            responseStr.append(inputLine);
        }
        br.close();
        // JSON 형태의 응답 데이터를
		JSONParser parser = new JSONParser();
        JSONObject responseObj = (JSONObject) parser.parse(responseStr.toString());

        String accessToken = (String) responseObj.get("access_token");
        String tokenType = (String) responseObj.get("token_type");

        // 여기서 필요에 따라 세션에 저장하거나 다른 작업을 수행할 수 있습니다.
        // 예를 들어, 세션에 accessToken을 저장하는 방법은 다음과 같습니다.
        session.setAttribute("naverAccessToken", accessToken);
        
    } catch (IOException e) {
        // IOException 발생 시 처리
        e.printStackTrace();
        out.println("네이버 로그인 중 오류 발생: " + e.getMessage() + "<br>");
    } catch (ParseException e) {
        // JSON 파싱 오류 발생 시 처리
        e.printStackTrace();
        out.println("네이버 응답 파싱 중 오류 발생: " + e.getMessage() + "<br>");
    }
%>
</body>
</html>