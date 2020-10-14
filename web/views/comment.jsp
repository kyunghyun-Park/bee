<%@ page import="com.bee.www.vo.ArticleVo" %>
<%@ page import="com.bee.www.common.LoginManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArticleVo vo = (ArticleVo) request.getAttribute("vo");
    LoginManager lm = LoginManager.getInstance();
    String id = lm.getMemberId(session);
%>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>
<form method="post" <%--action="/commentRegister.do"--%> onsubmit="return commentSubmit()">
    <table>
        <%
            if (id != null) { %>
        <tr>
            <td>
                    <textarea id="content" name="content" rows="4" cols="70"
                              placeholder="댓글내용 입력" style="resize: none"></textarea>
            </td>
            <td>
                <button>등록</button>
            </td>
        </tr>
        <% }%>
    </table>
</form>
</body>
</html>
