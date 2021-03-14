<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="maxPage" value="${ requestScope.maxPage }" />
<c:set var="startPage" value="${ requestScope.startPage }" />
<c:set var="endPage" value="${ requestScope.endPage }" />
<c:set var="currentPage" value="${ requestScope.currentPage }" />

<%-- 글쓰기 페이지 이동 요청 url --%>
<c:url var="bll" value="/b.blame.list.do" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 신고회원 관리페이지</title>

<script type="text/javascript" src="/me/resources/js/jquery-3.5.1.min.js"></script>

</head>

<body>
	
<jsp:include page="../main/header.jsp" />
	
	
<c:url var="mlist" value="mlist.do">
	<c:param name="page" value="1" />
</c:url>
<c:url var="bllist" value="b.blame.list.do">
	<c:param name="page" value="1" />
</c:url>
<c:url var="blist" value="adminblist.do">
	<c:param name="page" value="1" />
</c:url>
<c:url var="nlist" value="adminnlist.do">
	<c:param name="page" value="1" />
</c:url>
	
     <section class="section breadcrumbs-custom parallax-container context-dark" data-parallax-img="/me/resources/images/swiper1.jpg" >
       <div class="parallax-content">
         <div class="container">
           <p class="heading-1 breadcrumbs-custom-title">불량회원 리스트</p>
           <ul class="breadcrumbs-custom-path">
             <li><a href="home.do">Home</a></li>
             <li><a href="${ mlist }">회원리스트</a></li>
             <li><a href="${ bllist }">불량회원 리스트</a></li>
             <li><a href="${ nlist }">공지사항</a></li>
             <li><a href="${ blist }">자유게시판</a></li>
             <li><a href="#">????</a></li>
           </ul>
         </div>
       </div>
     </section>
 	
	<div style="text-align: center; padding-top: 30px;">
		<div>
			<h2 style="margin: 20px 0 10px 0;">불량회원 리스트</h2>
		</div>
	</div>
		
	<div class="my_info_area" align="center" style="padding-top:30px; padding-bottom:30px ">
		<table cellspacing="0" class="boardtype2 th_border my_table" width="1000" >
			<colgroup>
				<col width="50">
				<col width="80">
				<col width="80">
				<col width="80">
				<col width="350">
				<col width="80">
			</colgroup>
			<thead>
				<tr>
					<th style="text-align:center; font-size:15px; font-family:sans-serif; color: black;" scope="col" class="title">번 호</th>
					<th style="text-align:center; font-size:15px; font-family:sans-serif; color: black;" scope="col">신고유형</th>
					<th style="text-align:center; font-size:15px; font-family:sans-serif; color: black;" scope="col">신고자</th>
					<th style="text-align:center; font-size:15px; font-family:sans-serif; color: black;" scope="col">불량회원</th>
					<th style="text-align:center; font-size:15px; font-family:sans-serif; color: black;" scope="col">신고내용</th>
					<th style="text-align:center; font-size:15px; font-family:sans-serif; color: black;" scope="col">신고접수일</th>
				</tr>
				
				<tr>
					<td colspan="7" class="blank2">&nbsp;
			    </tr>
            </thead>
            <tbody>
                <tr>
            	    <c:forEach items="${ requestScope.list }" var="b" >
	                <tr>
						<td align="center" width="80"  style="font-size:15px; color: black;">${ b.blame_no }</td>
	
						<td align="center" width="80"  style="font-size:15px; color: black;">${ b.blame_type }</td>
						
						<td align="center" width="100"  style="font-size:15px; color: black;">${ b.reporter }</td>
	
						<td align="center" width="100"  style="font-size:15px; color: black;">${ b.targetuser }</td>
	
						<td align="center" width="350" style="font-size:15px; color: black;">${ b.blame_content }</td>
						
						<td align="center" width="100" style="font-size:15px; color: black;">${ b.blame_date }</td>
						
					</tr>
					</c:forEach>
            </tbody>
        </table>
    </div>
	

	<br>
	<br>
	<br>
	

	<%-- 현재 페이지가 1이 아니면 링크설정, 현재 1페이지이면 링크없음 --%>
	<c:if test="${ empty action}">
		<%-- 페이징 처리  [맨처음][이전] 숫자...........  [다음][맨끝] --%>
		<div style="text-align: center; margin-bottom: 50px; margin-top: -80px">
			<c:if test="${ currentPage <= 1}">
            [맨처음]
         </c:if>
			<c:if test="${ currentPage > 1 }">
				<c:url var="bbls" value="/b.blame.list.do">
					<c:param name="page" value="1" />
				</c:url>
				<a href="${ bbls }">[맨처음]</a>
			</c:if>
			&nbsp;
			<%-- 이전 그룹이 있으면 링크설정, 이전 그룹 없으면 링크없음 --%>
			<c:if
				test="${ (currentPage - 10) < startPage and (currentPage - 10) >= 1 }">
				<c:url var="bbls2" value="/b.blame.list.do">
					<c:param name="page" value="${ startPage - 10 }" />
				</c:url>
				<a href="${ bbls2 }">[이전]</a>
			</c:if>
			<c:if
				test="${ !((currentPage - 10) < startPage and (currentPage - 10) >= 1) }">
               [이전]
         </c:if>
			&nbsp;
			<%-- 가운데 표시할 페이지 그룹 숫자 링크 설정 --%>
			<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
				<c:if test="${ p eq currentPage }">
					<font size="4" color="red">[${ p }]</font>
				</c:if>
				<c:if test="${ p ne currentPage }">
					<c:url var="bbls3" value="/b.blame.list.do">
						<c:param name="page" value="${ p }" />
					</c:url>
					<a href="${ bbls3 }">${ p }</a>
				</c:if>
			</c:forEach>
			&nbsp;
			<%-- 다음 그룹이 있으면 링크설정, 다음 그룹 없으면 링크없음 --%>
			<c:if
				test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
				<c:url var="bbls4" value="/b.blame.list.do">
					<c:param name="page" value="${ endPage + 10 }" />
				</c:url>
				<a href="${ bbls4 }">[다음그룹]</a>
			</c:if>
			<c:if
				test="${ !((currentPage + 10) > endPage && (currentPage + 10) < maxPage) }">
               [다음그룹]&nbsp;
         </c:if>

			<!-- 맨끝 페이지로 이동 처리 -->
			<c:if test="${ currentPage >= maxPage }">
            [맨끝]&nbsp;
         </c:if>
			<c:if test="${ currentPage < maxPage }">
				<c:url var="bbls5" value="/b.blame.list.do">
					<c:param name="page" value="${ maxPage }" />
				</c:url>
				<a href="${ bbls5 }">[맨끝]</a>
			</c:if>
		</div>
	</c:if>


	<c:if test="${ !empty action}">
		<%-- 페이징 처리  [맨처음][이전] 숫자...........  [다음][맨끝] --%>
		<div style="text-align: center;">
			<c:if test="${ currentPage <= 1}">
            [맨처음]
         </c:if>
			<c:if test="${ currentPage > 1 }">
				<c:url var="search1" value="${ action }">
					<c:if test="${ action ne 'bsearchDate.do'}">'}">
						<c:param name="page" value="1" />
					</c:if>
					<c:if test="${ action eq 'bsearchDate.do'}">'}">
						<c:param name="begin" value="${ begin }" />
						<c:param name="end" value="${ end }" />
					</c:if>
				</c:url>
				<a href="${ search1 }">[맨처음]</a>
			</c:if>
			&nbsp;
			<%-- 이전 그룹이 있으면 링크설정, 이전 그룹 없으면 링크없음 --%>
			<c:if
				test="${ (currentPage - 10) < startPage and (currentPage - 10) >= 1 }">
				<c:url var="search2" value="/b.blame.list.do">
					<c:param name="page" value="${ startPage - 10 }" />
				</c:url>
				<a href="${ search2 }">[이전]</a>
			</c:if>
			<c:if
				test="${ !((currentPage - 10) < startPage and (currentPage - 10) >= 1) }">
               [이전]
         </c:if>
			&nbsp;
			<%-- 가운데 표시할 페이지 그룹 숫자 링크 설정 --%>
			<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
				<c:if test="${ p eq currentPage }">
					<font size="4" color="red">[${ p }]</font>
				</c:if>
				<c:if test="${ p ne currentPage }">
					<c:url var="search3" value="/b.blame.list.do">
						<c:param name="page" value="${ p }" />
					</c:url>
					<a href="${ search3 }">${ p }</a>
				</c:if>
			</c:forEach>
			&nbsp;
			<%-- 다음 그룹이 있으면 링크설정, 다음 그룹 없으면 링크없음 --%>
			<c:if
				test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
				<c:url var="search4" value="/b.blame.list.do">
					<c:param name="page" value="${ endPage + 10 }" />
				</c:url>
				<a href="${ search4 }">[다음그룹]</a>
			</c:if>
			<c:if
				test="${ !((currentPage + 10) > endPage && (currentPage + 10) < maxPage) }">
               [다음그룹]&nbsp;
         </c:if>
			<!-- 맨끝 페이지로 이동 처리 -->
			<c:if test="${ currentPage >= maxPage }">
            [맨끝]&nbsp;
         </c:if>
			<c:if test="${ currentPage < maxPage }">
				<c:url var="search5" value="/b.blame.list.do">
					<c:param name="page" value="${ maxPage }" />
				</c:url>
				<a href="${ search5 }">[맨끝]</a>
			</c:if>
		</div>
	</c:if>

	<jsp:include page="../main/footer.jsp" />
</body>
</html>