<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@page import="com.blog.helper.*"%> <%@page
isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Insert title here</title>

    <style>
      .primary-background {
        background: #3d5afe !important;
      }
    </style>

    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
  </head>
  <body>
    <% Message msg12 = (Message) session.getAttribute("logedIn"); if (msg12 !=
    null) { %>

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

    <!-- Starting of Single Post  -->
    <div class="container mt-4">
      <div class="card mb-3">
        <img
          class="card-img-top"
          src="/image/${sPost.image}"
          alt="Card image cap"
          style="height: 500px"
        />
        <div class="card-body">
          <h2 class="card-title">${sPost.title}</h2>
          <p class="card-text">
            ${sPost.description} ||| Lorem ipsum dolor sit amet consectetur
            adipisicing elit. Odit modi ex consectetur quas aliquam molestiae
            voluptates quae, aut laborum sunt saepe soluta itaque at, libero
            molestias rerum eum pariatur aliquid!
            <br />
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Ratione,
            quis ipsum eligendi sit at culpa libero corrupti a sint quo repellat
            deserunt voluptatibus dolor enim doloribus nemo ipsam quaerat
            facere!
          </p>
          <p class="card-text">
            <small class="text-muted">By - ${postUser.name}</small>
          </p>
        </div>
      </div>
    </div>
    <!-- End of Single Post -->

    <c:if test="${T}">
      <div class="container">
        <div class="card mb-5">
          <ul class="list-unstyled mt-3">
            <c:forEach items="${comment}" var="com">
              <li class="media">
                <img
                  class="mr-3 ml-5"
                  src="/profile/${com.users.profile}"
                  alt="Generic placeholder image"
                  style="width: 45px; height: 45px"
                />
                <div class="media-body">
                  <h6 class="mt-0 mb-1">${com.users.name}</h6>
                  <p class="mt-0 mb-1">${com.comment_text}</p>
                </div>
              </li>
              <hr>
            </c:forEach>
          </ul>
        </div>
      </div>
    </c:if>

    <div class="container">
      <div class="card mb-5">
        <form
          id="postComment"
          action="/user/comment"
          method="POST"
          class="list-unstyled mt-3 mb-3"
        >
          <div class="media">
            <input name="users" value="${user.id}" hidden />
            <input name="post" value="${sPost.id}" hidden />
            <input
              id="comment_point"
              name="comment_text"
              type="text"
              placeholder="Enter Your Valuable Comment"
              class="form-control ml-5 mr-5"
            />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <div class="media-body">
              <button
                type="submit"
                class="btn btn-outline-primary mr-5"
                style="width: 100px"
              >
                Comment
              </button>
            </div>
          </div>
        </form>
      </div>
    </div>

    <% } %> <%@include file="BootStrapJs.jsp"%>

    <!-- If You Done want to refresh the page -->
    <!-- <script>
      $('#postComment').submit(function (e) {
        e.preventDefault();
        $.ajax({
          url: '/user/comment',
          type: 'post',
          data: $('#postComment').serialize(),
          success: function () {},
        });
        this.reset();
      });
    </script> -->
  </body>
</html>
