<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@page import="com.blog.helper.*"%> <%@page
isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Insert title here</title>

    <%@include file="BootStrapStyle.jsp"%>
  </head>
  <body>
    <% Message m = (Message) session.getAttribute("logedIn"); if (m != null) {
    %>

    <nav class="navbar navbar-expand-lg navbar-dark primary-background">
      <a class="navbar-brand ml-5" href="/user"
        ><span
          ><img
            src="/profile/${user.profile}"
            alt="${user.profile}"
            style="width: 35px; height: 35px" /></span
        >&nbsp; ${user.name}</a
      >

      <button
        class="navbar-toggler"
        type="button"
        data-toggle="collapse"
        data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto mr-5">
          <li class="nav-item mr-3">
            <a
              class="nav-link"
              href="#"
              data-toggle="modal"
              data-target="#show-detail-modal"
              >My-Info</a
            >
          </li>

          <li class="nav-item mr-3">
            <a
              class="nav-link"
              href="#"
              data-toggle="modal"
              data-target="#add-post-modal"
              >Post-Blog</a
            >
          </li>

          <li class="nav-item mr-3">
            <a class="nav-link" href="/logout">Log-Out</a>
          </li>
        </ul>
      </div>
    </nav>

    <!--User Modal-->
    <!-- User Details Model -->
    <div
      class="modal fade"
      id="show-detail-modal"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header primary-background text-white text-center">
            <h4 class="modal-title display-6" id="exampleModalLabel">
              &nbsp;
              <span>
                <img
                  src="/profile/${user.profile}"
                  alt="${user.name}"
                  style="width: 45px; height: 45px"
                />
              </span>
              ${user.name}
            </h4>
            <button
              type="button"
              class="close"
              data-dismiss="modal"
              aria-label="Close"
            >
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <!--Form-->
            <form
              id="add-post-form"
              action="/user/upateProfile"
              method="POST"
              enctype="multipart/form-data"
            >
              <div class="form-group">
                <input
                  name="name"
                  type="text"
                  placeholder="Enter Your Name"
                  class="form-control"
                  value="${user.name}"
                />
              </div>
              <div class="form-group">
                <input
                  name="email"
                  type="email"
                  placeholder="Enter Your Email"
                  class="form-control"
                  value="${user.email}"
                />
              </div>

              <div class="form-group">
                <label>Update Profile Pic</label>
                <input name="profileImage" type="file" class="form-control" />
              </div>

              <div class="container">
                <button type="submit" class="btn btn-outline-primary">
                  Update
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <!--End User Details Modal-->

    <!--Add Post Modal-->
    <!-- Modal -->
    <div
      class="modal fade"
      id="add-post-modal"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header primary-background text-white text-center">
            <h4 class="modal-title display-6" id="exampleModalLabel">
              Provide Post Details
            </h4>
            <button
              type="button"
              class="close"
              data-dismiss="modal"
              aria-label="Close"
            >
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <!--Form-->
            <form
              id="add-post-form"
              action="/user/postblog"
              method="POST"
              enctype="multipart/form-data"
            >
              <div class="form-group">
                <select class="form-control" name="category">
                  <option class="text-center" selected disabled>
                    ***Select Categories***
                  </option>

                  <c:forEach items="${category}" var="cat">
                    <option value="${cat.id }">${cat.name}</option>
                  </c:forEach>
                </select>
              </div>

              <div class="form-group">
                <input
                  name="title"
                  type="text"
                  placeholder="Enter Post Title"
                  class="form-control"
                />
              </div>

              <div class="form-group">
                <textarea
                  class="form-control"
                  id="content"
                  name="description"
                  rows="6"
                  placeholder="Enter your Content"
                ></textarea>
              </div>

              <div class="form-group">
                <label>Select Your Post Image</label>
                <input name="fileImage" type="file" class="form-control" />
              </div>

              <div class="container">
                <button type="submit" class="btn btn-outline-primary">
                  Save changes
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <!--End Post Modal-->

    <!-- Choose Post -->
    <div class="row mt-4 mx-2">
      <!--Show Categories-->
      <div class="col-md-2">
        <a
          href="#"
          onclick="getPostsOfUser( <c:out value = '${user.id}' />, this)"
          class="c-link list-group-item list-group-item-action mt-4"
        >
          My Posts
        </a>
        <div class="list-group mt-4">
          <a
            href="#"
            onclick="getPosts(0, this)"
            class="c-link list-group-item list-group-item-action active"
          >
            All Posts
          </a>
          <c:forEach items="${category}" var="c">
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

    <% } %> <%@include file="BootStrapJs.jsp"%>

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
        let allPostRef = $('.c-link')[1];
        getPosts(0, allPostRef);
      });

      function getPostsOfUser(userId, temp) {
        $('#loader').show();
        $('#post-container').hide();
        $('.c-link').removeClass('active');

        $.ajax({
          url: '/user/showPostofUser',
          data: { uId: userId },
          success: function (data, textStatus, jqXHR) {
            console.log(data);
            $('#loader').hide();
            $('#post-container').show();
            $('#post-container').html(data);
            $(temp).addClass('active');
          },
        });
      }
    </script>
  </body>
</html>
