<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
    <link rel="icon" type="image/x-icon" href="/resources/ico/favicon.ico" />
        <!-- CSS -->
        <link href="/resources/apis/bootstrap/dist/css/bootstrap.css" rel="stylesheet" />
        <link href="/resources/apis/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"  />
        <link href="/resources/apis/bootstrap-datepicker/css/datepicker.css" rel="stylesheet" type="text/css" />
		<link href="/resources/apis/bootstrap-toggle/css/bootstrap-toggle.min.css" rel="stylesheet" type="text/css"/>
		<link href="/resources/css/owl-carousel/owl.carousel.css" rel="stylesheet" type="text/css"/>
<!--         <link href="/resources/apis/fullcalendar/fullcalendar.css" rel="stylesheet" /> -->
<!--         <link href="/resources/apis/fullcalendar/fullcalendar.print.css" rel="stylesheet" media="print" /> -->
		<link href="/resources/apis/fullcalendar-4.4.0/core/main.css" rel="stylesheet" type="text/css"/>
		<link href="/resources/apis/fullcalendar-4.4.0/daygrid/main.css" rel="stylesheet" type="text/css"/>
		<link href="/resources/css/owl-carousel/owl.theme.default.css" rel="stylesheet" type="text/css"/>
		<link href="/resources/apis/jquery-scrollbar/jquery.scrollbar.css" rel="stylesheet" type="text/css" media="screen" />
		<link href="/resources/apis/bootstrap-wizard/wizard.css" rel="stylesheet" type="text/css"/>
		<link href="/resources/css/calendar/goods-pages.css" rel="stylesheet" type="text/css"/>
<!-- 		<link href="/resources/apis/pages/pages.css" rel="stylesheet" type="text/css"/> -->
		<link href="/resources/apis/select2/css/select2.min.css" rel="stylesheet" type="text/css" media="screen" />
		
		<link href="/resources/css/calendar/common.v2.css?version=202103150128" rel="stylesheet" type="text/css"/>
		<link href="/resources/css/calendar/calendar.v2.css?version=202103150128" rel="stylesheet" type="text/css"/>
    </head>
    
    <body class="">
    	
    	



<!DOCTYPE html>
<div class="sidebar">
	<nav class="navbar">
		<div class="container-fluid">
			<div class="header-container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed " data-toggle="collapse" data-target=".sidebar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<div class="navbar-brand ">
						<div class="title">
							<div class="company-title">
								
								[타입A] 펜션
							</div>
							<span class="fixed-title hidden-xs hidden-sm">실시간 예약달력</span>
						</div>
					</div>
					<div class="navbar-right hidden-md hidden-lg">
						<a href="javascript:;" class="navbar-btn check-btn" data-toggle="modal" data-target="#reserveCheckModal"><i class="fa fa-search fa-fw"></i></a>
					</div>
				</div>

<!-- 				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"> -->
<!-- 					<ul class="nav navbar-nav navbar-right hidden-xs hidden-sm"> -->

<!-- 					</ul> -->
<!-- 				</div> -->
				<!-- /.navbar-collapse -->
			</div>
		</div><!-- /.container-fluid -->
	</nav>
 	<div class="sidebar-menu p-t-10">
		<ul class="menu-items scroll-content scroll-scrolly_visible">
			
			<li class="toggle-btn open active">
				
				
				<a href="/calendar/v2/19688"><span class="title">[타입A] 펜션</span>
				</a>
				
				
			</li>
			
			<li class="toggle-btn ">
				
				
				<a href="/calendar/v2/20008"><span class="title">[타입A] 캠핑장</span>
				</a>
				
				
			</li>
			
		</ul>
		<div class="clearfix"></div>
	</div>
	<div class="open-toggle">
		<span>상품목록</span>
		<i class="arrow"></i>
	</div>
</div>
    	
		<section class="content">
			



<!DOCTYPE html>
<div class="header">
      	<nav class="navbar navbar-white">
		<div class="container-fluid">
			<div class="header-container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed hidden-md hiddem-lg " data-toggle="collapse" data-target=".sidebar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<div class="navbar-brand ">
						<div class="title">
							<div class="company-title">

								
								
									
									
									
									[타입A] 펜션
									
									
								
							</div>
						</div>
					</div>
					<div class="navbar-right hidden-md hidden-lg">
						
						
						
						<a href="/calendar/v2/19688" class="home-anchor hidden"><i class="fa fa-calendar fa-fw"></i></a>
						
						
						<a href="javascript:;" class="navbar-btn check-btn" data-toggle="modal" data-target="#reserveCheckModal"><i class="fa fa-search fa-fw"></i></a>
					</div>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right hidden-sm hidden-xs">
						<li class="hidden">
						
						
						
						<a href="/calendar/v2/19688" class="home-anchor"><i class="fa fa-calendar fa-fw m-r-5"></i>예약달력보기</a>
						
						
						</li>
						<li><button class="btn navbar-btn check-btn" data-toggle="modal" data-target="#reserveCheckModal">예약조회 및 취소요청</button></li>
					</ul>
				</div><!-- /.navbar-collapse -->
			</div>
		</div><!-- /.container-fluid -->
	</nav>
</div>
			<!-- CONTENT -->
			<div class="body">
			<div class="loading loading-center loading-fade loading-absolute loading-calendar hidden">
       			<div class="progress-circle-indeterminate"></div>
  			</div>
       		
			<div class="main-content">
				
	        		
					
						<div class="row">
						<div class="col-md-10">
			            <div id="goods_calendar" data-idx="19688" data-opt="" data-payment="Y" data-date="2021-03-15"></div>
						</div>
						<div class="col-md-2">
							<div class="notice">
								<h6>Notice</h6>
								<p>[꼭! 예약시 확인부탁드립니다]
<br>☞ 각 객실의 기준인원과 최대인원을 꼭 확인해주세요. 
<br>☞ 예약없이 추가인원 발생시 입장이 제한될 수 있습니다. 
<br>☞ 입/퇴실 시간 :  하절기 [입실 : 15:00 이후 퇴실 : 11:00 이전]  / 동절기 [입실14:00이후 ]
<br>☞ 양초등 인화물질의 사용을 엄격히 금합니다. 
<br>☞ 객실 내에 비치된 물건이 파손된 경우 손해배상의 책임이 있음을 알려드립니다
<br>☞ 애완견 동반은 금지되어 있습니다. 
<br>☞ 무분별한 음주가무, 고성방가는 절대 금하며, 주의를 드린후에도 시정되지 않을 경우 퇴실을 요구할수 있습니다.(이러한 경우 요금은 환불해드리지 않습니다.) 
<br>☞ 미성년자는 반드시 보호조(가족,교사)를 동반해야하며, 미성년자, 성인간 혼숙인 경우 펜션측에서 보호자(가족등)증명을 요구할 수 있습니다.
<br>☞ 사전에 확인되지 않은 귀중품 분실시, 숙소측은 책임지지 않습니다. 
<br>☞ 쾌적한 객실환경 조성을 위해 객실내에서는 고기류,생선류 조리를 금합니다. 
<br>☞ 예약확인 및 취소는 홈페이지 - 예약확인에서 가능합니다.</p>
							</div>
						</div>
			            </div>
		            
		            
	        	
	        	
	        	
	        	
	        </div>
	        </div>
			<!-- END: CONTENT -->
		</section>
		
    

<!DOCTYPE html>
<footer class="footer">
   	<div class="footer-container">
   		
   		<p>
   			
   			(주)에픽브레인/오토퍼스는 통신판매중개자이며, 실시간 예약시스템만 제공합니다.<br>상품, 상품정보, 거래에 관한 의무와 책임은  '에픽브레인' 책임하에 있습니다.
   			
   			
		</p>
		<a href="https://www.autopus.co.kr" target="_blank">
   			<img src="/resources/img/footer_bk.png" class="logo-bk" height="45">
   			<img src="/resources/img/footer.png" class="logo-cl hidden" height="45">
		</a>
   	</div>
</footer>
		



<div class="modal fade" id="reserveCheckModal" tabindex="-1" role="dialog" aria-labelledby="chooseRoomLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="">예약확인 및 취소요청</h4>
			</div>
			<div class="modal-body">
				<div style="display:inline-block;width:100%">
				<form id="reserveCheckFrm" name="reserveCheckFrm" method="post" action="/calendar/v2/reserveCheck">
					<input type="hidden" name="company_id" value="2297">
					<input type="hidden" name="company_gubun" value="O">
					<input type="hidden" name="goods_idx" value="19688">
					<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="form-group form-group-default">
						<label>성함</label>
						<input type="text" class="form-control" id="name" name="name">
					</div>
					</div>
					</div>
					<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="form-group-attached">
						<div class="row">
							<div class="col-md-4">
								<div class="form-group form-group-default form-group-default-select2">
									<label>연락처</label>
									<select class="full-width" name="hp1" id="hp1" data-init-plugin="select2" data-disable-search="true" data-parent="#reserveCheckModal">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
									</select>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group form-group-default">
									<label>앞자리</label>
									<input type="text" class="form-control" name="hp2" id="hp2" maxlength="4">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group form-group-default">
									<label>뒷자리</label>
									<input type="text" class="form-control" name="hp3" id="hp3" maxlength="4">
								</div>
							</div>
						</div>
					</div>
					</div>
					</div>
					<input type="button" class="btn btn-primary btn-block disabled" id="reserveCheck" value="조회" disabled>
				</form>
				</div>
			</div>
		</div>
	</div>
</div>
		
		<!-- language -->
		


<script>
	var script_lang = {};
	script_lang.soldout='매진';
	script_lang.soldout_accommo='객실마감';
	script_lang.reservation_ok='예약가능';
	script_lang.reservation_no='예약불가';
	script_lang.alert_reservation_past='지난일자는 예약이 불가능합니다';
	script_lang.alert_cancel_reservation_past='지난 예약은 취소요청이 불가능합니다.';
	script_lang.alert_cancel_reservation_home='홈페이지예약만 취소요청이 가능합니다';
	script_lang.alert_reservation_not_exist='예약이 존재하지 않습니다';
	script_lang.alert_phone_number='연락처는 숫자만 입력하세요';
	script_lang.year='년 ';
	script_lang.month='월 ';
	script_lang.en_dash='';
	script_lang.days_a='박';
	script_lang.days_b='일';
	script_lang.days_c='일차';
	script_lang.days_d='일';
	script_lang.person_count_a='명';
	script_lang.person_count_b='인';
	script_lang.count='매';
	script_lang.adult='성인';
	script_lang.student='청소년';
	script_lang.child='소아';
	script_lang.baby='유아';
	script_lang.cancel_request='취소요청';
	script_lang.alert_browser='Chrome은 "계좌이체"를 지원하지 않습니다. Internet Explorer 10 이상에서 진행하시기 바랍니다.';
	script_lang.payment_card='신용카드';
	script_lang.payment_smile='스마일페이';
	script_lang.payment_kakao='카카오페이';
	script_lang.payment_account='실시간계좌이체';
	script_lang.coupon='쿠폰번호입력';
	script_lang.transfer='무통장입금';
	script_lang.no_room_date_a='해당일자에 예약가능한 객실이 없습니다.';
	script_lang.no_room_date_b='체크인 날짜를 다시 선택해주세요.';
	script_lang.no_room='예약가능한 객실이 없습니다.';
	script_lang.discount_long='연박 할인';
	script_lang.discount_two='2박 할인';
	script_lang.discount_three='3박이상 할인';
	script_lang.price_accommo='객실요금';
	script_lang.price_add_person='추가인원요금';
	script_lang.price_discount_long='연박할인요금';
	script_lang.price_total='총요금';
	script_lang.stay_require='박필수';
	script_lang.woman_only='여성전용';
	script_lang.man_only='남성전용';
	script_lang.reserve_accommo='객실예약';
	script_lang.reserve_goods='상품예약';
	script_lang.day_every='매일';
	script_lang.no_select='미선택';
	script_lang.select='선택';
	script_lang.count_a='개수';
	script_lang.count_b='개';
	script_lang.addoption_no='해당 객실의 추가옵션은 없습니다.';
	script_lang.admin='관리자에게 문의하시기 바랍니다.';
	script_lang.enter_name='성함을 입력하세요';
	script_lang.enter_tel='연락처를 입력하세요';
	script_lang.enter_coupon='쿠폰번호를 입력하세요';
	script_lang.enter_deposit_name='입금자명을 입력하세요';
	script_lang.reserve_ok='예약이 완료되었습니다';
	script_lang.reserve_email='입력하신 이메일로 결제정보가 전달되었습니다';
	script_lang.reserve_number='예약번호';
	script_lang.name='이름';
	script_lang.tel='연락처';
	script_lang.name_accommo='펜션명';
	script_lang.name_goods='상품명';
	script_lang.name_room='객실명';
	script_lang.name_option='옵션명';
	script_lang.check_in='입실일';
	script_lang.use_date='이용일';
	script_lang.payment_price='결제금액';
	script_lang.confirm='확인';
	script_lang.reserve_sold_out='결제전 상품이 마감되었습니다.';
	script_lang.won='원';
	script_lang.usd='달러';
	script_lang.reserve_approve_no='결제승인이 실패되었습니다.';
	script_lang.reserve_popup='팝업차단을 해제하신 후 결제를 하시기 바랍니다.';
	script_lang.refund_text_a='수수료 : 결제금액의 ';
	script_lang.refund_text_b='';
	script_lang.refund_text_c='% 발생 / 환불금액 : ';
	script_lang.refund_text_d='원입니다.';
	script_lang.refund_text_e='해당 주문을 취소하시겠습니까?';
	script_lang.reserve_cancel='정상적으로 처리되었습니다.';
	script_lang.payment_timeout='결제시간이 초과되었습니다.';
	script_lang.payment_cancel='결제가 취소 되었습니다.';
	script_lang.reserve_no='예약가능한 상품이 없습니다.';
	script_lang.reserve_no_date_a='해당일자에 예약가능한 상품이 없습니다.';
	script_lang.reserve_no_date_b='사용 날짜 또는 옵션을 다시 선택해주세요.';
	script_lang.reserve_opt_select='예약하실 옵션을 선택해주세요.';
	script_lang.opt_select='옵션선택';
	script_lang.price_none='요금 : ';
	script_lang.price_adult='성인요금 :  ';
	script_lang.price_student='청소년요금 :  ';
	script_lang.price_child='소아요금 : ';
	script_lang.price_baby='유아요금 : ';
	script_lang.one_person='원 / 1인';
	script_lang.one_count='원 / 1매';
	script_lang.reserve_goods_soldout='상품마감';
	script_lang.store_name='구매처';
	script_lang.store_farm='스토어팜';
	script_lang.store_coupon='쿠폰번호';
	script_lang.inwon='인원';
	script_lang.payment_method='결제방법';
	script_lang.info_purchase='구매정보';
	script_lang.select_check_in='입실일을 선택해주세요';
	script_lang.select_check_out='퇴실일을 선택해주세요';
	script_lang.search_require='검색필요';
	script_lang.enter_email='이메일을 입력하세요';
	script_lang.remain_room='객실남음';
	script_lang.language = 'ko';
	

</script>

		
		
		<!-- JS -->
        <script src="/resources/apis/jquery/js/jquery-1.11.3.min.js"></script>
        <script src="/resources/apis/jquery-ui/js/jquery-ui.min.js"></script>
        <script src="/resources/apis/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="/resources/apis/moment/min/moment.min.js"></script>
        <script src="/resources/apis/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script src="/resources/apis/bootstrap-datepicker/js/bootstrap-datepicker.kr.js"></script>
<!--         <script src="/resources/apis/fullcalendar/fullcalendar.min.js"></script> -->
<!--         <script src="/resources/apis/fullcalendar/lang-all.js"></script> -->
		<script src="/resources/apis/fullcalendar-4.4.0/core/main.min.js"></script>
		<script src="/resources/apis/fullcalendar-4.4.0/daygrid/main.min.js"></script>
		<script src="/resources/apis/fullcalendar-4.4.0/core/locales-all.js"></script>
        <script src="/resources/apis/bootstrap-toggle/js/bootstrap-toggle.js"></script>
        <script src="/resources/apis/bootstrap/js/carousel.js"></script>
        <script src="/resources/apis/spin/spin.js"></script>
        <script src="/resources/js/owl-carousel/owl.carousel.min.js"></script>
        <script src="/resources/apis/bootstrap-wizard/jquery.bootstrap.wizard.min.js" type="text/javascript"></script>
        <script src="/resources/apis/jquery-scrollbar/jquery.scrollbar.min.js"></script>
        <script type="text/javascript" src="/resources/apis/select2/js/select2.full.min.js"></script>
        <script src="/resources/js/calendar/functions.js?version=20201229"></script>
        
        <script src="/resources/js/calendar/calendar.v2.js?version=20201110"></script>
        
        
		
        <script type="text/javascript">
			var rootPath = "";
			var idx = "19688";
			var api_type = "";
			var api_code = "";
			var autofill = "N";
			var realtime_yn = "1";
			var cate_detail = "";
			var size = "";
			var today = "";
			var max_date = "";
			var spinner;
			var p_win;
			var goods_type = "accommo";
			var c = "2297";
		</script>
    </body>
</html>