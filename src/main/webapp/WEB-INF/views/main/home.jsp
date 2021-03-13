<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

<jsp:include page="./header.jsp" />

      
      <section class="section">
        <div class="swiper-form-wrap">
          <!-- Swiper-->
          <div class="swiper-container swiper-slider swiper-slider_height-1 swiper-align-left swiper-align-left-custom context-dark bg-gray-darker" data-loop="false" data-autoplay="4782" data-simulate-touch="false" data-slide-effect="fade">
            <div class="swiper-wrapper">
              <div class="swiper-slide" data-slide-bg="/me/resources/images/swiper1.jpg">
                <div class="swiper-slide-caption">
                  <div class="container container-bigger swiper-main-section">
                    <div class="row row-fix justify-content-sm-center justify-content-md-start">
                      <div class="col-md-6 col-lg-5 col-xl-4 col-xxl-5">
                        <h3>Your Perfect Accommodation</h3>
                        <div class="divider divider-default"></div>
                        <p class="text-spacing-sm">Jasmine hotel offers comfortable accommodation with a wide variety of rooms, additional services, and amenities available to all our guests. We offer the highest level of hospitality and great customer service.</p><a class="button button-default-outline button-sm" href="rooms-&amp;-suites.html">Learn More</a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="swiper-slide" data-slide-bg="/me/resources/images/swiper2.jpg">
                <div class="swiper-slide-caption">
                  <div class="container container-bigger swiper-main-section">
                    <div class="row row-fix justify-content-sm-center justify-content-md-start">
                      <div class="col-md-6 col-lg-5 col-xl-4 col-xxl-5">
                        <h3>150+ Rooms to Choose From</h3>
                        <div class="divider divider-default"></div>
                        <p class="text-spacing-sm">Our hotel has a wide variety of greatly furnished and fully equipped rooms for every guest. Whether you are travelling on busiess or with family, we have what you need to enjoy your stay.</p><a class="button button-default-outline button-sm" href="rooms-&amp;-suites.html">Learn More</a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="swiper-slide" data-slide-bg="/me/resources/images/swiper3.jpg">
                <div class="swiper-slide-caption">
                  <div class="container container-bigger swiper-main-section">
                    <div class="row row-fix justify-content-sm-center justify-content-md-start">
                      <div class="col-md-6 col-lg-5 col-xl-4 col-xxl-5">
                        <h3>Diverse Facilities</h3>
                        <div class="divider divider-default"></div>
                        <p class="text-spacing-sm">At our hotel, you can always feel comfortable in your room, having the right surroundings to relax and reload as it is utmost important. We offer a wide variety of hotel facilities including what you require.</p><a class="button button-default-outline button-sm" href="rooms-&amp;-suites.html">Learn More</a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- Swiper controls-->
            <div class="swiper-pagination-wrap">
              <div class="container container-bigger">
                <div class="row">
                  <div class="col-sm-12">
                    <div class="swiper-pagination"></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="container container-bigger form-request-wrap form-request-wrap-modern">
            <div class="row row-fix justify-content-sm-center justify-content-lg-end">
              <div class="col-lg-5 col-xxl-5">
                <div class="form-request form-request-modern">
                  <h4>힐링하우스 예약하기</h4>
                  <!-- RD Mailform-->
                  <form class="rd-mailform form-fix">
                    <div class="row row-17 row-fix">
                      <div class="col-sm-12">
                        <label class="form-label-outside">Check in</label>
                        <div class="form-wrap form-wrap-inline">
                          <input class="form-input" id="forms-current-from" data-time-picker="date"><span class="data-time-picker-arrow"></span>
                          <label class="form-label" for="forms-current-from">입실날짜</label>
                        </div>
                      </div>
                      <div class="col-sm-12">
                        <label class="form-label-outside">Check out</label>
                        <div class="form-wrap form-wrap-inline">
                          <input class="form-input" id="forms-current-to" data-time-picker="date"><span class="data-time-picker-arrow"></span>
                          <label class="form-label" for="forms-current-to">퇴실날짜</label>
                        </div>
                      </div>
                      <div class="col-lg-6">
                        <label class="form-label-outside">Adults</label>
                        <div class="form-wrap form-wrap-modern">
                          <input class="form-input input-append" id="form-element-stepper" type="number" min="0" max="300" value="2">
                        </div>
                      </div>
                      <div class="col-lg-6">
                        <label class="form-label-outside">Children</label>
                        <div class="form-wrap form-wrap-modern">
                          <input class="form-input input-append" id="form-element-stepper-1" type="number" min="0" max="300" value="0">
                        </div>
                      </div>
                    </div>
                    <div class="form-wrap form-button">
                      <button class="button button-block button-primary" type="submit">예약 확인하기</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      
       <section class="section section-lg novi-background bg-cover bg-default text-center" style="padding-bottom: 30px;">
        <div class="container container-wide">
            <div class="col-sm-12">
              <div class="parallax-text-wrap">
                <h3>Healing House Room</h3><span class="parallax-text" style="left: 80px;">Healing House</span>
              </div><img class="title-decorative" src="/me/resources/images/title-decorative-84x8.png" alt="" width="84" height="8"/>
              
              <!-- Owl Carousel-->
              <div class="owl-carousel owl-carousel-team owl-carousel-inset" data-items="1" data-sm-items="1" data-md-items="1" data-lg-items="3" data-xl-items="3" data-xxl-items="3" data-stage-padding="5" data-loop="true" data-margin="30" data-mouse-drag="false" data-dots="true" data-autoplay="true">
                <article class="post-blog"><a class="post-blog-image" href="#"><img src="/me/resources/images/room/main/1-1.jpg" alt="" width="570" height="415"/></a>
                  <div class="post-blog-caption">
                    <div class="post-blog-caption-header">
                      <ul class="post-blog-tags">
                        <li><a class="button-tags" href="#">인기</a></li>
                      </ul>
                      <ul class="post-blog-meta">
                        <li><span>온돌</span></li>
                      </ul>
                    </div>
                    <div class="post-blog-caption-body">
                      <h5><a class="post-blog-title" href="#">블루102호 / 퍼플101호, 102호</a></h5>
                    </div>
                  </div>
                </article>
                <article class="post-blog"><a class="post-blog-image" href="#"><img src="/me/resources/images/room/main/1-2.jpg" alt="" width="570" height="415"/></a>
                  <div class="post-blog-caption">
                    <div class="post-blog-caption-header">
                      <ul class="post-blog-tags">
                        <li><a class="button-tags" href="#">인기</a></li>
                      </ul>
                      <ul class="post-blog-meta">
                        <li><span>침대</span></li>
                      </ul>
                    </div>
                    <div class="post-blog-caption-body">
                      <h5><a class="post-blog-title" href="#">블루103호 / 퍼플103호</a></h5>
                    </div>
                  </div>
                </article>
                <article class="post-blog"><a class="post-blog-image" href="#"><img src="/me/resources/images/room/main/1-3.jpg" alt="" width="570" height="415"/></a>
                  <div class="post-blog-caption">
                    <div class="post-blog-caption-header">
                      <ul class="post-blog-tags">
                        <li><a class="button-tags" href="#">인기</a></li>
                      </ul>
                      <ul class="post-blog-meta">
                        <li><span>특실/복층</span></li>
                      </ul>
                    </div>
                    <div class="post-blog-caption-body">
                      <h5><a class="post-blog-title" href="#">블루201호 / 퍼플203호</a></h5>
                    </div>
                  </div>
                </article>
                <article class="post-blog"><a class="post-blog-image" href="#"><img src="/me/resources/images/room/main/1-4.jpg" alt="" width="570" height="415"/></a>
                  <div class="post-blog-caption">
                    <div class="post-blog-caption-header">
                      <ul class="post-blog-tags">
                        <li><a class="button-tags" href="#">인기</a></li>
                      </ul>
                      <ul class="post-blog-meta">
                        <li><span>특실/복층</span></li>
                      </ul>
                    </div>
                    <div class="post-blog-caption-body">
                      <h5><a class="post-blog-title" href="#">블루202호 / 퍼플202호</a></h5>
                    </div>
                  </div>
                </article>
                <article class="post-blog"><a class="post-blog-image" href="#"><img src="/me/resources/images/room/main/1-5.jpg" alt="" width="570" height="415"/></a>
                  <div class="post-blog-caption">
                    <div class="post-blog-caption-header">
                      <ul class="post-blog-tags">
                        <li><a class="button-tags" href="#">인기</a></li>
                      </ul>
                      <ul class="post-blog-meta">
                        <li><span>특실/복층</span></li>
                      </ul>
                    </div>
                    <div class="post-blog-caption-body">
                      <h5><a class="post-blog-title" href="#">퍼플201호, 203호</a></h5>
                    </div>
                  </div>
                </article>
              </div>
            </div>
        </div>
      </section>
      
      
      <!-- about service-->
       <section class="section section-lg bg-gray-100 text-center" style="padding-top: 30px;">
        <div class="container container-wide">
          <div class="row row-50 justify-content-md-center justify-content-xl-between" style="margin-bottom: -300px;">
            <div class="col-md-9 col-xl-5">
              <h3>안녕하세요!<br> <b>Healing House</b> 입니다</h3>
              <div class="divider divider-default"></div>
              <p>힐링하우스 펜션 홈페이지에 방문해 주셔서 감사합니다. 저희 욕지도 힐링하우스 펜션은 욕지도 유동마을 바닷가 언덕에 위치하여 펜션 앞으로 탁 트인 바다전망이 한눈에 들어옵니다.
				  아름다운 바다전망이 보이는 깨끗한 객실과 넓은 야외공간이 있어 좋은 분들과의 욕지 여행길이 더욱 즐거워 진답니다.</p>
              <!-- Quote minimal-->
              <article class="quote-minimal">
                <p class="quote-minimal-text">대표 전성국</p>
              </article>
              <p>아름다운 욕지도 유동마을 바닷가에서 바다체험도 할 수 있고 욕지도 일주드라이브 코스 옆에 위치하여 욕지도 여행지 어디로든 편하게 가실 수 있어 정말 좋습니다.
				  아름다운 욕지도 여행길에 저희 욕지도 힐링하우스 펜션으로 오셔서 여러분들의 욕지도 여행에 정말 좋은 추억을 만들고 가시기 바랍니다. 감사합니다.</p>
            </div>
            <div class="col-xl-6 text-center" style="position: relative;"><img src="/me/resources/images/ourview1.jpg" alt="" width="1200" height="1000"/></div>
            <div class="col-xl-6" style="position: relative; left:500px; top: -300px;"><img src="/me/resources/images/CEO.jpg" alt="" width="400" height="400"/></div>
          </div>
        </div>
      </section>


<jsp:include page="./footer.jsp" />

</body>
</html>
