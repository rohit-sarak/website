<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Redirect to home page
    String contextPath = request.getContextPath();
    response.sendRedirect(contextPath + "/home");
%>