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
    <!--jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"
            integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
            crossorigin="anonymous"></script>
    <!-- Toastr -->
    <link rel="stylesheet" href="../toastr/toastr.css">
    <script src="../toastr/toastr.min.js"></script>
    <script>
        toastr.options = {
            "closeButton": true,
            "positionClass": "toast-top-center",
            "timeOut": 1000
        }

        function validateCheck() {
            var content = $('#content').val();

            if (content) {
                toastr.success('글 등록 성공!'); //페이지 리로딩되서 안보임
            } else {
                toastr.error('내용을 입력해 주세요!');
                $('#content').focus();
                return false;
            }
        }
    </script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="board-container">
    <div class="body-header">
        <form action="/reviewsRegister.do" method="post" onsubmit="return validateCheck()">
            <textarea name="content" id="content" type="text" placeholder="내용을 입력하세요."></textarea>
            <button>글쓰기</button>
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
                <td class="title"><%=list.get(i).getContent()%>
                </td>
                <td class="user"><%=list.get(i).getNickname()%>
                </td>
                <td class="date"><%=list.get(i).getWriteDate().substring(0, 11)%>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

</body>

</html>