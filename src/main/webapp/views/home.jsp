<% Message msg1 = (Message) session.getAttribute("logedIn"); if(msg1 != null){
response.sendRedirect("/user"); } %> <%@ page language="java"
contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Insert title here</title>

    <%@include file="BootStrapStyle.jsp" %>
  </head>
  <body>
    <%@include file="navbar.jsp" %>

    <div>
      <img
        src="/image/post.jpg"
        alt="blogpost"
        style="width: 100%"
        ;
        height="600px"
      />
    </div>

    <div class="container text-center mt-3">
      <h1>Feel Free to Share your Blog Post</h1>
    </div>

    <%@include file="BootStrapJs.jsp" %>
  </body>
</html>
