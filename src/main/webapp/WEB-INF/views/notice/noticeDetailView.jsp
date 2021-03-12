<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- 응답온 페이지값 추출함 --%>
<c:set var="currentPage" value="${ requestScope.page }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 열람 페이지</title>
</head>
<body>
	
	<jsp:include page="../main/header.jsp" />
	
      <!-- Single post-->
      <section class="section section-lg bg-default">
        <div class="container container-wide">
          <div class="row justify-content-sm-center">
            <div class="col-lg-10 col-xl-8 col-xxl-6 sections-collapsable single-post-wrap">
              <article class="post-blog-article">
                <p class="post-blog-article-title">${ notice.ntitle }</p>
             
                <ul class="post-blog-article-meta group-xl">
                  
                  <li>
                    <div class="box-inline">
                    	<span class="icon novi-icon icon-md icon-primary mdi mdi-account"></span>
						<div><a href="#">${ notice.nuser }</a></div>
                    </div>
                  </li>
                  
                  <li>
                    <div class="box-inline">
                    	<span class="icon novi-icon icon-md icon-primary mdi mdi-calendar-clock"></span>
                    	<div>${ notice.n_date }</div>
                    </div>
                  </li>
                  
                  <li>
                    <div class="box-inline">
                    	<span class="icon novi-icon icon-md icon-primary mdi mdi-calendar-clock"></span>
                    	<div>
    	                	<c:if test="${ empty notice.n_file }">첨부파일 없음</c:if>
							<c:if test="${ !empty notice.n_file }">
								<c:url var="nfd" value="/nfdown.do">
									<c:param name="ofile" value="${ notice.n_file }" />
									<c:param name="rfile" value="${ notice.n_rfile }" />
								</c:url>
							<a href="${ nfd }">${ notice.n_file }</a>
							</c:if>
                    	</div>
                    </div>
                  </li>
                  
                  <li>
                    <div class="box-inline">
                    	<span class="icon novi-icon icon-md icon-primary mdi mdi-calendar-clock"></span>
                    	<div>${ notice.ncount }</div>
                    </div>
                  </li>
                  
                </ul>

                <ul class="post-blog-article-meta group-xl">
                
                <li>
                    <div class="box-inline">
						<div>

				          	<%-- 관리자가 접속했을 때 --%>
							<c:if test="${ !empty sessionScope.loginUser and loginUser.nick eq notice.nuser and loginUser.user_lv eq 'admin' }">
								<c:url var="nuv" value="/upmove.do">
									<c:param name="nid" value="${ notice.nid }" />
									<c:param name="page" value="${ currentPage }" />
								</c:url>
							<button type="button" onclick="javascript:location.href='${ nuv }'" style='float:center'>수정</button>
											 
								<c:url var="ndl" value="/ndel.do">
									<c:param name="nid" value="${ notice.nid }" />
								</c:url>
							<button type="button" onclick="javascript:location.href='${ ndl }'" style='float:center'>글삭제</button>
							
								<c:url var="nls" value="/nlist.do">
									<c:param name="page" value="${ currentPage }" />
								</c:url>
							<button type="button" onclick="javascript:location.href='${ nls }'" style='float:center'>목록</button>
							
							</c:if> 
							
							<%-- 로그인한 유저라면 --%>
							<c:if test="${ !empty sessionScope.loginUser and loginUser.user_lv eq 'MEMBER' }">
											
								<c:url var="nls" value="/nlist.do">
										<c:param name="page" value="${ currentPage }" />
									</c:url>
								<button type="button" onclick="javascript:location.href='${ nls }'" style='float:right'>목록</button>
							</c:if> 
							
							<%-- 비로그인일때 --%> 
							<c:if test="${ empty sessionScope.loginUser }">  
								<c:url var="nls" value="/nlist.do">
									<c:param name="page" value="${ currentPage }" />
								</c:url>
							<button type="button" onclick="javascript:location.href= '${ nls }';">목록</button>
							</c:if>
							
						</div>
                    </div>
                  </li>
                
                
                </ul>

                <p class="big">${ notice.ncontent }</p>
                
              </article>
              
              
              <div class="section-md">
                <p class="h4-alternate">댓글작성</p>
                <div class="comment-group">
                  <!-- Comment-->
                  <article class="comment">
                    <div class="comment-body">
                      <div class="comment-header">
                        <p class="comment-title">Catherine Payne</p>
                        <time class="comment-time" datetime="2019">2 days ago</time>
                      </div>
                      <div class="comment-text">
                        <p>Ei sumo eruditi sadipscing nec, scripta epicurei ut eam. Duo ut fastidii platonem, eu soleat salutandi neglegentur est. Erant harum malorum eum ne</p>
                      </div>
                      <div class="comment-footer"><a class="comment-link-reply" href="#">Reply</a></div>
                    </div>
                  </article>
                  <div class="comment-group"> 
                    <!-- Comment-->
                    <article class="comment">
                      <div class="comment-avatar"><img src="images/user-2-80x80.jpg" alt="" width="80" height="80"/>
                      </div>
                      <div class="comment-body">
                        <div class="comment-header">
                          <p class="comment-title">Ronald Chen</p>
                          <time class="comment-time" datetime="2019">2 days ago</time><span class="comment-reply">Catherine Payne</span>
                        </div>
                        <div class="comment-text">
                          <p>Te partem omnesque eligendi has, nam ex persius lobortis. His ex amet facilis, ne vix diceret dolorum. Veniam nonumes sit an. Sit et possit hendrerit, ne his doming mnesarchum</p>
                        </div>
                        <div class="comment-footer"><a class="comment-link-reply" href="#">Reply</a></div>
                      </div>
                    </article>
                  </div>
                  <!-- Comment-->
                  <article class="comment">
                    <div class="comment-avatar"><img src="images/user-3-80x80.jpg" alt="" width="80" height="80"/>
                    </div>
                    <div class="comment-body">
                      <div class="comment-header">
                        <p class="comment-title">Philip Bowman</p>
                        <time class="comment-time" datetime="2019">2 days ago</time>
                      </div>
                      <div class="comment-text">
                        <p>Ei tollit euismod cum, augue labore euripidis mel ex, ut corpora appellantur deterruisset mel. Quo et consulatu suscipiantur. In sed homero habemus neglegentur</p>
                      </div>
                      <div class="comment-footer"><a class="comment-link-reply" href="#">Reply</a></div>
                    </div>
                  </article>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

	<jsp:include page="../main/footer.jsp" />
	
</body>
</html>