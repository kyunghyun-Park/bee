<%--
  Created by IntelliJ IDEA.
  User: qoa78
  Date: 2020-10-06
  Time: 오후 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script>
        var count = 0;

        $('#confirmId').click(function () {
            var email = $('#email').val();
            if (email == '') {
                alert('아이디를 입력하세요!');
                $('#email').focus();
                return;
            }

            var reg_exp = new RegExp("^[a-z0-9_+.-]+@([a-z0-9-]+.)+[a-z0-9]{2,4}$", "g");
            var match = reg_exp.exec(email);
            if (match == null) {
                $('#id_signed').html('이메일 형식이 맞지 않습니다.').css('color', 'red');
                $('#email').val('');
                $('#email').focus();
                return false;
            }

            if (email.length > 50) {
                $('#id_signed').html('50자 이내로 작성해 주세요.').css('color', 'red');
                $('#email').val('');
                $('#email').focus();
                return false;
            }

            //서버프로그램 연동해서 아이디 중복체크하기
            $.ajax({
                url: "/AjaxCheckId.jsp",
                type: "POST",
                data: {id: email},
                dataType: "json",
                error: function () {
                    alert('서버와 통신 실패');
                },
                success: function (data) {
                    if (data.email == 'idDuplicated') {	//id중복
                        count = 0;
                        $('#id_signed').html('사용 불가능한 이메일').css('color', 'red');
                        $('#email').val('').focus();
                    } else {	//id 미중복
                        //중복확인 작업을 수행하면 count를 1로 변경
                        count = 1;
                        $('#id_signed').html('사용 가능한 이메일').css('color', '#007ee5');
                    }
                }
            });
        });

        //input태그에 key이벤트 연결
        $('#email').keyup(function () {
            count = 0;
            $('#id_signed').html('50자 이내의 이메일 주소').css('color', '#9aa8d0');
        });

        $('#joinsubmit').click(function () {
            if (count == 0) {
                alert('아이디 중복체크 필수');
                if ($('#email').val() == '') {
                    $('#email').focus();
                } else {
                    $('#confirmId').focus();
                }
                return false;
            } else {
                validateEncryptedFormForJoin();
            }
        });
    </script>
</head>
<body>

</body>
</html>
