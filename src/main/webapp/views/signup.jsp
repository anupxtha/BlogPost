<% Message msg3 = (Message) session.getAttribute("logedIn"); if(msg3 != null){
response.sendRedirect("/user"); } %> <%@ page language="java"
contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> <%@page
import="com.blog.helper.*"%> <%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Insert title here</title>

    <%@include file="BootStrapStyle.jsp"%>
  </head>
  <body>
    <%@include file="navbar.jsp"%>

    <!--Registration Form-->
    <main class="d-flex align-items-center" style="height: 90vh">
      <div class="container">
        <div class="row">
          <div class="col-md-6 offset-md-3">
            <% Message msg1 = (Message) session.getAttribute("message"); if
            (msg1 != null) { %>
            <div class="alert <%=msg1.getType()%> text-center" role="alert">
              <%=msg1.getContent()%>
            </div>
            <div class="card">
              <% session.removeAttribute("message"); } %>

              <div
                class="card-header primary-background text-white text-center"
              >
                <h1>Fill the Form</h1>
              </div>

              <div class="card-body">
                <form id="reg-form" action="register" method="post">
                  <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input
                      name="name"
                      type="text"
                      class="form-control"
                      id="name"
                      aria-describedby="emailHelp"
                    />
                  </div>

                  <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input
                      name="email"
                      type="email"
                      class="form-control"
                      id="email"
                      aria-describedby="emailHelp"
                    />
                    <div id="emailHelp" class="form-text">
                      We'll never share your email with anyone else.
                    </div>
                  </div>

                  <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input
                      name="password"
                      type="password"
                      class="form-control"
                      id="exampleInputPassword1"
                    />
                  </div>

                  <div class="mb-3">
                    <label for="gender" class="form-label">Select Gender</label>
                    <br />
                    <input type="radio" name="gender" value="male" />&nbsp; Male
                    &nbsp;&nbsp;
                    <input type="radio" name="gender" value="female" />&nbsp;
                    Female
                  </div>

                  <br />
                  <div class="mb-3 form-check">
                    <input
                      name="check"
                      type="checkbox"
                      class="form-check-input"
                      id="exampleCheck1"
                    />
                    <label class="form-check-label" for="exampleCheck1"
                      >Agree Terms & Conditions</label
                    >
                  </div>

                  <br />

                  <div class="container text-center">
                    <button
                      id="submit-btn"
                      type="submit"
                      class="btn btn-primary"
                    >
                      Submit
                    </button>
                    <button
                      id="submit-btn"
                      type="reset"
                      class="btn btn-primary"
                    >
                      Reset
                    </button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>

    <%@include file="BootStrapJs.jsp"%>
  </body>
</html>
