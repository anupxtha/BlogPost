<%@page isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ page language="java"
contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<div class="card-columns">
  <c:forEach items="${pl}" var="p">
    <div class="card product-card">
      <div class="container text-center">
        <img
          class="card-img-top m-2"
          src="/image/${p.image}"
          style="max-height: 270px; max-width: 100%; width: auto"
          alt=""
        />
      </div>

      <div class="card-body">
        <h5 class="card-title">${p.title}</h5>
        <p class="card-text">${p.description}</p>
      </div>

      <div class="card-footer text-center">
        <button class="btn btn-outline-success text-center">
          <a href="/user/post/${p.id}">View Post</a>
        </button>
      </div>
    </div>
  </c:forEach>
</div>
