<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="ie-panel"><a href="home.do"><img src="/me/resources/images/logo.jpg" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today."></a></div>
    <!-- Page preloader-->
    <div class="page-loader">
      <div class="page-loader-body">
        <div class="preloader-wrapper big active">
          <div class="spinner-layer spinner-blue">
            <div class="circle-clipper left">
              <div class="circle"></div>
            </div>
            <div class="gap-patch">
              <div class="circle"></div>
            </div>
            <div class="circle-clipper right">
              <div class="circle"></div>
            </div>
          </div>
          <div class="spinner-layer spinner-red">
            <div class="circle-clipper left">
              <div class="circle"></div>
            </div>
            <div class="gap-patch">
              <div class="circle"></div>
            </div>
            <div class="circle-clipper right">
              <div class="circle"></div>
            </div>
          </div>
          <div class="spinner-layer spinner-yellow">
            <div class="circle-clipper left">
              <div class="circle"></div>
            </div>
            <div class="gap-patch">
              <div class="circle"></div>
            </div>
            <div class="circle-clipper right">
              <div class="circle"></div>
            </div>
          </div>
          <div class="spinner-layer spinner-green">
            <div class="circle-clipper left">
              <div class="circle"></div>
            </div>
            <div class="gap-patch">
              <div class="circle"></div>
            </div>
            <div class="circle-clipper right">
              <div class="circle"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <jsp:include page="./header.jsp" />
    
    <!-- Page-->
    <div class="page">
      <!-- Page Header-->
      <section class="section">
        <section class="fullwidth-page novi-background bg-cover bg-gray-950">
          <div class="fullwidth-page-inner">
            <div class="section-md text-center">
              <div class="container">
                <p class="breadcrumbs-custom-subtitle">Sorry, But the Page Was not Found</p>
                <p class="heading-1 breadcrumbs-custom-title">Error 404</p>
                <p>You may have mistyped the address or the page may have moved.</p><a class="button button-primary" href="index.html">Back To Home Page</a>
              </div>
            </div>
            <!-- Page Footer-->
            <div class="section-xs page-footer text-center">
              <div class="container">
                <p class="rights"><span>&copy;&nbsp;</span><span class="copyright-year"></span><span>.&nbsp;</span><span>All Rights Reserved.&nbsp;</span><a href="privacy-policy.html">Privacy Policy.</a></p>
              </div>
            </div>
          </div>
        </section>
      </section>
    </div>
</body>
</html>