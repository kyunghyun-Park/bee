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
                <a href="/profile.do">
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

<section class="title-section">
    <div class="title-logo">
        <a href="index.jsp">
            <h1>Good Bee</h1>
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
                <li><div class="circle" style="background-color: red;"></div></li>
                <li><div class="circle" style="background-color: orange;"></div></li>
                <li><div class="circle" style="background-color: teal;"></div></li>
            </ul>
        </div>
        <div class="mainImg-body">
            <h1>> Hello, World ! _</h1>
        </div>
    </div>
</div>

<div class="footer-margin">
    <div class="footer-container">
        <article class="square-container1">
            <div class="square-title">
                <h2>[서울] 직업전문학교</h2>
            </div>
            <div class="square-sub">
                <h3>자바기반 스마트 웹&앱</h3>
            </div>
            <div class="square-dec">
                <p>취업률 150프로를 자랑하는 O O학원 ...</p>
            </div>
        </article>
        <article class="square-container1">
            <div class="square-title">
                <h2>[서울] O O 학원</h2>
            </div>
            <div class="square-sub">
                <h3>자바기반 스마트 웹&앱</h3>
            </div>
            <div class="square-dec">
                <p>취업률 150프로를 자랑하는 O O학원 ...</p>
            </div>
        </article>
    </div>
    <div class="footer-container">
        <article class="square-container2">
            <div class="square-title">
                <h2>[서울] 직업전문학교</h2>
            </div>
            <div class="square-sub">
                <h3>자바기반 스마트 웹&앱</h3>
            </div>
            <div class="square-dec">
                <p>취업률 150프로를 자랑하는 O O학원 ...</p>
            </div>
        </article>
        <article class="square-container2">
            <div class="square-title">
                <h2>[서울] O O 학원</h2>
            </div>
            <div class="square-sub">
                <h3>자바기반 스마트 웹&앱</h3>
            </div>
            <div class="square-dec">
                <p>취업률 150프로를 자랑하는 O O학원 ...</p>
            </div>
        </article>
    </div>
</div>
</body>
</html>