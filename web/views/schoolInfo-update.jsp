<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/write.css">
</head>
<body>
<header>
    <div class="write-header">
        <h3>글쓰기</h3>
    </div>
</header>

<section class="container-section">
    <article class="write-container">
        <div class="post-title">
            <textarea name="title" id="title" placeholder="제목을 입력하세요"></textarea>
        </div>
        <div class="file-">
            <button class="upButton">
                <label htmlFor="file" class="img-up">
                    <input type="file" id="file" accept=".jpg, .png, .jpeg, .gif"></input>이미지 업로드
                </label>
            </button>
        </div>
        <div class="post-contents">
            <textarea name="content" it="content" class="post-textarea" placeholder="내용을 입력하세요"></textarea>
        </div>
        <footer class="post-comment">
            <a class="exit-btn transparent-btn" href="schoolInfo.html">✔ 나가기</a>
            <button class="transparent-btn">발행</button>
        </footer>
    </article>
</section>
</body>
</html>