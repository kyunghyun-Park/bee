<%@ page import="com.bee.www.common.LoginManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    LoginManager lm = LoginManager.getInstance();
    String id = lm.getMemberId(session);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/index_header.css">
    <link rel="stylesheet" href="css/profile.css">
</head>
<body>
<header>
    <div class="header-area">
        <div class="header-main">
            <svg width="17" height="17" viewBox="0 0 17 17">
                <path fill-rule="evenodd" d="M13.66 7.36a6.3 6.3 0 1 1-12.598 0 6.3 6.3 0 0 1 12.598 0zm-1.73 5.772a7.36 7.36 0 1 1 1.201-1.201l3.636 3.635c.31.31.31.815 0 1.126l-.075.075a.796.796 0 0 1-1.126 0l-3.636-3.635z" clip-rule="evenodd"></path>
            </svg>
            <div class="header-filter">
                <input type="text" placeholder="검색할 내용.."/>
            </div>
            <div class="header-login">
                <a href="#">
                    <h3 class="join">회원정보</h3>
                </a>
                <a href="index.html">
                    <h3>로그아웃</h3>
                </a>
            </div>

        </div>
    </div>
</header>


<section class="container">
    <div class="auto-margin">
        <div class="profile-title">
            <h2>회원정보 수정</h2>
        </div>
        <div class="tabs">
            <span class="tab signin active"><a href="/profile.do">내 정보</a></span>
            <span class="tab signup"><a href="/profileUpdate.do">비밀번호 변경</a></span>
        </div>
        <div class="profile-body">
            <form>
                아이디
                <div class="checkBlock">
                    <input name="id" id="id" type="text" minlength="4" maxlength="30"/>
                    <button class="checkButton">중복확인</button>
                </div>
                이메일
                <div class="checkBlock">
                    <input id="email" name="email" type="email"/>
                    <button class="checkButton">중복확인</button>
                </div>
                <div class="profile-footer">
                    <button>수정</button>
                    <button id="go-back">나가기</button>
                    <!-- 나가기 버튼 안되는데 나중에 수정 -->
                </div>
            </form>

        </div>
    </div>
</section>

<script text="text/javascript">
    document.getElementById('go-back').addEventListener('click', () => {
        console.log("??")
        window.history.back();
    });
</script>
</body>
</html>
