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
    <!--다음 주소 -->
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script>
        toastr.options = {
            "closeButton": true,
            "newestOnTop": true,
            "positionClass": "toast-top-center",
            "timeOut": 1000
        }
        function checkData() {
            var title = $('#title').val();

            if (!title) {
                toastr.error("제목을 입력하세요");
                $('#title').focus();
                return false;
            }
            saveContent();
        }

        //다음 주소 API
        function showAddress() {
            new daum.Postcode({
                oncomplete:function(data) {
                    $('#postcode1').val(data.zonecode);
                    $('#postcode2').val(data.address);
                    $('#postcode3').val(data.buildingName);
                }
            }).open();
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
        <form id="editorForm" action="/schoolRegister.do" method="post">
            <div>
                <select name="choose_region" id="choose_region" class="list-sort">
                    <option value="1">서울/수도권</option>
                    <option value="2">부산/대구/경상도</option>
                    <option value="3">광주/전라도</option>
                    <option value="4">충청도</option>
                    <option value="5">강원도</option>
                    <option value="6">제주도</option>
                </select>
                <a onclick="showAddress()">주소</a>
                <input id="postcode1" type="text" value="" readonly/>
                <input id="postcode2" type="text" value="" readonly/>
                <input id="postcode3" type="text" value="" readonly/>
            </div>
            <div class="post-title">
                <input type="text" name="title" id="title" placeholder="제목을 입력하세요"/>
            </div>

            <div class="post-contents">
                <jsp:include page="/editor/editorSkinForRegister.jsp" flush="false"/>
            </div>
            <footer class="post-comment">
                <a class="exit-btn transparent-btn" href="/schBoard.do?pn=1">✔ 나가기</a>
                <button class="transparent-btn" onclick="checkData()">등록</button>
            </footer>
        </form>
    </article>
</section>
</body>
</html>