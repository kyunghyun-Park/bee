<%@ page import="com.bee.www.common.LoginManager" %>
<%@ page import="com.bee.www.vo.MemberVo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    LoginManager lm = LoginManager.getInstance();
    String id = lm.getMemberId(session);
    MemberVo vo = (MemberVo) request.getAttribute("vo");
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
    <!--jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"
            integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
            crossorigin="anonymous"></script>
    <!-- Toastr -->
    <link rel="stylesheet" href="../toastr/toastr.css">
    <script src="../toastr/toastr.min.js"></script>
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
                <a href="/logout.do">
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
            <span class="tab signin"><a href="/profile.do?id=<%=id%>">내 정보</a></span>
            <span class="tab signup active"><a href="/profileUpdate.do">비밀번호 변경</a></span>
        </div>
        <div class="profile-body">
            <form action="/profilePasswdProc.do" method="post" onsubmit="return validateCheck()">
                아이디
                <div class="checkBlock">
                    <input name="id" id="id" type="text" value="<%=vo.getId()%>" readonly/>
                </div>
                비밀번호
                <input name="pwd" id="pwd" type="password" minlength="4" maxlength="30"/>
                비밀번호 확인
                <input name="pwd_confirm" id="pwd_confirm" minlength="4" maxlength="30" type="password"/>
                <div class="profile-footer">
                    <a><button>수정</button></a>
                    <button type="button" onclick="location.href='/'">나가기</button>
                </div>
            </form>
        </div>
    </div>
</section>
<script>
    toastr.options = {
        "closeButton": true,
        "positionClass": "toast-top-center",
        "timeOut": 1000
    }
    function validateCheck(){
        var pwd=$('#pwd').val();
        var pwd_confirm=$('#pwd_confirm').val();

        if(!pwd){
            toastr.error('비밀번호를 입력해 주세요.');
            $('#pwd').focus();
            return false;
        }
        if(!pwd_confirm){
            toastr.error('비밀번호 확인을 입력해 주세요.')
            $('#pwd_confirm').focus();
            return false;
        }
        if(pwd!=pwd_confirm){
            toastr.error("비밀번호가 일치하지 않습니다.");
            $('#pwd_confirm').val("");
            $('#pwd_confirm').focus();
            return false;
        }
        var regExpPwd=new RegExp("^.{4,30}$","g");
        if(regExpPwd.exec(pwd)==null){
            toastr.error('잘못된 비밀번호 형식입니다.');
            $('#pwd').val("");
            $('#pwd_confirm').val("");
            $('#pwd').focus();
            return false;
        }
    }
</script>
</body>
</html>
