<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>
<%-- 응답온 페이지값 추출함 --%>
<c:set var="currentPage" value="${ requestScope.page }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 열람 페이지</title>


<script type="text/javascript"
	src="${ pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script> 


<style>
table.table2 {
	border-collapse: separate;
	border-spacing: 1px;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	margin: 20px 10px;
}

table.table2 tr {
	width: 50px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

table.table2 td {
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}
</style>


</head>
<body>
	
	<jsp:include page="../main/header.jsp" />
	
     <div style="text-align: center; padding-top: 10px;">
		<div>
			<h4 style="margin: 00px 0 10px 0;">${ notice.ntitle }</h4>
		</div>
	</div>
				
	<table align="center" cellpadding="2" cellspacing="0" width="700">
		<tr>
			<td bgcolor=white>
				<table class="table2">
					<tr>
						<td width="150px">말머리</td>
						<td width="150px">${ notice.ntype }</td>
						<td width="150px">작성자</td>
						<td width="150px">${ notice.nuser } 님</td>
						
					</tr>
					<tr>
						<td width="200px">작성일</td>
						<td width="500px">${ notice.n_date }</td>
						<td width="200px">조회수</td>
						<td width="500px">${ notice.ncount } 뷰</td>
					</tr>
					<tr>
						<td width="200px">첨부파일</td>
						<td width="500px" colspan='3'>
							<c:if test="${ empty notice.n_file }">첨부파일 없음</c:if>
							<c:if test="${ !empty notice.n_file }">
								<c:url var="nfd" value="/nfdown.do">
									<c:param name="ofile" value="${ notice.n_file }" />
									<c:param name="rfile" value="${ notice.n_rfile }" />
								</c:url>
							<a href="${ nfd }">${ notice.n_file }</a>
							</c:if>
						</td>
					</tr>
					<tr>
						<td width="500px" height="200" colspan='4'>
							<c:if test="${ empty notice.n_file }">${ fn:replace(notice.ncontent, cn, br) }</c:if>
							<c:if test="${ !empty notice.n_file }">
								<c:url var="nfd" value="/nfdown.do">
									<c:param name="ofile" value="${ notice.n_file }" />
									<c:param name="rfile" value="${ notice.n_rfile }" />
								</c:url>
							<img src="/me/resources/notice_files/${ notice.n_file }" style="width:500px;"><br>${ fn:replace(notice.ncontent, cn, br)}
							</c:if>
						</td>
					</tr>
				</table>
			</td>
		</tr>

		<tfoot>
          <td colspan="4" style="text-align: right; padding-bottom: 30px;">
          
          	
			<%-- 관리자가 로그인 했을일 때  --%>
			
			<c:if test="${ !empty sessionScope.loginUser and loginUser.user_lv eq 'admin' }">
				<c:url var="nuv" value="/upmove.do">
					<c:param name="nid" value="${ notice.nid }" />
					<c:param name="page" value="${ currentPage }" />
				</c:url>
			<button type="button" onclick="javascript:location.href='${ nuv }'" >수정</button> &nbsp; &nbsp;
							 
				<c:url var="ndl" value="/ndel.do">
					<c:param name="nid" value="${ notice.nid }" />
				</c:url>
			<button type="button" onclick="javascript:location.href='${ ndl }'">글삭제</button> &nbsp; &nbsp;
			
				<c:url var="nls" value="/nlist.do">
					<c:param name="page" value="${ currentPage }" />
				</c:url>
			<button type="button" onclick="javascript:location.href='${ nls }'">목록</button>
			</c:if> 
		
		
		<%-- 일반회원이 공지사항을 볼 때 --%>
			<c:if test="${ !empty sessionScope.loginUser and loginUser.nick ne notice.nuser and loginUser.user_lv eq 'MEMBER'}">
					<c:url var="nls" value="/nlist.do">
					<c:param name="page" value="${ currentPage }" />
				</c:url>
			<button type="button" onclick="javascript:location.href='${ nls }'">목록</button>			
			</c:if> 
			
		<%-- 비회원이 공지사항을 볼 때 --%>
			<c:if test="${ empty sessionScope.loginUser }">  
				<c:url var="nls" value="/nlist.do">
					<c:param name="page" value="${ currentPage }" />
				</c:url>
			<button type="button" onclick="javascript:location.href= '${ nls }';">목록</button>
			</c:if>
				
			</td>
		</tfoot>
	</table>

	<jsp:include page="../main/footer.jsp" />
	
</body>
</html>