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
      <a class="navbar-brand ml-5" href="/user">${user.name}</a>

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
            <a class="nav-link" href="/user/myblog">My-Blog</a>
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

    <% session.removeAttribute("logedIn"); } %>

    <!-- <div class="text-center mt-5">
      <img
        src="/profile/${user.profile}"
        alt="${user.profile}"
        style="width: 400px; height: 400px"
      />
      <h1>${user.name}</h1>
      <h1>${user.email }</h1>
    </div> -->

    <%@include file="BootStrapJs.jsp"%>
  </body>
</html>
