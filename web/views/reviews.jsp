<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/index_header.css">
    <link rel="stylesheet" href="css/reviews.css">
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
                <a href="profile-info.html">
                    <h3 class="join">회원정보</h3>
                </a>
                <a href="index.html">
                    <h3>로그아웃</h3>
                </a>
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
    <textarea type="text" placeholder="내용을 입력하세요."></textarea>
    <button>글쓰기</button>
</div>

<div class="board-list">
    <table>
        <tbody>
        <tr>
            <td name="title" id="title" class="title"></td>
            <td name="" id="" class="user"></td>
            <td name="writeDate" id="writeDate" class="date"></td>
        </tr>
        <!-- 지워도되는 테스트 -->
        <tr>
            <td class="title">테스트 제목입니다.</td>
            <td class="user">kim</td>
            <td class="date">2020-10-05</td>
        </tr>
        <tr>
            <td class="title">테스트 제목입니다.</td>
            <td class="user">kim</td>
            <td class="date">2020-10-05</td>
        </tr>
        <!-- 지워도되는 테스트 -->
        </tbody>
    </table>
</div>
</body>
</html>