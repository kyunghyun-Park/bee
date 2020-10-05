<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 가입</title>
    <%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index_header.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">--%>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/index_header.css">
    <link rel="stylesheet" href="css/login.css">
    <!--jquery cdn -->
    <script
            src="https://code.jquery.com/jquery-3.5.1.slim.js"
            integrity="sha256-DrT5NfxfbHvMHux31Lkhxg42LY6of8TaYyK50jnxRnM="
            crossorigin="anonymous"></script>
    <script>
        function validateCheck() {
            var id = $('#id').val();
            var pwd = $('#pwd').val();
            var pwd_confirm = $('#pwd_confirm').val();
            var email = $('#email').val();
            var nick = $('#nick').val();

            if (!id) {
                alert("아이디를 입력해 주세요.");
                $('#id').focus();
                return false;
            }
            if (!pwd) {
                alert("비밀번호를 입력해 주세요.");
                $('#pwd').focus();
                return false;
            }
            if (!pwd_confirm) {
                alert("비밀번호확인을 입력해 주세요.");
                $('#pwd_confirm').focus();
                return false;
            }
            if (pwd != pwd_confirm) {
                $('#pwd').val("");
                $('#pwd_confirm').val("");
                $('#pwd').focus();
                return false;
            }
            if(!email){
                alert("이메일을 입력해 주세요");
                $('#email').focus();
                return false;
            }
            if(!nick){
                alert("닉네임을 입력해 주세요");
                $('#nick').focus();
                return false;
            }

            var regExpId = new RegExp("^[a-z0-9]{4,20}$", "g");
            if (regExpId.exec(id) == null) {
                alert("잘못된 아이디 형식입니다.");
                $('#id').val("");
                $('#id').focus();
                return false;
            }

            var regExpPwd = new RegExp("^.{4,30}$", "g");
            if (regExpPwd.exec(pwd) == null) {
                alert("잘못된 비밀번호 형식입니다.");
                $('#pwd').val("");
                $('#pwd_confirm').val("");
                $('#pwd').focus();
                return false;

            }
            var regExpNick = new RegExp("^[a-z가-힣]{4,20}$", "g");
            if (regExpNick.exec(nick) == null) {
                alert("잘못된 닉네임 형식입니다.");
                $('#nick').val("");
                $('#nick').focus();
                return false;
            }
            var regExpEmail = new RegExp("^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$", "g");
            if (regExpEmail.exec(email) == null) {
                alert("잘못된 이메일 형식입니다.");
                $('#pwd').val("");
                $('#pwd').focus();
                return false;
            }
        }
    </script>
</head>
<body>
<header>
    <div class="header-area">
        <div class="header-main">
            <div class="logo">
                <a href="index.jsp">
                    <h3>Good Bee</h3>
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
                                <a href="index.jsp">
                                    <div class="exit-wrapper">
                                        <svg stroke="currentColor" fill="currentColor" stroke-width="0"
                                             viewBox="0 0 24 24" tabindex="1" height="1em" width="1em"
                                             xmlns="http://www.w3.org/2000/svg">
                                            <path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path>
                                        </svg>
                                    </div>
                                </a>
                                <div class="tabs">
                                    <span class="tab signin"><a href="/login.do">로그인</a></span>
                                    <span class="tab signup active"><a href="/join.do">회원가입</a></span>
                                </div>
                                <div class="content">
                                    <section class="signin-cont cont">
                                        <form action="/joinProc.do" method="post" onsubmit="return validateCheck()">
                                            <input id="id" name="id" type="text" class="inpt" minlength="4"
                                                   maxlength="20" placeholder="Your Id"/>
                                            <input id="pwd" name="pwd" type="password" class="inpt" minlength="4"
                                                   maxlength="30" placeholder="Your Password"/>
                                            <input id="pwd_confirm" name="pwd_confirm" type="password" minlength="4"
                                                   maxlength="30" class="inpt" placeholder="Your Password2"/>
                                            <input id="email" name="email" type="email" class="inpt"
                                                   placeholder="Your Email"/>
                                            <%--<input id="name" name="name" type="text" class="inpt" placeholder="Your Name"/>--%>
                                            <input id="nick" name="nick" type="text" class="inpt"
                                                   placeholder="Your nickName"/>
                                            <div class="submit-wrap">
                                                <input type="submit" value="회원가입" class="submit"/>
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