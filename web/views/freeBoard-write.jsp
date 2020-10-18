<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <script>
        function checkData() {
            var title=$('#title').val();

            if(!title){
                toastr.error("제목을 입력하세요");
                $('#title').focus();
                return false;
            }
            saveContent();
        }
    </script>
</head>
<body>
<header>
    <div class="write-header">
        <h3>글쓰기</h3>
    </div>

</header>

<section class="container-section">
    <article class="write-container">
        <form id="editorForm" action="/freeRegister.do" method="post">
            <div class="post-title">
                <input type="text" name="title" id="title" placeholder="제목을 입력하세요"/>
            </div>
            <div class="post-contents">
                <jsp:include page="/editor/editorSkinForRegister.jsp" flush="false"/>
            </div>
            <footer class="post-comment">
                <a class="exit-btn transparent-btn" href="/freeBoard.do?pn=1">✔ 나가기</a>
                <button class="transparent-btn" onclick="checkData()">등록</button>
            </footer>
        </form>
    </article>
</section>
</body>
</html>