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
            if (!content) {
                alert("내용을 입력하세요");
                $('#content').focus();
                return false;
            }
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
        <form action="/schoolRegister.do" method="post" onsubmit="return checkData()">
            <div>
                <select name="choose_region" id="choose_region" class="list-sort">
                    <option value="1">서울/수도권</option>
                    <option value="2">부산/대구/경상도</option>
                    <option value="3">광주/전라도</option>
                    <option value="4">충청도</option>
                    <option value="5">강원도</option>
                    <option value="6">제주도</option>
                </select>
            </div>
            <div class="post-title">
                <input type="text" name="title" id="title" placeholder="제목을 입력하세요"/>
            </div>
            <div class="file-">
                <button class="upButton">
                    <label htmlFor="file" class="img-up">
                        <input type="file" id="file" accept=".jpg, .png, .jpeg, .gif"/>이미지 업로드
                    </label>
                </button>
            </div>
            <div class="post-contents">
                <textarea name="content" id="content" class="post-textarea" placeholder="내용을 입력하세요"></textarea>
            </div>
            <footer class="post-comment">
                <a class="exit-btn transparent-btn" href="/schBoard.do">✔ 나가기</a>
                <button class="transparent-btn">등록</button>
            </footer>
        </form>
    </article>
</section>
</body>
</html>