<% Message msg1 = (Message) session.getAttribute("logedIn"); if(msg1 != null){
response.sendRedirect("/user"); } %> <%@ page language="java"
contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> <%@page
isELIgnored="false"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Insert title here</title>
    <%@include file="BootStrapStyle.jsp"%>
  </head>
  <body>
    <%@include file="navbar.jsp"%>

    <!--Login Form-->
    <main class="d-flex align-items-center" style="height: 84vh">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-6">
            <div class="card">
              <div
                class="card-header primary-background text-white text-center"
              >
                <h1>Login Here</h1>
              </div>

              <div class="card-body">
                <form action="signin" method="POST">
                  <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label"
                      >Email address</label
                    >
                    <input
                      name="username"
                      required
                      type="email"
                      class="form-control"
                      id="username"
                      aria-describedby="emailHelp"
                    />
                    <div id="emailHelp" class="form-text">
                      We'll never share your email with anyone else.
                    </div>
                  </div>
                  <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label"
                      >Password</label
                    >
                    <input
                      name="password"
                      required
                      type="password"
                      class="form-control"
                      id="password"
                    />
                  </div>

                  <div class="container text-center">
                    <button type="submit" class="btn btn-primary">Login</button>
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
