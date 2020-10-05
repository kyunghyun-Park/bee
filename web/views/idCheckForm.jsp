<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>아이디 중복확인</title>
</head>
<body>
<div style="text-align: center"><h3>* 아이디 중복확인 *</h3>
    <form method="post" action="/idCheckProc.do" onsubmit="return blankCheck(this)">
        아이디 : <input type="text" name="id"
                     minlength="4" maxlength="20" autofocus>
        <input type="submit" value="중복확인"></form>
</div>

<script> function blankCheck(f) {
    var id = f.id.value;
    id = id.trim();
    if (id.length < 4) {
        alert("아이디는 4자 이상 입력해주십시오.");
        return false;
    }
    return true;
}</script>

</body>
</html>
