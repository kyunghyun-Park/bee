<%@ page import="com.bee.www.common.LoginManager" %>
<%@ page import="com.bee.www.vo.ArticleVo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    LoginManager lm = LoginManager.getInstance();
    String id = lm.getMemberId(session);
    ArrayList<ArticleVo> list = (ArrayList<ArticleVo>) request.getAttribute("list");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/index_header.css">
    <link rel="stylesheet" href="css/reviews.css">
    <script>
        function validateCheck() {
            var content = $('#content').val();

            if (!content) {
                alert("내용을 입력해 주세요.");
                $('#content').focus();
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
                <a href="/profile.do">
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
            <h1>Good Bee</h1>
        </a>
    </div>
</section>

<div class="main-margin">
    <section class="nav-section">
        <nav>
            <ul>
                <li><a href="/schBoard.do">학원정보</a></li>
                <li><a href="/reviews.do" style="color: rgb(12, 167, 179);">학원후기</a></li>
                <li><a href="/freeBoard.do">자유게시판</a></li>
            </ul>
        </nav>
    </section>
</div>

<div class="body-header">
    <form action="/reviewsRegister.do" method="post" onsubmit="validateCheck()">
        <textarea name="content" id="content" type="text" placeholder="내용을 입력하세요."></textarea>
        <button type="submit">글쓰기</button>
    </form>
</div>

<div class="board-list">
    <table>
        <tbody>

        <tr>
            <td name="title" id="title" class="title"></td>
            <td name="" id="" class="user"></td>
            <td name="writeDate" id="writeDate" class="date"></td>
        </tr>
        <%
            for (int i = 0; i < list.size(); i++) {
        %>
        <tr>
            <td class="title"><%=list.get(i).getContent()%></td>
            <td class="user"><%=list.get(i).getNickname()%></td>
            <td class="date"><%=list.get(i).getWriteDate().substring(0, 11)%></td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>