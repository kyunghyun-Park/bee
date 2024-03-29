<%@ page import="com.bee.www.common.LoginManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    LoginManager lm = LoginManager.getInstance();
    String id = lm.getMemberId(session);
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/index_header.css">
    <link rel="stylesheet" href="css/schoolInfo.css">
    <!--jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"
            integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
            crossorigin="anonymous"></script>
</head>
<body>
<header>
    <div class="header-area">
        <div class="header-main">
            <div class="header-login">
                <%
                    //로그인 상태
                    if (id == null) {
                %>
                <a href="/join.do">
                    <h3 class="join">회원가입</h3>
                </a>
                <a href="/login.do">
                    <h3>로그인</h3></a>
                <% } //로그아웃 상태
                else { %>
                <a href="/profile.do?">
                    <h3 class="join">회원정보</h3>
                </a>
                <a href="/logout.do">
                    <h3>로그아웃</h3>
                </a>
                <% } %>
            </div>

        </div>
    </div>
</header>

<section class="title-section">
    <div class="title-logo">
        <a href="/">
            <img src="../images/GoodBee.png">
        </a>
    </div>
</section>

<div class="main-margin">
    <section class="nav-section">
        <nav>
            <ul>
                <li><a href="/schBoard.do?pn=1&filter=&keyword=&region=" id="schInfo">학원정보</a></li>
                <li><a href="/reviews.do" id="reviewInfo">투데이로그</a></li>
                <li><a href="/freeBoard.do?pn=1&filter=&keyword=&" id="freeInfo">자유게시판</a></li>
            </ul>
        </nav>
    </section>
</div>

</body>

<script type="text/javascript">
    $(function (){
        var freeBoardURL = 'http://localhost:8080/freeBoard.do';
        var freeBoardURL2 = 'http://localhost:8080/freeDetail.do';
        var schBoardURL = 'http://localhost:8080/schBoard.do';
        var schBoardURL2 = 'http://localhost:8080/schDetail.do';
        var reviewURL = 'http://localhost:8080/reviews.do';

        var para = document.location.href.split("?");
        // console.log(para);

        if (para[0] == freeBoardURL ||para[0] == freeBoardURL2 ){
            $('#freeInfo').css('color', 'rgb(12, 167, 179)');
        }else if (para[0] == schBoardURL || para[0] == schBoardURL2){
            $('#schInfo').css('color', 'rgb(12, 167, 179)');
        }else if (para[0] == reviewURL){
            $('#reviewInfo').css('color', 'rgb(12, 167, 179)');
        }
    })
</script>
</html>
