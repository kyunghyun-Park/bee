<%--
  Created by IntelliJ IDEA.
  User: KB
  Date: 2020-10-06
  Time: 오전 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
        <div class="post-contents">
            <textarea name="content" it="content" class="post-textarea" placeholder="내용을 입력하세요"></textarea>
        </div>
        <footer class="post-comment">
            <a class="exit-btn transparent-btn" href="schoolInfo.jsp">✔ 나가기</a>
            <button class="transparent-btn">발행</button>
        </footer>
    </article>
</section>
</body>
</html>
