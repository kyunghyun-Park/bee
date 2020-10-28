<%@ page import="com.bee.www.vo.ArticleVo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArticleVo vo = (ArticleVo) request.getAttribute("vo");
    String nowPage = request.getParameter("pn");

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/write.css">
    <!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"
            integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
            crossorigin="anonymous"></script>
    <!-- Toastr -->
    <link rel="stylesheet" href="../toastr/toastr.css">
    <script src="../toastr/toastr.min.js"></script>

</head>
<body>
<header>
    <div class="write-header">
        <h3>글쓰기</h3>
    </div>

</header>

<section class="container-section">
    <article class="write-container">
        <form id="editorForm" action="/freeUpdateProc.do?pn=<%=nowPage%>&num=<%=vo.getB_sq()%>" method="post" >
            <div class="post-title">
                <input type="text" name="title" id="title" value="<%=vo.getTitle()%>"/>
            </div>
            <div class="post-contents">
                <jsp:include page="/editor/editorSkinForModify.jsp" flush="false"/>
            </div>
            <footer class="post-comment">
                <a class="exit-btn transparent-btn" href="javascript:window.history.back();">✔ 나가기</a>
                <button type="submit" class="transparent-btn" onclick="checkData()">수정</button>
            </footer>
        </form>
    </article>
</section>
<script>

    toastr.options = {
        "closeButton": true,
        "positionClass": "toast-top-center",
        "timeOut": 1000
    }
    var content='<%=vo.getContent()%>';
    function checkData() {
        var title = $('#title').val();

        if (!title) {
            toastr.error("제목을 입력하세요");
            $('#title').focus();
            return false;
        }
        saveContent();
    }
</script>
</body>
</html>