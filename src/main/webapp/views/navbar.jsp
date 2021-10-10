<%@page import="com.blog.helper.*"%> <%@page isELIgnored="false" %>

<nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <a class="navbar-brand ml-5" href="/">Blog Application</a>

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
      <li class="nav-item active mr-3">
        <a class="nav-link" href="/"
          >Home
          <span class="sr-only">(current)</span>
        </a>
      </li>

      <li class="nav-item mr-3"><a class="nav-link" href="/blog">Blog</a></li>

      <li class="nav-item mr-3">
        <a class="nav-link" href="/signin">Sign-In</a>
      </li>

      <li class="nav-item mr-5">
        <a class="nav-link" href="/signup">Sign-up</a>
      </li>
    </ul>
  </div>
</nav>
