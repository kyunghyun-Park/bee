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
    <link rel="shortcut icon" href="../images/basic.jpg" type="image/x-icon">
    <link rel="icon" href="../images/basic.jpg" type="image/x-icon">
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
        var resultEmail = 1;
        function checkEmail() {
            var email = $('#email').val();

            if (email == '') {     //이메일 미입력
                $('#email_check').html('이메일을 입력해 주세요!').css('color', 'red');
                $('#email').focus();
                return;
            }
            var regExpEmail = new RegExp("^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$", "g");
            if (regExpEmail.exec(email) == null) {
                toastr.error("잘못된 이메일 형식입니다.");
                $('#email').val("");
                $('#email').focus();
                return false;
            }
            if(email=='<%=vo.getEmail()%>'){
                toastr.error('현재 이메일과 같습니다.');
                $('#email').focus();
                return false;
            }

            $.ajax({
                url: "/checkEmail.ajax"
                , type: "post"
                , data: {email: email}
                , dataType: "json"
                , error: function () {
                    console.log("서버 통신 실패");
                }
                , success: function (data) {
                    console.log("서버 통신 성공");

                    if (data.count == 0) {      //0 email미중복
                        resultEmail = 0;
                        console.log("success if resultEmail = " + resultEmail);
                        $('#email_check').html('사용 가능한 이메일').css('color', 'blue');
                    } else {                    //1 중복
                        resultEmail = 1;
                        console.log("success else resultEmail = " + resultEmail);
                        $('#email_check').html('사용 불가능한 이메일').css('color', 'red');
                        $('#email').val('');
                        $('#email').focus();
                    }
                }
            })
        }

        function initCheckEmail() {
            resultEmail = 1;  //id 칸에 다시 입력할 때 count 1로 초기화
            console.log("keyup result = " + resultEmail);
            $('#email_check').html('이메일 입력').css('color', '#9aa8d0');
        }

        function updateSubmit() {
            var email = $('#email').val();
            var nick = $('#nick').val();

            if(resultEmail==1){
                if(email!="<%=vo.getEmail()%>"){    //현재 이메일과 다르면
                    toastr.error('이메일 중복체크 하세요');
                    if ($('#email').val() == '') {
                        $('#email').focus();
                    }
                    return false;
                }
            }

            if (!email) {
                toastr.error("이메일을 입력해 주세요");
                $('#email').focus();
                return false;
            }
            if (!nick) {
                toastr.error("닉네임을 입력해 주세요");
                $('#nick').focus();
                return false;
            }
            var regExpNick = new RegExp("^[a-z가-힣]{3,20}$", "g");
            if (regExpNick.exec(nick) == null) {
                toastr.error("잘못된 닉네임 형식입니다.");
                $('#nick').val("");
                $('#nick').focus();
                return false;
            }
            var regExpEmail = new RegExp("^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$", "g");
            if (regExpEmail.exec(email) == null) {
                toastr.error("잘못된 이메일 형식입니다.");
                $('#email').val("");
                $('#email').focus();
                return false;
            }
        }

        function deleteMember() {
            if(confirm('탈퇴하시겠습니까?')==true) {
                location.href='/deleteMember.do';

            }else{
                return;
            }
        }
    </script>
</head>
<body>
<header>
    <div class="header-area">
        <div class="header-main">
            <div class="header-login">
                <%
                    //로그인 상태
                    if(id==null){
                %>
                <a href="/join.do">
                    <h3 class="join">회원가입</h3>
                </a>
                <a href="/login.do">
                    <h3>로그인</h3></a>
                <% } //로그아웃 상태
                else { %>
                <a href="/profile.do?id=<%=id%>">
                    <h3 class="join">회원정보</h3>
                </a>
                <a href="/logout.do">
                    <h3>로그아웃</h3>
                </a>
                <% }  %>
            </div>
        </div>
    </div>
</header>

<section class="Chat-container">
    <div class="all-margin">
        <form action="/profileImgUpdate.do" method="post" enctype="multipart/form-data">
            <div class="img-section">
                <div class="img-area">
                    <img id="image_section" src="../resources/img/<%=vo.getNewFileName()%>" alt=""/>
                    <label for="imgFile" class="del-button img-up">
                        <input type="file" id="imgFile" name="imgFile" accept=".jpg, .png, .jpeg, .gif" value=""/>업로드
                    </label>
                    <button class="up-button" type="submit">저장</button>
                    <button class="del-button" type="button" onclick="delImg()">제거</button>
                </div>
            </div>
        </form>
        <form action="/profileUpdate.do" method="post" onsubmit="return updateSubmit()">
            <div class="profile-section">
                <div class="nickname">
                    <div class="wrapper">
                        <div class="title-wrapper">
                            <h3>닉네임</h3>
                        </div>
                        <div class="content-wrapper">
                            <div class="contents cont"><%=vo.getNickname()%></div>
                            <div class="contents-input cont" style="display: none;">
                                <input id="nick" name="nick" class="fixName-input" type="text" value="<%=vo.getNickname()%>"/>
                            </div>
                        </div>
                        <div class="edit-wrapper">
                            <button class="tab fix-button active" type="button">수정</button>
                            <button class="tab update-button" type="submit">저장</button>
                        </div>
                    </div>
                </div>
                <div class="nickname">
                    <div class="wrapper">
                        <div class="title-wrapper">
                            <h3>이메일</h3>
                        </div>
                        <div class="content-wrapper">
                            <div class="contents cont"><%=vo.getEmail()%></div>
                            <div class="contents-input cont" style="display: none;">
                                <input id="email" name="email" class="fixName-input" type="email"
                                       value="<%=vo.getEmail()%>" oninput="initCheckEmail()"/>
                            </div>
                        </div>
                        <div class="edit-wrapper">
                            <button class="checkButton" onclick="checkEmail()" type="button">중복확인</button>
                        </div>
                    </div>
                </div>
                <p id="email_check">이메일 중복확인 텍스트 자리</p>
                <div class="leave">
                    <div class="wrapper">
                        <div class="title-wrapper">
                            <h3></h3>
                        </div>
                        <div class="content-wrapper">
                            <div class="contents">
                                <button type="button" class="leave-button" onclick="deleteMember()">회원탈퇴</button>
                            </div>
                        </div>
                        <div class="content-wrapper2">
                            <a href="/" class="up-button" >나가기</a>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</section>

<script>
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#image_section').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }
    $("#imgFile").change(function () {
        readURL(this);
    });

    function delImg(){
        $('#image_section').removeAttr('src');
    }


    $('.edit-wrapper .tab').click(function () {
        if ($(this).hasClass('fix-button')) {
            $('.edit-wrapper .tab').removeClass('active');
            $('.update-button').addClass('active');
            $('.cont').hide();
            $('.contents-input').show();
        }
        if ($(this).hasClass('update-button')) {
            $('.edit-wrapper .tab').removeClass('active');
            $('.fix-button').addClass('active');
            $('.cont').hide();
            $('.contents').show();
        }
    });
</script>
</body>
</html>
