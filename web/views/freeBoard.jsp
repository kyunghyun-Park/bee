<%@ page import="com.bee.www.common.LoginManager" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.bee.www.vo.ArticleVo" %>
<%@ page import="com.bee.www.common.Pagenation" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    LoginManager lm = LoginManager.getInstance();
    String id = lm.getMemberId(session);
    ArrayList<ArticleVo> list = (ArrayList<ArticleVo>) request.getAttribute("list");
    Pagenation pagenation = (Pagenation) request.getAttribute("pagenation");
    String nowPage = request.getParameter("pn");
    String filter = request.getParameter("filter");
    String keyword = request.getParameter("keyword");
%>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/index_header.css">
    <link rel="stylesheet" href="css/schoolInfo.css">
    <!--jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"
            integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
            crossorigin="anonymous"></script>
    <!-- Toastr -->
    <link rel="stylesheet" href="../toastr/toastr.css">
    <script src="../toastr/toastr.min.js"></script>

</head>
<body>
<jsp:include page="header.jsp"/>
<div class="board-container">
    <div class="content-left">
        <div class="head">
            <main class="site-main">
                <article class="post-page">
                    <div class="entry-content">
                        <div class="content-list">
                            <div class="list-header">
                                <div class="board-sort">
                                    <%--    <form>
                                            <select class="list-sort">
                                                <option value="newest">최신순</option>
                                                <option value="best">추천순</option>
                                                <option value="viewed">조회순</option>
                                            </select>
                                        </form>--%>
                                    <div class="control">
                                        <a href="/freeBoardWrite.do" class="searchADNcontrol">글쓰기</a>
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
                                    <%
                                        for (int i = 0; i < list.size(); i++) {
                                    %>
                                    <tr>
                                        <td class="num"><%=list.get(i).getB_sq()%>
                                        </td>
                                        <td onclick="goDetail(<%=list.get(i).getB_sq()%>)"
                                            class="title"><%=list.get(i).getTitle()%>
                                        </td>
                                        <td class="user"><%=list.get(i).getNickname()%>
                                        </td>
                                        <td class="date"><%=list.get(i).getWriteDate().substring(0, 11)%>
                                        </td>
                                        <td class="view"><%=list.get(i).getHit()%>
                                        </td>
                                    </tr>
                                    <% } %>
                                    </tbody>
                                </table>
                            </div>
                            <div class="pagination">
                                <%
                                    System.out.println("첫번째 페이지 넘버: " + pagenation.getStartPage());
                                    System.out.println("현재 페이지 : " + nowPage);
                                %>
                                <ul>
                                    <li>
                                        <% if (pagenation.getNowPageNumber() != 1) { %>
                                        <a href="/freeBoard.do?pn=<%=pagenation.getStartPage()-1%>&filter=<%=filter%>&keyword=<%=keyword%>">«</a>
                                        <% } %>
                                    </li>
                                    <% for (int i = pagenation.getStartPage(); i <= pagenation.getEndPage(); i++) { %>
                                    <li class="active">
                                        <a href="/freeBoard.do?pn=<%=i%>&filter=<%=filter%>&keyword=<%=keyword%>">
                                            <%=i%>
                                        </a>
                                    </li>
                                    <% } %>
                                    <li>
                                        <% if (pagenation.getNowPageNumber() != pagenation.getTotalPageCount()) { %>
                                        <a href="/freeBoard.do?pn=<%=pagenation.getEndPage()+1%>&filter=<%=filter%>&keyword=<%=keyword%>">»</a>
                                        <% } %>
                                    </li>
                                </ul>
                            </div>
                            <div class="search">
                                <select name="filter" id="filter">
                                    <option value="all" selected>전체</option>
                                    <option value="title">제목</option>
                                    <option value="content">내용</option>
                                </select>
                                <input type="text" name="keyword" id="keyword"/>
                                <button onclick="return searchArticle()" class="searchADNcontrol"
                                        id="btnSearch">검색
                                </button>
                                <button onclick="location.href='/freeBoard.do?pn=1&filter=&keyword=&'"
                                        type="button" class="searchADNcontrol">초기화
                                </button>
                            </div>
                        </div>
                    </div>
                </article>
            </main>
        </div>
    </div>
</div>
<script>$('#freeInfo').css('color', 'rgb(12, 167, 179)');</script>  <!--현재 게시판 색 변경-->
<script src="http://code.jquery.com/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
<script>
    toastr.options = {
        "closeButton": true,
        "positionClass": "toast-top-center",
        "timeOut": 1000
    }

    function goDetail(num) {
        location.href = "/freeDetail.do?pn=" + <%=nowPage%> +"&num=" + num
            + "&filter=" + '<%=filter%>' + "&keyword=" + '<%=keyword%>';
    }

    function searchArticle() {
        var filter = $('#filter option:selected').val();
        var keyword = $('#keyword').val();
        if (!keyword) {
            toastr.error("검색할 내용을 입력하세요.");
            $('#keyword').focus();
            return false;
        }
        location.href =
            "/freeBoard.do?pn=1&filter=" + filter + "&keyword=" + keyword;
    }

    $(function () {
        var sBtn = $(".pagination ul > li");    //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
        sBtn.find("a").click(function () {   // sBtn에 속해 있는  a 찾아 클릭 하면.
            sBtn.removeClass("active");     // sBtn 속에 (active) 클래스를 삭제 한다.
            $(this).parent().addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
        })
    })
</script>
</body>
</html>
