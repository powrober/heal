<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>comingsoon</title>

<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

header {
	background-image: linear-gradient(rgba(0, 0, 0, 0.5),
		rgba(0, 0, 0, 0.5)), url(/hhw/resources/images/comingsoon.jpg);
	height: 100vh;
	background-position: center;
	background-size: cover;	
}

.hero
{
	top: 50%;
	left:50%;
	position: absolute;
	transform: translate(-50%, -50%);
	color: #fff;
	text-align: center;
	font-family: 'Architects Daughter', cursive;
	font-family: 'Open Sans', sans-serif;
}

h1
{
	font-size: 60px;
	letter-spacing: 15px;
}

hr
{
	width: 50%;
	margin: 30px auto;
	borber: 1.5px solid #fff;
}

p
{
	font-size: 20px;
	margin-bottom:30px;
}

#launch
{
	font-size: 50px;
	word-spacing: 20px;
}

</style>

</head>
<body>

	<header>
		<div class="hero">
			<p></p>
			<h1>사이트 오픈</h1>
			<hr>
			<p id="launch"></p>
		</div>
	</header>

	<section class="section section-lg bg-default text-center" style="margin-top: -30px;">
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
	
							<div class="form-button">
								<button class="button button-block button-primary" type="submit">로그인</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>

</body>

	<script>
	
		var countDownDate = new Date("Apr 20, 2021 00:00:00").getTime();
		/* var countDownDate = new Date("Feb 13, 2021 00:00:00").getTime(); */

		var x = setInterval(function() {

					var now = new Date().getTime();

					var distance = countDownDate - now;

					var days = Math.floor(distance / (1000 * 60 * 60 * 24));
					var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
					var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
					var seconds = Math.floor((distance % (1000 * 60)) / 1000);

					document.getElementById("launch").innerHTML = "D-day : " + days + "D "	+ hours + "H " + minutes + "M " + seconds + "S";

					if (distance < 0) {
						clearInterval(x);
						document.getElementById("launch").innerHTML = "EXPIRED";
					}

				}, 1000);
		
	</script>


</body>
</html>