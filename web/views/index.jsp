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
    <title>메인 화면</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/index_header.css">
</head>
<body>
<header>
    <div class="header-area">
        <div class="header-main">
            <div class="logo">
                <% //세션 null이면 회원가입,로그인 보이게
                    if (id == null) { %>
                <a href="/join.do">
                    <h3>회원가입</h3>
                </a>
                <a href="/login.do">
                    <h3>로그인</h3>
                </a>
                <% } else {%>
                <p><%=id%></p>
                <a href="/logout.do">
                    <h3>로그아웃</h3>
                </a>
                <a href="/mypage.do">
                    <h3>마이페이지</h3>
                </a>
                <% } %>
            </div>
        </div>
    </div>
</header>
</body>
</html>