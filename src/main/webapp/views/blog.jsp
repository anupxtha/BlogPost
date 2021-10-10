<% Message msg2 = (Message) session.getAttribute("logedIn"); if(msg2 != null){
response.sendRedirect("/user"); } %> <%@ page language="java"
contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> <%@page
import="com.blog.helper.*"%> <%@page isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Insert title here</title>
    <%@include file="BootStrapStyle.jsp" %>
  </head>
  <body>
    <%@include file="navbar.jsp" %>

    <!-- Choose Post -->
    <div class="row mt-4 mx-2">
      <!--Show Categories-->
      <div class="col-md-2">
        <div class="list-group mt-4">
          <a
            href="#"
            onclick="getPosts(0, this)"
            class="c-link list-group-item list-group-item-action active"
          >
            All Posts
          </a>
          <c:forEach items="${cl}" var="c">
            <a
              href="#"
              onclick="getPosts( <c:out value = '${c.id}' />, this)"
              class="c-link list-group-item list-group-item-action"
              >${c.name}</a
            >
          </c:forEach>
        </div>
      </div>

      <!--Show Products-->
      <div class="col-md-10">
        <div class="row mt-4">
          <div class="col-md-12">
            <!--Loading -->
            <div class="container text-center mt-4" id="loader">
              <i class="fa fa-refresh fa-3x fa-spin"></i>
              <h3 class="mt-2 display-6">Loading...</h3>
            </div>

            <div id="post-container" class="container-fluid"></div>
          </div>
        </div>
      </div>
    </div>
    <!-- End of Choose Post -->

    <%@include file="BootStrapJs.jsp" %>

    <script>
      function getPosts(catId, temp) {
        $('#loader').show();
        $('#post-container').hide();
        $('.c-link').removeClass('active');

        $.ajax({
          url: '/showpost',
          data: { cId: catId },
          success: function (data, textStatus, jqXHR) {
            console.log(data);
            $('#loader').hide();
            $('#post-container').show();
            $('#post-container').html(data);
            $(temp).addClass('active');
          },
        });
      }

      $(document).ready(function () {
        // Initially Load All post so passing 0 and c-link class 1 reference
        let allPostRef = $('.c-link')[0];
        getPosts(0, allPostRef);
      });
    </script>
  </body>
</html>
