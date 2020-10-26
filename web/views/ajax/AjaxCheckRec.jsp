<%@ page contentType="text/plain;charset=UTF-8" language="java" %>

<% System.out.println(request.getAttribute("count"));
System.out.println(request.getAttribute("onOff"));%>

{
    "count" : "<%=(int) request.getAttribute("count")%>",
    "onOff" : "<%=request.getAttribute("onOff")%>"
}

