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
    <script>
        function checkData() {
            var title = $('#title').val();
            var content = $('#content').val();

            if (!title) {
                alert("제목을 입력하세요");
                $('#title').focus();
                return false;
            }
            // if(!content){
            //     alert("내용을 입력하세요");
            //     $('#content').focus();
            //     return false;
            // }

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
        <form id="editorForm" action="/freeRegister.do" method="post" onsubmit="return checkData()">

            <div class="post-title">
                <input type="text" name="title" id="title" placeholder="제목을 입력하세요"/>
            </div>
                <%--내용--%>
                <div>
                    <jsp:include page="/editor/editorSkinForRegister.jsp" flush="false"/>
                </div>
            </div>
            <footer class="post-comment">
                <a class="exit-btn transparent-btn" href="/freeBoard.do">✔ 나가기</a>
            </footer>
            <button style="margin: 100px" >등록</button>
        </form>
    </article>
</section>

<script src="http://code.jquery.com/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
<script>
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#image_section').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

    // 이벤트를 바인딩해서 input에 파일이 올라올때 위의 함수를 this context로 실행합니다.
    $("#imgInput").change(function () {
        readURL(this);
    });
</script>
</body>
</html>