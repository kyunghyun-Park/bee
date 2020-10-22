<%@ page language="java" contentType="text/plain; charset=UTF-8"
         pageEncoding="UTF-8" %>
<% System.out.println((int)request.getAttribute("count"));%>
{
    "count" : "<%=(int) request.getAttribute("count")%>"

}
