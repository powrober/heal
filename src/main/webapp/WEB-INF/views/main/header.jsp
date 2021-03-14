<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>힐링하우스</title>

<script src="/me/resources/js/3ts2ksMwXvKRuG480KNifJ2_JNM.js"></script>

<!-- Stylesheets-->
<link rel="stylesheet" type="text/css"
	href="//fonts.googleapis.com/css?family=Lato:100,300,300i,400,700,900%7CLibre+Baskerville:400,700">
<link rel="stylesheet" href="/me/resources/css/bootstrap.css">
<link rel="stylesheet" href="/me/resources/css/style.css">
<link rel="stylesheet" href="/me/resources/css/fonts.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


<style>
.ie-panel {
	display: none;
	background: #212121;
	padding: 10px 0;
	box-shadow: 3px 3px 5px 0 rgba(0, 0, 0, .3);
	clear: both;
	text-align: center;
	position: relative;
	z-index: 1;
}

html.ie-10 .ie-panel, html.lt-ie-10 .ie-panel {
	display: block;
}
</style>

</head>

<body>

    <div class="ie-panel"><a href="#"><img src="#" height="42" width="820" alt="#"></a></div>
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


    <!-- Page-->
    <div class="page" >
      <!-- Page Header-->
      <header class="section page-header">
        <!-- RD Navbar-->
        <div class="rd-navbar-wrap rd-navbar-corporate">
          <nav class="rd-navbar" data-layout="rd-navbar-fixed" data-sm-layout="rd-navbar-fixed" data-md-layout="rd-navbar-fixed" data-lg-layout="rd-navbar-fixed" data-xl-layout="rd-navbar-static" data-md-device-layout="rd-navbar-fixed" data-lg-device-layout="rd-navbar-fixed" data-xl-device-layout="rd-navbar-static" data-md-stick-up-offset="130px" data-lg-stick-up-offset="100px" data-stick-up="true" data-sm-stick-up="true" data-md-stick-up="true" data-lg-stick-up="true" data-xl-stick-up="true">
            <div class="rd-navbar-collapse-toggle" data-rd-navbar-toggle=".rd-navbar-collapse"><span></span></div>
            <div class="rd-navbar-top-panel rd-navbar-collapse novi-background">
              <div class="rd-navbar-top-panel-inner">
                <ul class="rd-list-inline">
                  <li class="box-inline list-inline-item"><span><i class="fa fa-phone"></i></span>
                    <ul class="list-comma">
                      <li><a href="tel:010-6634-3990">예약문의 : 010-6634-3990</a></li>
                    </ul>
                  </li>
                  <li class="box-inline list-inline-item"><span><i class="fa fa-map-marker"></i></span><a href="#">경남 통영시 욕지면 유동길 89-79</a></li>
                  <li class="box-inline list-inline-item"><span><i class="fa fa-envelope-o"></i></span><a href="#">powr_ober@naver.com</a></li>
                </ul>
                <!-- <ul class="group-sm">
                  <li><a class="icon novi-icon icon-sm-bigger icon-gray-1 mdi mdi-facebook" href="#"></a></li>
                  <li><a class="icon novi-icon icon-sm-bigger icon-gray-1 mdi mdi-twitter" href="#"></a></li>
                  <li><a class="icon novi-icon icon-sm-bigger icon-gray-1 mdi mdi-instagram" href="#"></a></li>
                  <li><a class="icon novi-icon icon-sm-bigger icon-gray-1 mdi mdi-google" href="#"></a></li>
                  <li><a class="icon novi-icon icon-sm-bigger icon-gray-1 mdi mdi-linkedin" href="#"></a></li>
                </ul> -->
              </div>
              <div class="rd-navbar-top-panel-inner"><a class="button button-sm button-primary" href="#">예약하기</a></div>
            </div>
            <div class="rd-navbar-inner">
              <!-- RD Navbar Panel-->
              <div class="rd-navbar-panel">
                <!-- RD Navbar Toggle-->
                <button class="rd-navbar-toggle" data-rd-navbar-toggle=".rd-navbar-nav-wrap"><span></span></button>
                <!-- RD Navbar Brand-->
                <div class="rd-navbar-brand">
                  <!--Brand--><a class="brand-name" href="index.jsp"><img class="logo-default" src="/me/resources/images/logo1.jpg" alt="" width="185" height="57"/><img class="logo-inverse" src="/me/resources/images/logo2.jpg" alt="" width="185" height="30"/></a>
                </div>
              </div>
              
              <div class="rd-navbar-aside-center">
                <div class="rd-navbar-nav-wrap">
                  <!-- RD Navbar Nav-->
                  
<c:url var="nlist" value="nlist.do">
	<c:param name="page" value="1" />
</c:url>
<c:url var="blist" value="blist.do">
	<c:param name="page" value="1" />
</c:url>
<c:url var="mlist" value="mlist.do">
	<c:param name="page" value="1" />
</c:url>
                  
                  <ul class="rd-navbar-nav" style="float:left;">
                    <li class="active"><a href="home.do">Home</a></li>
                    <li><a href="#">예약안내</a></li>
                    <li><a href="enjoy.do">즐길거리</a></li>
                    <li><a href="${ nlist }">공지사항</a></li>
                    <li><a href="${ blist }">자유게시판</a></li>
                    <li><a href="qna.do">QnA</a></li>
                    <c:if test="${ empty sessionScope.loginUser }">
						<li><a class="nav-link" href="loginView.do">로그인</a></li>
						<li><a class="nav-link" href="enrollView.do">회원가입</a></li>
				    </c:if>
					<c:if test="${ !empty sessionScope.loginUser and loginUser.user_lv eq 'MEMBER' }">
						<c:url var="mypage" value="/myInfo.do">
						<c:param name="nick" value="${ loginUser.nick }"/>
					</c:url>
						<li><a class="nav-link" href="${ mypage }">마이페이지</a></li>
						<li><a class="nav-link" href="logout.do">로그아웃</a></li>
					</c:if>
					<c:if test="${ !empty sessionScope.loginUser and loginUser.user_lv eq 'admin' }">
						<c:url var="mypage" value="/myInfo.do">
						<c:param name="nick" value="${ loginUser.nick }"/>
					</c:url>
						<li><a class="nav-link" href="${ mlist }">관리자페이지</a></li>
						<li><a class="nav-link" href="logout.do">로그아웃</a></li>
					</c:if>
                  </ul>
                </div>
              </div>
              
              <div class="rd-navbar-aside-right"><a class="button button-sm button-primary" href="#">예약하기</a></div>
            </div>
          </nav>
        </div>
      </header>
    </div>
    
</body>
</html>