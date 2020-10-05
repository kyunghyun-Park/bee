<%@ page import="com.bee.www.dao.BoardDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.bee.www.common.JdbcUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>아이디 중복 결과</title>
</head>
<body>
<div style="text-align: center">
    <h3>*아이디 중복 확인 결과 *</h3>
    <%
        PrintWriter outt = response.getWriter();
        //1) 사용가능한 아이디일 경우,아이디 입력 폼에 넣기 위함
        String id=request.getParameter("id");
        String idDuplication=request.getParameter("idDuplication");

        BoardDAO dao = BoardDAO.getInstance();
        Connection con = JdbcUtil.getConnection();
        dao.setConnection(con);

        int count=dao.checkId(id);
        if(count==0){
            response.setContentType("text/html;charset=UTF-8");
            outt.println("<script>alert('사용 가능한 아이디 입니다.');</script>");
            outt.println("<a href='javascript:apply(\"" + id + "\")'>[적용]</a>");
    %>
    <script>
        function apply(id){
            //2) 중복확인 id를 부모창에 적용
            //부모창 opener
            opener.document.joinForm.id.value=id;
            opener.document.joinForm.idDuplication.value="idCheck";
            window.close(); //창닫기
        }
    </script>
    <%
        }else {
            outt.println("<script>alert('사용할 수 없는 아이디입니다.');</script>");
        }
    %>
    <a href="javascript:window.close()">[창닫기]</a>
</div>
</body>
</html>
