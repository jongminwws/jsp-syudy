<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">

    <!-- Google Fonts - Nanum Gothic -->
    <link href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css" rel="stylesheet">

    <style>
        html, body {
            height: 100%;
            margin: 0;
            font-family: "Nanum Gothic", arial, helvetica, sans-serif;
            background-repeat: no-repeat;
            background-color: #f8f9fa; /* 배경색 추가 */
        }

        .card {
            width: 25rem;
            margin: 0 auto;
            margin-top: 30px;
            background-color: #fff; /* 카드 배경색 추가 */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
            padding: 20px;
            border-radius: 10px; /* 카드 모서리 둥글게 */
        }

        .card-title {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-signin .form-control {
            position: relative;
            height: auto;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            padding: 10px;
            font-size: 16px;
            margin-bottom: 10px; /* 간격 추가 */
        }

        .btn-primary {
            background-color: #dc3545; /* 버튼 배경색 변경 */
            border-color: #dc3545; /* 버튼 테두리색 변경 */
            font-weight: bold;
        }

        .btn-primary:hover {
            background-color: #c82333; /* 버튼 호버 배경색 변경 */
            border-color: #bd2130; /* 버튼 호버 테두리색 변경 */
        }

        .links {
            text-align: center;
            margin-top: 20px;
        }

        .links form {
            display: inline-block;
        }

        .links form input[type="submit"] {
            background-color: transparent;
            border: none;
            color: #dc3545;
            cursor: pointer;
            font-size: 14px;
            font-weight: bold;
            text-decoration: underline;
            margin: 0 5px;
            padding: 0;
        }

        .links form input[type="submit"]:hover {
            color: #bd2130;
        }

        .text2 {
            color: blue;
        }

        .check {
            color: red;
        }
    </style>

    <title>아이디 찾기</title>
</head>

<body>
<div class="card">
    <div class="card-title">
        <h2><img src="img/logo.png" alt="로고 이미지"></h2>
    </div>

    <div class="card-body">
        <form action=findidserver.jsp class="form-signin" method="POST">
            <input type="text" name="name" id="name" class="form-control" placeholder="이름" required autofocus><br>

            <input type="email" name="email" id="email" class="form-control" placeholder="이메일" required><br>

            <p class="check" id="check"></p><br/>
            <button class="btn btn-lg btn-primary btn-block" type="submit">아이디 찾기</button>
        </form>
    </div>

    <div class="links">
        <form action="findpa.jsp" method="post">
            <input type="submit" value="비밀번호 찾기">
        </form>
        |
        <form action="mainLogin.jsp" method="post">
            <input type="submit" value="로그인">
        </form>
        |
        <form action="join.jsp" method="post">
            <input type="submit" value="회원가입">
        </form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    $("#name").focusout(function () {
        if ($('#name').val() == "") {
            $('#check').text('이름을 입력해주세요.');
            $('#check').css('color', 'red');
        } else {
            $('#check').hide();
        }
    });

    $("#email").focusout(function () {
        if ($('#email').val() == "") {
            $('#check').text('이메일을 입력해주세요');
            $('#check').css('color', 'red');
        } else {
            $('#check').hide();
        }
    });
    function findID() {
        var name = document.getElementById('name').value;
        var email = document.getElementById('email').value;

        // AJAX 요청
        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'findidserver.jsp', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var response = xhr.responseText;
                alert(response); // 응답을 알림으로 표시
                location.href = '<%= request.getContextPath() %>/mainLogin.jsp'; // 메인 로그인 페이지로 이동
            }
        };
        xhr.send('name=' + encodeURIComponent(name) + '&email=' + encodeURIComponent(email));
    }
</script>

</body>
</html>
