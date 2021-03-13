<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주묻는 질문</title>

</head>
<body>

<jsp:include page="../main/header.jsp" />

      
  <section class="section section-wrap novi-background section-wrap-equal">
        <div class="section-wrap-inner">
          <div class="container container-bigger">
            <div class="row row-fix justify-content-md-center justify-content-lg-start justify-content-xl-between">
              <div class="col-md-9 col-lg-5">
                <div class="section-lg">
                  <h3>바베큐</h3>
                  <div class="divider divider-default"></div>
                  <p>바베큐를 즐길 수 있어요</p><a class="button button-primary" href="#">Learn More</a>
                </div>
              </div>
            </div>
          </div>
          <div class="section-wrap-aside section-wrap-image"><img src="/me/resources/images/ourservices/barbecue/1.jpg" alt="" width="960" height="660"/>
          </div>
        </div>
      </section>

      <section class="section section-wrap novi-background section-wrap-equal section-md-reverse">
        <div class="section-wrap-inner">
          <div class="container container-bigger">
            <div class="row row-fix justify-content-md-center justify-content-lg-end justify-content-xl-end">
              <div class="col-md-9 col-lg-5">
                <div class="section-lg">
                  <h3>수영장</h3>
                  <div class="divider divider-default"></div>
                  <p>수영장을 이용할 수 있어요</p><a class="button button-primary" href="#">Learn More</a>
                </div>
              </div>
            </div>
          </div>
          <div class="section-wrap-aside section-wrap-image"><img src="/me/resources/images/ourservices/pool/1.jpg" alt="" width="960" height="660"/>
          </div>
        </div>
      </section>

      <section class="section section-wrap novi-background section-wrap-equal">
        <div class="section-wrap-inner">
          <div class="container container-bigger">
            <div class="row row-fix justify-content-md-center justify-content-lg-start justify-content-xl-between">
              <div class="col-md-9 col-lg-5">
                <div class="section-lg">
                  <h3>테라스</h3>
                  <div class="divider divider-default"></div>
                  <p>테라스를 이용 할 수 있어요</p><a class="button button-primary" href="#">Learn More</a>
                </div>
              </div>
            </div>
          </div>
          <div class="section-wrap-aside section-wrap-image"><img src="/me/resources/images/ourservices/terrace/1.jpg" alt="" width="960" height="660"/>
          </div>
        </div>
      </section>

      <section class="section section-wrap novi-background section-wrap-equal section-md-reverse">
        <div class="section-wrap-inner">
          <div class="container container-bigger">
            <div class="row row-fix justify-content-md-center justify-content-lg-end justify-content-xl-end">
              <div class="col-md-9 col-lg-5">
                <div class="section-lg">
                  <h3>제트스키</h3>
                  <div class="divider divider-default"></div>
                  <p>제트스키를 이용 할 수 있어요</p><a class="button button-primary" href="#">Learn More</a>
                </div>
              </div>
            </div>
          </div>
          <div class="section-wrap-aside section-wrap-image">
          <img src="/me/resources/images/ourservices/jetski/1.jpg" alt="" width="960" height="660"/>
          </div>
        </div>
      </section>


<c:url var="blist" value="blist.do">
	<c:param name="page" value="1" />
</c:url>

	<section class="section section-xs text-center bg-primary">
        <div class="container container-wide">
          <div class="box-cta-thin">
            <p class="big"><span class="label-cta">잠시만요!</span><strong>Healing House</strong><span>&nbsp;&nbsp;방문자들의 솔직한 리뷰를 보실 수 있어요!&nbsp;&nbsp;</span><a class="link-bold" href="${ blist }">리뷰보러가기!</a></p>
          </div>
        </div>
      </section>


<jsp:include page="../main/footer.jsp" />

</body>
</html>
