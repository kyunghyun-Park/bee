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
            var title=$('#title').val();
            var content=$('#content').val();

            if(!title){
                alert("제목을 입력하세요");
                $('#title').focus();
                return false;
            }
            if(!content){
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
        <form action="/freeRegister.do" method="post" onsubmit="return checkData()">

            <div class="post-title">
                <input type="text" name="title" id="title" placeholder="제목을 입력하세요"/>
            </div>
            <div class="file-">
                <button class="upButton">
                    <label htmlFor="file" class="img-up">
                        <input type="file" id="imgInput" accept=".jpg, .png, .jpeg, .gif"/>이미지 업로드
                    </label>
                </button>
            </div>
            <div class="post-contents">
                <div class="img-preview">
                    <svg width="107" height="85" fill="none" viewBox="0 0 107 85">
                        <path fill="#868E96"
                              d="M105.155 0H1.845A1.844 1.844 0 0 0 0 1.845v81.172c0 1.02.826 1.845 1.845 1.845h103.31A1.844 1.844 0 0 0 107 83.017V1.845C107 .825 106.174 0 105.155 0zm-1.845 81.172H3.69V3.69h99.62v77.482z"></path>
                        <path fill="#868E96"
                              d="M29.517 40.84c5.666 0 10.274-4.608 10.274-10.271 0-5.668-4.608-10.276-10.274-10.276-5.665 0-10.274 4.608-10.274 10.274 0 5.665 4.609 10.274 10.274 10.274zm0-16.857a6.593 6.593 0 0 1 6.584 6.584 6.593 6.593 0 0 1-6.584 6.584 6.591 6.591 0 0 1-6.584-6.582c0-3.629 2.954-6.586 6.584-6.586zM12.914 73.793a1.84 1.84 0 0 0 1.217-.46l30.095-26.495 19.005 19.004a1.843 1.843 0 0 0 2.609 0 1.843 1.843 0 0 0 0-2.609l-8.868-8.868 16.937-18.548 20.775 19.044a1.846 1.846 0 0 0 2.492-2.72L75.038 31.846a1.902 1.902 0 0 0-1.328-.483c-.489.022-.95.238-1.28.6L54.36 51.752l-8.75-8.75a1.847 1.847 0 0 0-2.523-.081l-31.394 27.64a1.845 1.845 0 0 0 1.22 3.231z"></path>
                    </svg>
                    <img id="image_section" alt=""/>
                </div>
                <textarea name="content" id="content" class="post-textarea"
                          placeholder="내용을 입력하세요"></textarea>
            </div>
            <footer class="post-comment">
                <a class="exit-btn transparent-btn" href="/freeBoard.do">✔ 나가기</a>
                <button class="transparent-btn">등록</button>
            </footer>
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