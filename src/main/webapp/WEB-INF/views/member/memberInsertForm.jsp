<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 글쓰기 페이지 이동 요청 url --%>
<c:url var="home" value="/home.do" />
<c:url var="login" value="/loginView.do" />

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



<script type="text/javascript">

	function validate() {
		// 아이디 중복체크 여부
		if ($("#idDuplicateCheck").val() == 0) {
			alert("아이디를 확인해주세요.");
			$("#userId").focus();
			return false;
		} else {
			return true;
		}
		
	}

	$(function() {
		$("#userId").on("keyup", function() {
			var userId = $(this).val();

			if (userId.length < 5) {
				$(".guide").hide();
				$("#idDuplicateCheck").val(0);

				return;
			}

			$.ajax({
				url : "idCheck.do",
				data : {
					id : userId
				},
				type : "post",
				success : function(data) {
					console.log(data);

					if (data == "ok") {
						$(".error").hide();
						$(".ok").show();
						$("#idDuplicateCheck").val(1);
					} else {
						$(".ok").hide();
						$(".error").show();
						$("#idDuplicateCheck").val(0);
					}

				},
				error : function(jqxhr, textStatus, errorThrown) {
					console.log("ajax 처리 실패");

					console.log(jqxhr);
					console.log(textStatus);
					console.log(errorThrown);
				}
			});
		});

		//비밀번호 확인
		$('#pwd2').blur(function() {
			if ($('#pwd').val() != $('#pwd2').val()) {
				if ($('#pwd2').val() != '') {
					alert("비밀번호가 일치하지 않습니다.");
					$('#pwd2').val('');
					$('#pwd2').focus();
				}
			}
		})
		
		// 회원가입 modal창
		$("#modal").show();
		
	});
	
	// 이메일 중복확인
	  function chkEmail()
	  {
	    var email_txt = $("input[name='email']").val();
	    var trim_txt = email_txt.replace(/(^\s*)|(\s*$)/gi, "");
	    var email_regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	    $("input[name='email']").val(trim_txt)
	    
	    if ($("input[name='email']").val() === "") {
	      alert("이메일 주소를 입력해 주세요.");
	      $('[name=chk_email]').val('0');
	      return false;
	    }
	    if(email_regex.test(trim_txt) === false) {
	      alert("잘못된 이메일 형식입니다.");
	      $('[name=chk_email]').val('0');
	      return false;
	    }
	
	    $('[name=chk_email]').val('1');
		alert("사용이 가능합니다.");
		return;
		
	  }
	
	  $("input[name='mobileInp']").change(function() {
	    $("input[name='check_mobile']").val("0");
	  });
	  
	  function chkForm2(f) {
		    if($('[name=chk_email]').val() !== '1'){
		      alert('이메일 중복확인을 확인해주세요', function(){
		        $('[name=email]').focus();
		      });
		      return false;
		    }
		    
		    var email_txt = $("input[name='email']").val();
		    var trim_txt = email_txt.replace(/(^\s*)|(\s*$)/gi, "");
		    var email_regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		    $("input[name='email']").val(trim_txt)
		    if(email_regex.test(trim_txt) === false) {
		      alert('잘못된 이메일 형식입니다.', function () {
		        $('input[name=email]').focus();
		      });
		      return false;
		    }
		  }
	  
</script>

</head>

<!-- <body class="member-join" oncontextmenu="return false" ondragstart="return false" onselectstart="return !disableSelection" style=""> -->
<body>

<jsp:include page="../main/header.jsp" />

<section style="padding: 50px 0 50px 0;">

	<div id="wrap" class="">
		<div id="container">
			<div id="main">
				<div id="content">
					<div class="page_aticle">
						<div class="type_form member_join ">
							<form id="form" name="frmMember" method="post" action="minsert.do"  onsubmit="return chkForm2(this)">
							
								<div class="field_head">
									<h3 style="text-align:center;">회원가입</h3>
									<p class="sub">
										<span class="ico">*</span>필수입력사항
									</p>
								</div>
									
									<table class="tbl_comm">
										<tbody>
											
											<tr class="fst">
												<th>아이디
													<span class="ico">*
													<span class="screen_out">필수항목</span></span>
												</th>
												
												<td>
													<input type="text" name="id" id="userId" maxlength="16" label="아이디" placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합" required>&nbsp;&nbsp;
														
														<!-- ajax를 적용  -->
														<span class="guide ok badge badge-primary" style="color:#fff;">사용가능</span>
														<span class="guide error badge badge-danger" style="color:#fff;">사용불가</span>
														<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0">
														
														<!-- ajax를 적용  -->
														<p class="txt_guide square">
															<span class="txt txt_case1">6자 이상의 영문 혹은 영문과 숫자를 조합</span>
															<span class="txt txt_case2">아이디 중복확인</span>
														</p>
												</td>
											</tr>
											
											<tr>
												<th>비밀번호
													<span class="ico">*
													<span class="screen_out">필수항목</span></span>
												</th>
												
												<td>
													<input type="password" name="pwd" label="비밀번호" maxlength="16" class="reg_pw" placeholder="비밀번호를 입력해주세요" required>
													
													<p class="txt_guide square">
														<span class="txt txt_case1">10자 이상 입력</span>
														<span class="txt txt_case2">영문/숫자/특수문자(공백 제외)만 허용하며, 2개 이상 조합</span>
														<span class="txt txt_case3">동일한 숫자 3개 이상 연속 사용 불가</span>
													</p>
												</td>
											</tr>
											
											<tr class="member_pwd">
												<th>비밀번호확인
													<span class="ico">*
													<span class="screen_out">필수항목</span></span>
												</th>
												
												<td>
													<input type="password" name="pwd2" label="비밀번호" maxlength="16" class="confirm_pw" placeholder="비밀번호를 한번 더 입력해주세요" required>
														
														<p class="txt_guide square">
															<span class="txt txt_case1">동일한 비밀번호를 입력해주세요.</span>
														</p>
												</td>
											</tr>
											
											<tr>
												<th>이름
													<span class="ico">*
													<span class="screen_out">필수항목</span></span>
												</th>
												
												<td>
													<input type="text" name="name" label="이름" placeholder="이름을 입력해주세요" required>
												</td>
											</tr>
											
											<tr>
												<th>닉네임
													<span class="ico">*
													<span class="screen_out">필수항목</span></span>
												</th>
												
												<td>
													<input type="text" name="nick" label="닉네임" placeholder="닉네임을 입력해주세요" required>
												</td>
											</tr>
											
											<tr>
												<th>생년월일
													<span class="ico">*
													<span class="screen_out">필수항목</span></span>
												</th>
												
												<td>
													<input type="date" name="birthday" required>
												</td>
											</tr>
											
											<tr class="select_sex">
												<th>성별</th>
												<td>
													<label class="">
														<input type="radio" name="gender" value="남자">&nbsp;&nbsp;남자</label>
													<label class="">
														<input type="radio" name="gender" value="여자">&nbsp;&nbsp;여자</label>
													<label class="checked">
														<input type="radio"	name="gender" value="미선택" checked="checked">&nbsp;&nbsp;선택안함</label>
												</td>
											</tr>
											
											<tr>
												<th>휴대폰
													<span class="ico">*
													<span class="screen_out">필수항목</span></span>
												</th>
												
												<td>
													<div class="phone_num">
														<input type="text" value="" pattern="[0-9]*" name="phone" placeholder="숫자만 입력해주세요" class="inp" required>
													</div>
												</td>
											</tr>
											
											<tr>
												<th>이메일
													<span class="ico">*
													<span class="screen_out">필수항목</span></span>
												</th>
												
												<td>
													<input type="text" name="email" label="이메일" option="regEmail" placeholder="예: abcd@naver.com" required>
													<input type="hidden" name="chk_email" label="이메일중복체크">
															<a href="javascript:void(0)" onclick="chkEmail()" class="btn btn-blue" style="color:#fff; font-family:sans-serif; background-color:#ad9463;">중복확인</a>
												</td>
											</tr>
											
											<tr>
												<th>주소
													<span class="ico">*
													<span class="screen_out">필수항목</span></span>
												</th>
												
												<td>
													<input type="text" name="post" label="우편번호" class="postcodify_postcode5" placeholder="우편번호를 검색해주세요">
														<button class="btn btn-blue" type="button" id="postcodify_search_button" style="background-color:#ad9463;">
														<span id="addressNo" class="address_no" data-text="검색" style="margin-top:-8px; color:#fff; margin-left:-22px;">검색</span>
														</button>
												</td>
											
											<tr>
												<th></th>
												<td>
													<input type="text" name="address1" label="도로명 주소" class="postcodify_address" placeholder="도로명 주소를 검색해주세요">
												</td>
											</tr>
											
											<tr>
												<th></th>
												<td>
													<input type="text" name="address2" label="상세 주소" class="postcodify_extra_info" placeholder="상세 주소를 검색해주세요">
												</td>
											</tr>
											
										</tbody>
										
									</table>
							
							
								<div id="formSubmit" class="form_footer">
									<button class="btn btn-blue"
										onclick='return validate();' data-toggle="modal" data-target="#success-modal" style="background-color:#ad9463; margin-top:-30px;">가입하기</button>
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


	
<!-- jQuery와 Postcodify를 로딩한다. 주소 검색용 -->
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script>
	/*  검색 단추를 누르면 팝업 레이어가 열리도록 설정한다. */
	$(function() {
		$(
			"#postcodify_search_button")
			.postcodifyPopUp();
	});
</script>

</body>
</html>