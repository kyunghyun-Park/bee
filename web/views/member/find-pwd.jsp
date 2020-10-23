<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>
    <!-- css -->
    <link rel="stylesheet" type="text/css" href="/css/index.css">
    <link rel="stylesheet" type="text/css" href="/css/index_header.css">
    <link rel="stylesheet" type="text/css" href="/css/login.css">
    <!--jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"
            integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
            crossorigin="anonymous"></script>
    <!-- Toastr -->
    <link rel="stylesheet" href="../toastr/toastr.css">
    <script src="../toastr/toastr.min.js"></script>
    <script>
        toastr.options = {
            "closeButton": true,
            "positionClass": "toast-top-center",
            "timeOut": 1000
        }
        function validateCheck() {
            var id = $('#id').val();
            var email = $('#email').val();

            if (!id) {
                toastr.error("아이디를 입력해 주세요.");
                $('#id').focus();
                return false;
            }

            if (!email) {
                toastr.error("이메일을 입력해 주세요.");
                $('#email').focus();
                return false;
            }
        }
    </script>
</head>
<body>
<header>
    <div class="header-area">
        <div class="header-main">
            <div class="header-login">
                <a href="/">
                    <h1>Good Bee</h1>
                </a>
            </div>
        </div>
    </div>
</header>

<main>
    <div class="back-container2">
        <div class="back-img2">
            <div class="main-container">
                <div class="main-padding">
                    <div class="main-section">
                        <section class="container">
                            <article class="modal">
                                <a href="/"><div class="exit-wrapper">
                                    <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" tabindex="1" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path>
                                    </svg>
                                </div></a>
                                <div class="tabs">
                                    <span class="tab signin active"><a href="/findPwd.do">비밀번호 찾기</a></span>
                                </div>
                                <div class="content">
                                    <section class="signin-cont cont">
                                        <form action="" method="post" onsubmit="validateCheck()">
                                            <div class="otherinput">
                                                <input id="id" name="id" type="text" class="inpt2" placeholder="아이디 입력" style="margin-bottom: 25px;"/>
                                                <input id="email" name="email" type="email" class="inpt2" placeholder="인증받을 이메일 입력" style="margin-bottom: 25px;"/>
                                            </div>
                                            <div class="submit-wrap">
                                                <input type="submit" value="완료" class="submit"/>
                                            </div>

                                        </form>
                                    </section>
                                </div>
                            </article>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
</body>
</html>