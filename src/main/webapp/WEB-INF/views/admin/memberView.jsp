<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="currentPage" value="${ requestScope.page }" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="Author" content="kimwoolina">

<link rel="styleSheet" href="/me/resources/css/member/normalize.css">
<link rel="styleSheet" href="/me/resources/css/member/common.css">

<!-- 부트스트랩 -->
<link rel="styleSheet" href="/me/resources/bootstrap/styles.css">
<script src="/me/resources/bootstrap/all.min.js"></script>
<script src="/me/resources/bootstrap/bootstrap.bundle.min.js"></script>
<script src="/me/resources/bootstrap/feather.min.js"></script>
<script src="/me/resources/bootstrap/jquery-3.5.1.min.js"></script>
<script src="/me/resources/bootstrap/prism-autoloader.min.js"></script>
<script src="/me/resources/bootstrap/prism-core.min.js"></script>
<script src="/me/resources/bootstrap/sb-customizer.js"></script>
<script src="/me/resources/bootstrap/scripts.js"></script>


<style type="text/css">

span.guide {
	display: none;
	font-size: 12px;
	top: 12px;
	right: 10px;
}

span.ok {
	color: green;
}

span.error {
	color: red;
}

</style>


</head>

<body>

<jsp:include page="../main/header.jsp" />

<section style="padding: 50px 0 50px 0;">

	<div id="wrap" class="">
		<div id="container">
			<div id="main">
				<div id="content">
					<div class="page_aticle">
						<div class="type_form member_join ">
							<form id="form" name="frmMember" method="post" action="mupdate2.do">
							
								<div class="field_head">
									<h3 style="text-align:center;">회원정보 입력</h3>
									<p class="sub">
										<span class="ico">*</span>수정가능
									</p>
								</div>
									
									<table class="tbl_comm">
										<tbody>
											<tr class="fst">
												<th>회원번호</th>
												<td><input type="text" name="mid" value="${ member.mid }" readonly>${ member.mid }</td>
											</tr>
											<tr class="fst">
												<th>회원아이디</th>
												<td><input type="text" name="id" value="${ member.id }" readonly>${ member.id }</td>
											</tr>
											<tr class="fst">
												<th>회원이름</th>
												<td><input type="text" name="name" value="${ member.name }" readonly></input></td>
											</tr>
											<tr class="fst">
												<th>회원닉네임</th>
												<td><input type="text" name="nick" value="${ member.nick }" readonly></input></td>
											</tr>
											<tr class="fst">
												<th>회원생년월일</th>
												<td><input type="text" name="birthday" value="${ member.birthday }" readonly></input></td>
											</tr>
											<tr class="fst">
												<th>회원성별</th>
												<td><input type="text" name="gender" value="${ member.gender }" readonly></input></td>
											</tr>
											<tr class="fst">
												<th>회원연락처</th>
												<td><input type="text" name="phone" value="${ member.phone }" readonly></input></td>
											</tr>
											<tr class="fst">
												<th>회원이메일</th>
												<td><input type="text" name="email" value="${ member.email }" readonly></input></td>
											</tr>
											<tr class="fst">
												<th>회원주소</th>
												<td><input type="text" name="address" value="${ m.address }" readonly></input></td>
											</tr>
											<tr class="fst">
												<th>회원가입일</th>
												<td><input type="text" name="join_date" value="${ m.join_date }" readonly></input></td>
											</tr>
											<tr class="fst">
												<th>회원상태
													<span class="ico">*
													<span class="screen_out">수정가능</span></span></th>
												<td>
													<c:if test="${ m.user_now eq 'Y' }">
													
														<label class="">
												 			<input type="radio" name="user_now" value="Y" checked="checked"> <span class="ico"></span>&emsp;정상&emsp;&emsp;</label>
												 		<label class="">
															<input type="radio" name="user_now"	value="N"> <span class="ico"></span>&emsp;접속제한 or 탈퇴</label>
													
													</c:if>
													
													<c:if test="${ m.user_now eq 'N' }">
													
														<label class="">
												 			<input type="radio" name="user_now" value="Y"> <span class="ico"></span>&emsp;정상&emsp;&emsp;</label>
												 		<label class="">
															<input type="radio" name="user_now"	value="N" checked="checked"> <span class="ico"></span>&emsp;접속제한 or 탈퇴</label>
													
													</c:if>
												</td>
											</tr>
											<tr class="fst">
												<th>회원등급
													<span class="ico">*
													<span class="screen_out">수정가능</span></span></th>
												<td>
													<c:if test="${ m.user_lv eq 'MEMBER' }">
													
														<label class="">
											 			<input type="radio" name="user_lv" value="MEMBER" checked="checked"> <span class="ico"></span>&emsp;일반회원&emsp;&emsp;</label>
											 		<label class="">
														<input type="radio" name="user_lv"	value="admin"> <span class="ico"></span>&emsp;★ 관리자  권한부여</label>
													
													</c:if>
													
													<c:if test="${ m.user_lv eq 'admin' }">
													
														<label class="">
											 			<input type="radio" name="user_lv" value="MEMBER"> <span class="ico"></span>&emsp;일반회원&emsp;&emsp;</label>
											 		<label class="">
														<input type="radio" name="user_lv"	value="admin" checked="checked"> <span class="ico"></span>&emsp;★ 관리자 권한부여</label>
													
													</c:if>
												</td>
											</tr>
											<tr class="fst">
												<th>메모
													<span class="ico">*
													<span class="screen_out">수정가능</span></span></th>
												<td>
													<input type="text" name="etc" placeholder="회원의 특이사항을 적어주세요"></input>
												</td>
											</tr>
										</tbody>
										
									</table>
							
								<div id="formSubmit" class="form_footer">
							<tr>
								<th colspan="2" style="text-align: right; padding-top:20px">
									<input type="submit" value="수정하기">&nbsp;
									<input type="reset" value="리셋"> &nbsp;
									<button onclick="javascript:history.go(-1); return false;">이전</button>
								</th>
							</tr>
								</div>
																
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

	
<jsp:include page="../main/footer.jsp" />


</body>
</html>