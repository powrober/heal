<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>


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
.hr-sect {
	display: flex;
	flex-basis: 100%;
	align-items: center;
	color: rgba(0, 0, 0, 0.35);
	font-size: 12px;
	margin: 8px 0px;
}

.hr-sect::before, .hr-sect::after {
	content: "";
	flex-grow: 1;
	background: rgba(0, 0, 0, 0.35);
	height: 1px;
	font-size: 0px;
	line-height: 0px;
	margin: 0px 16px;
}
</style>

<c:url var="home" value="/home.do" />

<script type="text/javascript">
function Home() {
		location.href = "${ home }";
	}
</script>

</head>

<body>

	<!-- 헤더  -->
	<jsp:include page="../main/header.jsp" />


	<!-- Forms-->
	<section class="section section-lg bg-default text-center" >
		<div class="container">
			<h3>Login</h3>
			<div class="row row-fix justify-content-sm-center">
				<div class="col-md-8 col-lg-6 col-xl-4">
					<!-- RD Mailform-->
					<form class="rd-mailform form-fix" action="login.do" method="post" name="form" id="form">

						<div class="form-wrap form-wrap-validation">
							<input class="form-input" id="forms-login-name" type="text" name="id" value="${ autoId }" data-constraints="@Required">
							<label class="form-label" for="forms-login-name">ID</label>
						</div>

						<div class="form-wrap form-wrap-validation">
							<input class="form-input" id="forms-login-password" type="password" name="pwd" value="${ autoPwd }" data-constraints="@Required"> 
							<label class="form-label" for="forms-login-password">Password</label>
						</div>

						<div class="checkbox_save" style="margin-top:20px; text-align:justify;">
							<label class="label_checkbox checked">
							<input type="checkbox" id="auto_login" name="auto_login" value="on" checked="checked"
								onchange="if( this.checked){$(this).parent().addClass(&#39;checked&#39;)}else{$(this).parent().removeClass(&#39;checked&#39;)} ">&nbsp;자동 로그인&emsp;&emsp;&emsp;
							</label>
							<span class="badge badge-warning" style="background-color:#ad9463;"><a href="findIdView.do" class="link" style="color:#fff; padding: 5px;">아이디 찾기</a></span>
							<span class="badge badge-warning" style="background-color:#ad9463;"><a href="findPwView.do" class="link" style="color:#fff; padding: 5px;">비밀번호 찾기</a></span>
						</div>
						
						<div class="form-button">
							<button class="button button-block button-primary" type="submit" onclick="login2.do();">로그인</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>



	<jsp:include page="../main/footer.jsp" />

</body>
</html>