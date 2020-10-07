<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/index_header.css">
    <link rel="stylesheet" href="css/schoolInfo.css">
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
                <a href="login.jsp">
                    <h3>로그인</h3>
                </a>
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
                <li><a href="schoolInfo.jsp" style="color: rgb(12, 167, 179);">학원정보</a></li>
                <li><a href="#">수강후기</a></li>
                <li><a href="#">오늘의 공부</a></li>
                <li><a href="freeBoard.jsp">자유게시판</a></li>
            </ul>
        </nav>
    </section>
</div>


<div class="board-container">
    <div class="content-left">
        <div class="head">
            <main class="site-main">
                <article class="post-page">
                    <div class="entry-content">
                        <div class="content-list">
                            <div class="list-header">
                                <div class="board-sort">
                                    <form>
                                        <select class="list-sort">
                                            <option value="newest">최신순</option>
                                            <option value="best">추천순</option>
                                            <option value="viewed">조회순</option>
                                        </select>
                                    </form>
                                    <div class="control">
                                        <a href="schoolInfo-write.jsp" class="searchADNcontrol">글쓰기</a>
                                    </div>
                                </div>
                            </div>
                            <div class="board-list">
                                <table>
                                    <thead>
                                    <tr>
                                        <th class="num">번호</th>
                                        <th class="title" style="min-width: 120px;">제목</th>
                                        <th class="user">작성자</th>
                                        <th class="date">작성일</th>
                                        <th class="view">조회수</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td name="" id="" class="num"></td>
                                        <td name="title" id="title" class="title"></td>
                                        <td name="" id="" class="user"></td>
                                        <td name="writeDate" id="writeDate" class="date"></td>
                                        <td name="hit" id="hit" class="view"></td>
                                    </tr>
                                    <!-- 지워도되는 테스트 -->
                                    <tr>
                                        <td class="num">1</td>
                                        <td class="title">테스트 제목입니다.</td>
                                        <td class="user">kim</td>
                                        <td class="date">2020-10-05</td>
                                        <td class="view">10</td>
                                    </tr>
                                    <!-- 지워도되는 테스트 -->
                                    </tbody>
                                </table>
                            </div>
                            <div class="pagination">
                                <ul>
                                    <li class="active"><a href="#">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>
                                </ul>
                            </div>
                            <div class="search">
                                <form>
                                    <select>
                                        <option>전체</option>
                                        <option value="title">제목</option>
                                        <option value="username">작성자</option>
                                    </select>
                                    <input type="text"></input>
                                    <button type="submit" class="searchADNcontrol">검색</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </article>
            </main>
        </div>
    </div>
</div>

<script src="http://code.jquery.com/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
<script>
    $(function(){
        var sBtn = $(".pagination ul > li");    //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
        sBtn.find("a").click(function(){   // sBtn에 속해 있는  a 찾아 클릭 하면.
            sBtn.removeClass("active");     // sBtn 속에 (active) 클래스를 삭제 한다.
            $(this).parent().addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
        })
    })
</script>
<!-- 1.  sBtn.removeClass("active");     // sBtn 속에 (active) 클래스를 삭제 한다.
2.  $(this).parent().addClass("active"); // 클릭한 a에 (active)클래스를 넣는다. -->
</body>
</html>
