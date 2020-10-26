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
                                            //댓글 있으면 제목 옆에 댓글 표시
                                            String cc = " [" + list.get(i).getComment_count() + "]";
                                            if(cc.equals(" [0]")){ cc=""; }
                                    %>
                                    <tr>
                                        <td class="num"><%=list.get(i).getB_sq()%>
                                        </td>
                                        <td onclick="goDetail(<%=list.get(i).getB_sq()%>)" style="cursor: pointer"
                                            class="title"><%=list.get(i).getTitle()%><span style="color: #2F96B4"><%=cc%></span>
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
                                   /* System.out.println("첫번째 페이지 넘버: " + pagenation.getStartPage());
                                    System.out.println("현재 페이지 : " + nowPage);*/
                                %>
                                <ul>
                                    <li>
                                        <% if (pagenation.getNowPageNumber() != 1) { %>
                                        <a href="/freeBoard.do?pn=<%=pagenation.getStartPage()-1%>&filter=<%=filter%>&keyword=<%=keyword%>">«</a>
                                        <% } %>
                                    </li>
                                    <% for (int i = pagenation.getStartPage(); i <= pagenation.getEndPage(); i++) { %>
                                    <li class="page<%=i%> ">
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
            //페이지 넘버만 숫자로 짤라오기
            <% if(pagenation.getNowPageNumber() > 0 && pagenation.getNowPageNumber() <=9 ) { %>
            var para = (parseInt(document.location.href.substring(38, 39)));
            console.log("if : " + para);

            <% } else if(pagenation.getNowPageNumber() > 9) { %>
            var para = (parseInt(document.location.href.substring(38, 40)));
            console.log("else if : " + para);
            <% } %>

            //페이지 넘버만큼 값과 현재 페이지 숫자를 비교해서 각 클래스에 active 부여
            <% for (int i = pagenation.getStartPage() ; i <= pagenation.getEndPage(); i++) { %>
            var i = <%=i%>;
            if (i == para) {
                console.log(<%=i%>)
                // $('.page1').removeClass('active')
                $('.page<%=i%>').addClass('active');
            }
            <% } %>
        }
    )
</script>
</body>
</html>
