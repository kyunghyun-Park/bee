<%@ page import="com.bee.www.common.LoginManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    LoginManager lm = LoginManager.getInstance();
    String id = lm.getMemberId(session);

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Good Bee</title>
    <link rel="stylesheet" type="text/css" href="/css/index.css">
    <link rel="stylesheet" type="text/css" href="/css/index_header.css">
    <link rel="stylesheet" type="text/css" href="/css/chat.css">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
</head>
<body>
<header>
    <div class="header-area">
        <div class="header-main">
            <div class="header-filter">
                <svg width="17" height="17" viewBox="0 0 17 17">
                    <path fill-rule="evenodd"
                          d="M13.66 7.36a6.3 6.3 0 1 1-12.598 0 6.3 6.3 0 0 1 12.598 0zm-1.73 5.772a7.36 7.36 0 1 1 1.201-1.201l3.636 3.635c.31.31.31.815 0 1.126l-.075.075a.796.796 0 0 1-1.126 0l-3.636-3.635z"
                          clip-rule="evenodd"></path>
                </svg>
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
                <li><a href="/schBoard.do">학원정보</a></li>
                <li><a href="/reviews.do">학원후기</a></li>
                <li><a href="/freeBoard.do">자유게시판</a></li>
            </ul>
        </nav>
    </section>

    <div class="mainImg-section">
        <div class="mainImg-header">
            <ul>
                <li>
                    <div class="circle" style="background-color: red;"></div>
                </li>
                <li>
                    <div class="circle" style="background-color: orange;"></div>
                </li>
                <li>
                    <div class="circle" style="background-color: teal;"></div>
                </li>
            </ul>
        </div>
        <div class="mainImg-body">
            <%
                //로그인 상태
                if (id == null) {
            %>
            <svg id="Capa_1" enable-background="new 0 0 512 512" height="512" viewBox="0 0 512 512" width="512"
                 xmlns="http://www.w3.org/2000/svg">
                <g>
                    <g>
                        <path clip-rule="evenodd"
                              d="m114.355 41.494h96.6c62.901 0 114.355 51.454 114.355 114.355v4.964c0 62.872-51.454 114.326-114.355 114.326h-96.6-22.836c-2.453 0-2.19-.088-4.351 1.022l-45.73 23.508c-2.453.905-3.65.234-3.504-2.278l2.628-48.826c.058-.409.146-.467-.117-.672-24.705-21.024-40.445-52.3-40.445-87.08v-4.964c0-62.901 51.454-114.355 114.355-114.355z"
                              fill="#bcea73" fill-rule="evenodd"/>
                    </g>
                    <g>
                        <path clip-rule="evenodd"
                              d="m397.645 211.946h-96.63c-62.901 0-114.355 51.454-114.355 114.355v4.964c0 62.872 51.454 114.355 114.355 114.355h96.63 22.836c2.424 0 2.161-.117 4.322 1.022l45.73 23.478c2.482.905 3.65.234 3.533-2.249l-2.657-48.855c-.058-.38-.146-.438.117-.672 24.705-21.023 40.474-52.298 40.474-87.078v-4.964c0-62.902-51.454-114.356-114.355-114.356z"
                              fill="#8dcafc" fill-rule="evenodd"/>
                    </g>
                    <g>
                        <path d="m403.397 290.079h-105.653c-4.268 0-7.726-3.459-7.726-7.726s3.459-7.726 7.726-7.726h105.653c4.268 0 7.726 3.459 7.726 7.726.001 4.267-3.458 7.726-7.726 7.726z"
                              fill="#f8f6f6"/>
                    </g>
                    <g>
                        <path d="m403.397 339.138h-105.653c-4.268 0-7.726-3.459-7.726-7.726s3.459-7.726 7.726-7.726h105.653c4.268 0 7.726 3.459 7.726 7.726.001 4.267-3.458 7.726-7.726 7.726z"
                              fill="#f8f6f6"/>
                    </g>
                    <g>
                        <path d="m403.397 388.198h-105.653c-4.268 0-7.726-3.459-7.726-7.726s3.459-7.726 7.726-7.726h105.653c4.268 0 7.726 3.459 7.726 7.726.001 4.266-3.458 7.726-7.726 7.726z"
                              fill="#f8f6f6"/>
                    </g>
                    <g>
                        <path d="m213.409 115.45h-105.653c-4.267 0-7.726-3.459-7.726-7.726s3.459-7.726 7.726-7.726h105.653c4.267 0 7.726 3.459 7.726 7.726s-3.459 7.726-7.726 7.726z"
                              fill="#f8f6f6"/>
                    </g>
                    <g>
                        <path d="m213.409 164.51h-105.653c-4.267 0-7.726-3.459-7.726-7.726s3.459-7.726 7.726-7.726h105.653c4.267 0 7.726 3.459 7.726 7.726s-3.459 7.726-7.726 7.726z"
                              fill="#f8f6f6"/>
                    </g>
                    <g>
                        <path d="m160.582 213.599h-52.826c-4.267 0-7.726-3.459-7.726-7.726s3.459-7.726 7.726-7.726h52.826c4.267 0 7.726 3.459 7.726 7.726 0 4.266-3.459 7.726-7.726 7.726z"
                              fill="#f8f6f6"/>
                    </g>
                    <g>
                        <path clip-rule="evenodd"
                              d="m192.179 41.494c39.248 26.136 64.829 69.005 64.829 117.451 0 27.07-8.001 52.389-21.902 74.027 18.66-13.229 41.438-21.025 65.909-21.025h12.148c7.768-15.419 12.148-32.794 12.148-51.133v-4.964c0-62.901-51.454-114.355-114.355-114.355h-18.777z"
                              fill="#99d53b" fill-rule="evenodd"/>
                    </g>
                    <g>
                        <path clip-rule="evenodd"
                              d="m401.47 212.005c28.735 26.194 46.548 62.755 46.548 103.171 0 57.616-36.152 107.318-88.453 130.446h38.079 22.836c2.424 0 2.161-.117 4.322 1.022l45.73 23.478c2.482.905 3.65.234 3.533-2.249l-2.657-48.855c-.058-.38-.146-.438.117-.672 24.706-21.025 40.475-52.3 40.475-87.08v-4.964c0-61.617-49.381-112.253-110.53-114.297z"
                              fill="#64b9fc" fill-rule="evenodd"/>
                    </g>
                </g>
            </svg>
            <h2>로그인시 채팅입장</h2>
            <% } //로그아웃 상태
            else { %>
            <div id="main-container">
                <div id="chat-container">

                </div>
                <div id="bottom-container">
                    <input id="inputMessage" type="text">
                    <input id="btn-submit" type="submit" value="전송">
                </div>
            </div>
            <% } %>

        </div>
    </div>
</div>

<div class="trend-section">
    <main class="trend-main">
        <div class="main-section">
            <div class="article">
                <div class="arcticle-img">
                    <img src="../images/2.png" alt=""></img>
                </div>
                <div class="article-content">
                    <h4>서울IT직업전문학교</h4>
                    <div class="desc-wrapper">
                        <p>2006년 국내 최초로 쇼핑몰창업교육을 실행한 서울IT직업전문학교는
                            고용노동부 직업훈련의 제약과 어려움에도 불구하고,
                            끊임없는 혁신과 도전정신으로 전자상거래, 게임콘텐츠, 웹툰만화, 빅데이터 분야 등
                            서울지역 IT 정보기술 교육의 새로운 장을 열어가고 있습니다.</p>
                    </div>
                </div>
            </div>

            <div class="article">
                <div class="arcticle-img">
                    <img src="../images/1.png" alt=""></img>
                </div>
                <div class="article-content">
                    <h4>서울직업전문학교</h4>
                    <div class="desc-wrapper">
                        <p>세계 속의 미래산업을 이끌어 갈
                            스페셜리스트 인재 양성에
                            최선을 다하고 있습니다.
                            급변하는 세계와 환경에 적합한 기술력과 교육프로그램을 개발하였으며
                            학생들의 글로벌 경험과 지식을 위해 외국학교 및 기관들과 협력하고 있습니다.
                            실패를 두려워하지 않기에 미래가 있다!</p>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>

<script type="text/javascript">
    // WebSocket 오브젝트 생성 (자동으로 접속 시작한다. - onopen 함수 호출)
    var webSocket = new WebSocket("ws://localhost:8080/websocket");

    var inputMessage = document.getElementById('inputMessage');

    webSocket.onerror = function (e) {
        onError(e);
    };
    webSocket.onopen = function (e) {
        onOpen(e);
    };
    webSocket.onmessage = function (e) {
        onMessage(e);
    };

    // Send 버튼을 누르면 호출되는 함수
    function onMessage(e) {
        var chatMsg = event.data;
        var date = new Date();
        var dateInfo = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
        if (chatMsg.substring(0, 6) == 'server') {
            var $chat = $("<div class='chat notice'>" + chatMsg + "</div>");
            $('#chat-container').append($chat);
        } else {
            var $chat = $("<div class='chat-box'><div class='chat'>" + chatMsg + "</div><div class='chat-info chat-box'>" + dateInfo + "</div></div>");
            $('#chat-container').append($chat);
        }
        $('#chat-container').scrollTop($('#chat-container')[0].scrollHeight + 20);
    }

    function onOpen(e) {

    }

    function onError(e) {
        alert(e.data);
    }

    function send() {
        var chatMsg = inputMessage.value;
        if (chatMsg == '') {
            return;
        }
        var date = new Date();
        var dateInfo = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
        var $chat = $("<div class='my-chat-box'><div class='chat my-chat'>" + chatMsg + "</div><div class='chat-info'>" + dateInfo + "</div></div>");
        $('#chat-container').append($chat);
        webSocket.send(chatMsg);
        inputMessage.value = "";
        $('#chat-container').scrollTop($('#chat-container')[0].scrollHeight + 20);
    }
</script>

<script type="text/javascript">
    $(function () {
        $('#inputMessage').keydown(function (key) {
            if (key.keyCode == 13) {
                $('#inputMessage').focus();
                send();
            }
        });
        $('#btn-submit').click(function () {
            send();
        });

    })
</script>
</body>
</html>