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
<c:url var="bwf" value="/bwmove.do" />
<c:url var="login" value="/loginView.do" />
<c:url var="blamelist" value="/b.blame.list.do" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 자유게시판</title>

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
           <p class="heading-1 breadcrumbs-custom-title">자유게시판</p>
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
     
	<div style="text-align: center;">
		<div>
			<h2 style="margin: 20px 0 10px 0;">자유게시판 리스트</h2>
		</div>
	</div>
		
	<div class="my_info_area" align="center" style="padding-top:30px; padding-bottom:30px ">
		<table cellspacing="0" class="boardtype2 th_border my_table" width="1000" style="width: 1800px;" >
			<colgroup>
				<col width="50">
				<col width="50">
				<col width="80">
				<col width="100">
				<col width="200">
				<col width="80">
				<col width="50">
				<col width="100">
				<col width="100">
				<col width="550">
				<col width="80">
				<col width="50">
				<col width="50">
				<col width="50">
				<col width="50">
			</colgroup>
			<thead>
				<tr>
					<th style="text-align:center; font-size:15px; font-family:sans-serif; color: black;" scope="col" class="title">번 호</th>
					<th style="text-align:center; font-size:15px; font-family:sans-serif; color: black;" scope="col">말머리</th>
					<th style="text-align:center; font-size:15px; font-family:sans-serif; color: black;" scope="col">작성자</th>
					<th style="text-align:center; font-size:15px; font-family:sans-serif; color: black;" scope="col">제목</th>
					<th style="text-align:center; font-size:15px; font-family:sans-serif; color: black;" scope="col">내용</th>
					<th style="text-align:center; font-size:15px; font-family:sans-serif; color: black;" scope="col">작성일</th>
					<th style="text-align:center; font-size:15px; font-family:sans-serif; color: black;" scope="col">조회수</th>
					<th style="text-align:center; font-size:15px; font-family:sans-serif; color: black;" scope="col">상태</th>
					<th style="text-align:center; font-size:15px; font-family:sans-serif; color: black;" scope="col">수정</th>
				</tr>
				
				<tr>
					<td colspan="7" class="blank2">&nbsp;
			    </tr>
            </thead>
            <tbody>
                <tr>
            	    <c:forEach items="${ requestScope.list }" var="b" >
	                <tr>
						<td align="center" width="50"  style="font-size:15px; color: black;">${ b.bid }</td>
						
						<td align="center" width="50"  style="font-size:15px; color: black;">${ b.btype }</td>
	
						<td align="center" width="80"  style="font-size:15px; color: black;">${ b.buser }</td>
						
						<td align="center" width="100"  style="font-size:15px; color: black;">
									<c:url value="/bdetail.do" var="und">
										<c:param name="bid" value="${ b.bid }" />
									</c:url>
									<a href="${und}" style="color: black;">${b.btitle}</a>
							<c:if test="${ !empty b.b_file }"><img src="/me/resources/images/file.png" style="width:20px;"> </c:if>
							<c:if test="${ empty b.b_file }"> </c:if>
						</td>
	
						<td align="center" width="200"  style="font-size:15px; color: black;">${ b.bcontent }</td>

						<td align="center" width="80"  style="font-size:15px; color: black;">${ b.b_date }</td>
						
						<td align="center" width="50" style="font-size:15px; color: black;">${ b.bcount }</td>

						<td align="center" width="50" style="font-size:15px; color: black;">${ b.bstatus }</td>
						
							<c:url var="#" value="#">
								<c:param name="page" value="${ currentPage }" />
							</c:url>
												
						<td align="center" width="50" style="font-size:15px; color: black;">
						
						<button type="button" onclick="javascript:location.href='${ a}'" style='float:center'>수정</button>
						
						</td> 
						
					</tr>
					</c:forEach>
					
					
            </tbody>
        </table>
    </div>
	

	<%-- 현재 페이지가 1이 아니면 링크설정, 현재 1페이지이면 링크없음 --%>
	<c:if test="${ empty action}">
		<%-- 페이징 처리  [맨처음][이전] 숫자...........  [다음][맨끝] --%>
		<div style="text-align: center; margin-bottom: 50px;">
			<c:if test="${ currentPage <= 1}">
            [맨처음]
         </c:if>
			<c:if test="${ currentPage > 1 }">
				<c:url var="bls" value="/blist.do">
					<c:param name="page" value="1" />
				</c:url>
				<a href="${ bls }">[맨처음]</a>
			</c:if>
			&nbsp;
			<%-- 이전 그룹이 있으면 링크설정, 이전 그룹 없으면 링크없음 --%>
			<c:if
				test="${ (currentPage - 10) < startPage and (currentPage - 10) >= 1 }">
				<c:url var="bls2" value="/blist.do">
					<c:param name="page" value="${ startPage - 10 }" />
				</c:url>
				<a href="${ bls2 }">[이전]</a>
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
					<c:url var="bls3" value="/blist.do">
						<c:param name="page" value="${ p }" />
					</c:url>
					<a href="${ bls3 }">${ p }</a>
				</c:if>
			</c:forEach>
			&nbsp;
			<%-- 다음 그룹이 있으면 링크설정, 다음 그룹 없으면 링크없음 --%>
			<c:if
				test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
				<c:url var="bls4" value="/blist.do">
					<c:param name="page" value="${ endPage + 10 }" />
				</c:url>
				<a href="${ bls4 }">[다음그룹]</a>
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
				<c:url var="bls5" value="/blist.do">
					<c:param name="page" value="${ maxPage }" />
				</c:url>
				<a href="${ bls5 }">[맨끝]</a>
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
				<c:url var="bsearch1" value="${ action }">
					<c:if test="${ action ne 'bsearchDate.do'}">
						<c:param name="page" value="1" />
					</c:if>
					<c:if test="${ action eq 'bsearchDate.do'}">
						<c:param name="begin" value="${ begin }" />
						<c:param name="end" value="${ end }" />
					</c:if>
				</c:url>
				<a href="${ bsearch1 }">[맨처음]</a>
			</c:if>
			&nbsp;
			<%-- 이전 그룹이 있으면 링크설정, 이전 그룹 없으면 링크없음 --%>
			<c:if
				test="${ (currentPage - 10) < startPage and (currentPage - 10) >= 1 }">
				<c:url var="bsearch2" value="/blist.do">
					<c:param name="page" value="${ startPage - 10 }" />
				</c:url>
				<a href="${ bsearch2 }">[이전]</a>
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
					<c:url var="bsearch3" value="/blist.do">
						<c:param name="page" value="${ p }" />
					</c:url>
					<a href="${ bsearch3 }">${ p }</a>
				</c:if>
			</c:forEach>
			&nbsp;
			<%-- 다음 그룹이 있으면 링크설정, 다음 그룹 없으면 링크없음 --%>
			<c:if
				test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
				<c:url var="bsearch4" value="/blist.do">
					<c:param name="page" value="${ endPage + 10 }" />
				</c:url>
				<a href="${ bsearch4 }">[다음그룹]</a>
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
				<c:url var="bsearch5" value="/blist.do">
					<c:param name="page" value="${ maxPage }" />
				</c:url>
				<a href="${ bsearch5 }">[맨끝]</a>
			</c:if>
		</div>
	</c:if>

	<jsp:include page="../main/footer.jsp" />
</body>
</html>