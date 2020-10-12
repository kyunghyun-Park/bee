<%@ page contentType="text/plain;charset=UTF-8" language="java" %>

{
    "count" : "<%=(int) request.getAttribute("count")%>"
}

<%--
<%
    int count = (int) request.getAttribute("count");
%>

<% if (count>0) { %>
    {"id" : 0 }
<% } else } %>
    {"id" : 1 }
<% } %>
--%>
