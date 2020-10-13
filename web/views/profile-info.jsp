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

    <script>
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
                alert("잘못된 이메일 형식입니다.");
                $('#email').val("");
                $('#email').focus();
                return false;
            }

            $.ajax({
                url: "/checkEmail.ajax"
                , type: "post"
                , data: {email: email}
                , datatype: "json"
                , error: function () {
                    console.log("서버 통신 실패");
                }
                , success: function () {
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

           /* if (resultEmail == 1) {
                alert('이메일 중복체크 하세요');
                if ($('#email').val() == '') {
                    $('#email').focus();
                }
                return false;
            }*/

            if (!email) {
                alert("이메일을 입력해 주세요");
                $('#email').focus();
                return false;
            }
            if (!nick) {
                alert("닉네임을 입력해 주세요");
                $('#nick').focus();
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
                $('#email').val("");
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
            <svg width="17" height="17" viewBox="0 0 17 17">
                <path fill-rule="evenodd"
                      d="M13.66 7.36a6.3 6.3 0 1 1-12.598 0 6.3 6.3 0 0 1 12.598 0zm-1.73 5.772a7.36 7.36 0 1 1 1.201-1.201l3.636 3.635c.31.31.31.815 0 1.126l-.075.075a.796.796 0 0 1-1.126 0l-3.636-3.635z"
                      clip-rule="evenodd"></path>
            </svg>
            <div class="header-filter">
                <input type="text" placeholder="검색할 내용.."/>
            </div>
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
                <a href="/profile.do?id=<%=id%>">
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


<section class="container">
    <div class="auto-margin">
        <div class="profile-title">
            <h2>회원정보 수정</h2>
        </div>
        <div class="tabs">
            <span class="tab signin active"><a href="/profile.do">내 정보</a></span>
            <span class="tab signup"><a href="/profilePasswd.do">비밀번호 변경</a></span>
        </div>
        <div class="profile-body">
            <form action="/ProfileUpdate.do" method="post"
                  onsubmit="return updateSubmit()">
                닉네임
                <div class="checkBlock">
                    <input name="nick" id="nick" type="text" value="<%=vo.getNickname()%>" maxlength="30"/>
                </div>
                이메일
                <div class="checkBlock">
                    <input id="email" name="email" type="email"
                           value="<%=vo.getEmail()%>" oninput="initCheckEmail()"/>
                    <button class="checkButton" onclick="checkEmail()">중복확인</button>
                </div>
                <div class="profile-footer">
                    <button>수정</button>
                    <button type="button" onclick="location.href='/'">나가기</button>
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
