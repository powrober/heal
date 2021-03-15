<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>힐링하우스 Rooms</title>

<style>

.slider{
    width: 640px;
    height: 480px;
    position: relative;
    margin: 0 auto;
}
.slider input[type=radio]{
    display: none;
}

ul.imgs{
    padding: 0;
    margin: 0;
}
ul.imgs li{
    position: absolute;
    list-style: none;
    padding: 0;
    margin: 0;
    border-radius: 30px;
}
ul.imgs li img{
    border-radius: 30px;
    border: 5px solid rgba(0,0,0,0.3);
}

.bullets{
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    bottom: 20px;
    z-index: 2;
}
.bullets label{
    display: inline-block;
    border-radius: 50%;
    background-color: rgba(0,0,0,0.55);
    width: 20px;
    height: 20px;
    cursor: pointer;
}
/* 현재 선택된 불릿 배경 흰색으로 구분 표시 */
.slider input[type=radio]:nth-child(1):checked~.bullets>label:nth-child(1){
    background-color: #fff;
}
.slider input[type=radio]:nth-child(2):checked~.bullets>label:nth-child(2){
    background-color: #fff;
}
.slider input[type=radio]:nth-child(3):checked~.bullets>label:nth-child(3){
    background-color: #fff;
}
.slider input[type=radio]:nth-child(4):checked~.bullets>label:nth-child(4){
    background-color: #fff;
}
.slider input[type=radio]:nth-child(5):checked~.bullets>label:nth-child(5){
    background-color: #fff;
}
.slider input[type=radio]:nth-child(6):checked~.bullets>label:nth-child(6){
    background-color: #fff;
}
.slider input[type=radio]:nth-child(7):checked~.bullets>label:nth-child(7){
    background-color: #fff;
}

.slider input[type=radio]:nth-child(1):checked~ul.imgs>li:nth-child(1){
    left: 0;
    transition: 0.75s;
    z-index:1;
    box-shadow: 14px -5px 35px -21px rgba(0,0,0,0.66);
}
.slider input[type=radio]:nth-child(1):checked~ul.imgs>li:nth-child(2){
    left: 90px;
    transition: 0.75s;
    z-index:0;
    transform: scale(0.9);
    box-shadow: 14px -5px 35px -21px rgba(0,0,0,0.66);
}
.slider input[type=radio]:nth-child(1):checked~ul.imgs>li:nth-child(3){
    left: 170px;
    transition: 0.75s;
    z-index:-1;
    transform: scale(0.8);
    box-shadow: 14px -5px 35px -21px rgba(0,0,0,0.66);
}
.slider input[type=radio]:nth-child(1):checked~ul.imgs>li:nth-child(4){
    left: 230px;
    transition: 0.75s;
    z-index:-2;
    transform: scale(0.7);
    box-shadow: 14px -5px 35px -21px rgba(0,0,0,0.66);
}

/* 2 */
.slider input[type=radio]:nth-child(2):checked~ul.imgs>li:nth-child(1){
    left: -90px;
    transition: 0.75s;
    z-index:0;
    transform: scale(0.9);
    box-shadow: 14px -5px 35px -21px rgba(0,0,0,0.66);
}
.slider input[type=radio]:nth-child(2):checked~ul.imgs>li:nth-child(2){
    left: 0;
    transition: 0.75s;
    z-index:1;
    box-shadow: 14px -5px 35px -21px rgba(0,0,0,0.66);
}

.slider input[type=radio]:nth-child(2):checked~ul.imgs>li:nth-child(3){
    left: 90px;
    transition: 0.75s;
    z-index:0;
    transform: scale(0.9);
    box-shadow: 14px -5px 35px -21px rgba(0,0,0,0.66);
}
.slider input[type=radio]:nth-child(2):checked~ul.imgs>li:nth-child(4){
    left: 170px;
    transition: 0.75s;
    z-index:-1;
    transform: scale(0.8);
    box-shadow: 14px -5px 35px -21px rgba(0,0,0,0.66);
}

/* 3 */
.slider input[type=radio]:nth-child(3):checked~ul.imgs>li:nth-child(1){
    left: -170px;
    transition: 0.75s;
    z-index:-1;
    transform: scale(0.8);
    box-shadow: 14px -5px 35px -21px rgba(0,0,0,0.66);
}
.slider input[type=radio]:nth-child(3):checked~ul.imgs>li:nth-child(2){
    left: -90px;
    transition: 0.75s;
    z-index:0;
    transform: scale(0.9);
    box-shadow: 14px -5px 35px -21px rgba(0,0,0,0.66);
}
.slider input[type=radio]:nth-child(3):checked~ul.imgs>li:nth-child(3){
    left: 0;
    transition: 0.75s;
    z-index:1;
    box-shadow: 14px -5px 35px -21px rgba(0,0,0,0.66);
}
.slider input[type=radio]:nth-child(3):checked~ul.imgs>li:nth-child(4){
    left: 90px;
    transition: 0.75s;
    z-index:0;
    transform: scale(0.9);
    box-shadow: 14px -5px 35px -21px rgba(0,0,0,0.66);
}


/* 4 */
.slider input[type=radio]:nth-child(4):checked~ul.imgs>li:nth-child(1){
    left: -230px;
    transition: 0.75s;
    z-index:-2;
    transform: scale(0.7);
    box-shadow: 14px -5px 35px -21px rgba(0,0,0,0.66);
}
.slider input[type=radio]:nth-child(4):checked~ul.imgs>li:nth-child(2){
    left: -170px;
    transition: 0.75s;
    z-index:-1;
    transform: scale(0.8);
    box-shadow: 14px -5px 35px -21px rgba(0,0,0,0.66);
}
.slider input[type=radio]:nth-child(4):checked~ul.imgs>li:nth-child(3){
    left: -90px;
    transition: 0.75s;
    z-index:0;
    transform: scale(0.9);
    box-shadow: 14px -5px 35px -21px rgba(0,0,0,0.66);
}
.slider input[type=radio]:nth-child(4):checked~ul.imgs>li:nth-child(4){
    left: 0;
    transition: 0.75s;
    z-index:1;
    box-shadow: 14px -5px 35px -21px rgba(0,0,0,0.66);
}
/* 
/* 5 
.slider input[type=radio]:nth-child(5):checked~ul.imgs>li:nth-child(1){
    left: -230px;
    transition: 0.75s;
    z-index:-2;
    transform: scale(0.7);
    box-shadow: 14px -5px 35px -21px rgba(0,0,0,0.66);
}
.slider input[type=radio]:nth-child(5):checked~ul.imgs>li:nth-child(2){
    left: -170px;
    transition: 0.75s;
    z-index:-1;
    transform: scale(0.8);
    box-shadow: 14px -5px 35px -21px rgba(0,0,0,0.66);
}
.slider input[type=radio]:nth-child(5):checked~ul.imgs>li:nth-child(3){
    left: -90px;
    transition: 0.75s;
    z-index:0;
    transform: scale(0.9);
    box-shadow: 14px -5px 35px -21px rgba(0,0,0,0.66);
}
.slider input[type=radio]:nth-child(5):checked~ul.imgs>li:nth-child(4){
    left: 0;
    transition: 0.75s;
    z-index:1;
    box-shadow: 14px -5px 35px -21px rgba(0,0,0,0.66);
}

/* 6 
.slider input[type=radio]:nth-child(6):checked~ul.imgs>li:nth-child(1){
    left: -230px;
    transition: 0.75s;
    z-index:-2;
    transform: scale(0.7);
    box-shadow: 14px -5px 35px -21px rgba(0,0,0,0.66);
}
.slider input[type=radio]:nth-child(6):checked~ul.imgs>li:nth-child(2){
    left: -170px;
    transition: 0.75s;
    z-index:-1;
    transform: scale(0.8);
    box-shadow: 14px -5px 35px -21px rgba(0,0,0,0.66);
}
.slider input[type=radio]:nth-child(6):checked~ul.imgs>li:nth-child(3){
    left: -90px;
    transition: 0.75s;
    z-index:0;
    transform: scale(0.9);
    box-shadow: 14px -5px 35px -21px rgba(0,0,0,0.66);
}
.slider input[type=radio]:nth-child(6):checked~ul.imgs>li:nth-child(4){
    left: 0;
    transition: 0.75s;
    z-index:1;
    box-shadow: 14px -5px 35px -21px rgba(0,0,0,0.66);
}
/* 7 
.slider input[type=radio]:nth-child(7):checked~ul.imgs>li:nth-child(1){
    left: -230px;
    transition: 0.75s;
    z-index:-2;
    transform: scale(0.7);
    box-shadow: 14px -5px 35px -21px rgba(0,0,0,0.66);
}
.slider input[type=radio]:nth-child(7):checked~ul.imgs>li:nth-child(2){
    left: -170px;
    transition: 0.75s;
    z-index:-1;
    transform: scale(0.8);
    box-shadow: 14px -5px 35px -21px rgba(0,0,0,0.66);
}
.slider input[type=radio]:nth-child(7):checked~ul.imgs>li:nth-child(3){
    left: -90px;
    transition: 0.75s;
    z-index:0;
    transform: scale(0.9);
    box-shadow: 14px -5px 35px -21px rgba(0,0,0,0.66);
}
.slider input[type=radio]:nth-child(7):checked~ul.imgs>li:nth-child(4){
    left: 0;
    transition: 0.75s;
    z-index:1;
    box-shadow: 14px -5px 35px -21px rgba(0,0,0,0.66);
} */

</style>


</head>
<body>

<jsp:include page="../main/header.jsp" />


<body>
		<!-- <section class="room_details_area" style="padding-top: 20px">
            <div class="container">
                <div class="row room_details_inner">
                    <div class="col-md-8">
                        <div class="room_details_content">
                            <div class="room_d_main_text">
                                <div class="room_details_img owl-carousel"> -->
                                    
	                                  <div class="slider">
									    <input type="radio" name="slide" id="slide1" checked>
									    <input type="radio" name="slide" id="slide2">
									    <input type="radio" name="slide" id="slide3">
									    <input type="radio" name="slide" id="slide4">
									  <!--   <input type="radio" name="slide" id="slide5">
									    <input type="radio" name="slide" id="slide6">
									    <input type="radio" name="slide" id="slide7"> -->
									    <ul id="imgholder" class="imgs">
									        <li><img src="/me/resources/images/room/room1/1.jpg"></li>
									        <li><img src="/me/resources/images/room/room1/2.jpg"></li>
									        <li><img src="/me/resources/images/room/room1/3.jpg"></li>
									        <li><img src="/me/resources/images/room/room1/4.jpg"></li>
									        <!-- <li><img src="/me/resources/images/room/room1/5.jpg"></li>
									        <li><img src="/me/resources/images/room/room1/6.jpg"></li>
									        <li><img src="/me/resources/images/room/room1/7.jpg"></li> -->
									    </ul>
									    <div class="bullets">
									        <label for="slide1">&nbsp;</label>
									        <label for="slide2">&nbsp;</label>
									        <label for="slide3">&nbsp;</label>
									        <label for="slide4">&nbsp;</label>
									        <!-- <label for="slide5">&nbsp;</label>
									        <label for="slide6">&nbsp;</label>
									        <label for="slide7">&nbsp;</label> -->
									    </div>
									</div>
																		
                                </div>
                                <a><h4 style="font-size: 22px;">B.Double Room</h4></a>
                                <h5 class="noto-kr" style="font-size: 16px;font-weight: 400;color: #999;padding-top: 3px;">
                            	전망:도시전망<span style="color:#ffb607"> / </span>
                            	정원:2<span style="color:#ffb607"> / </span>
                            	베드타입:더블1<span style="color:#ffb607"> / </span>
                            	객실크기:0 평
                            	</h5>
                            	
                            	<h4 style="font-size: 18px;margin-bottom:15px;color:#333;font-weight:600;padding-bottom:0">객실 내 정보</h4>
                            	<hr style="margin:15px 0px; border-top: 1px solid #eee;">
                            	<p>더블침대가 1개있는 2인실입니다. 
<br>단독화장실이 준비되어있습니다.
<br>
<br>-유럽식 조식이 제공됩니다.(이용시간 : am7:00~10:00)
<br>-수건/비누등과 같은 다수의 어메니티(amenity)가 제공됩니다. 
<br>-무료주차가능합니다. 
<br>-호텔 바와 카페가 있습니다.
                            	<br><br>
                            	준비된 편의시설 : TV / 에어컨 / 냉장고 / 와이파이  <br>
                            	욕실 편의시설 : 헤어드라이어 / 타월  <br>
                            	주방 편의시설 : 슬리퍼 / 전기 주전자 / 무료 생수  <br>
                            	</p>
                            	
                            	<h4 style="font-size: 18px;margin-bottom:15px;color:#333;font-weight:600;padding-bottom:0">체크인/체크아웃</h4>
                            	<hr style="margin:15px 0px; border-top: 1px solid #eee;">
                            	<p>체크인 시간 : 14:00 이후<br>
                            	체크아웃 시간 : 12:00 이전</p>
                            	
                            	<h4 style="font-size: 18px;margin-bottom:15px;color:#333;font-weight:600;padding-bottom:0">호텔 내 정보</h4>
                            	<hr style="margin:15px 0px; border-top: 1px solid #eee;">
                            	<p>독수리 전망대 호텔은 블라디보스토크에 있는 독수리전망대 앞에 위치해 있습니다. <br>2018년에 지어진 호텔로 블라디보스토크 국제 공항에서 49킬로미터 떨어져 있으며 <br>블라디보스토크의 주요 명소와 관광지에 쉽게 이동할 수 있습니다. <br> 24시간 프런트 데스크를 운영중이며 냉방 시설이 완비된 객실과 무료 WiFi를 이용할수 있습니다. <br><br>* 유럽식 조식이 제공됩니다.(이용시간 : am7:00~10:00)
<br>* 객실별 화장실(샤워실)이 있습니다.
<br>* 객실당 24개월 미만 어린이 1명까지 기존 침대 이용가능합니다.
<br>* 추가침대(엑스트라베드)는 요청이 불가합니다.</p>
                            	
                            	<h4 style="font-size: 18px;margin-bottom:15px;color:#333;font-weight:600;padding-bottom:0">유의사항</h4>
                            	<hr style="margin:15px 0px; border-top: 1px solid #eee;">
                            	<p>* 만 18세 미만 어린이 단독투숙 불가합니다.<br>* 객실 내 흡연 불가입니다.<br>* 개인 물품 분실에 대한 책임은 개인에게 있으며, 독수리호텔에서 책임지지 않습니다.<br>* 이용시 시설물 훼손, 분실에 대한 책임은 투숙객에 있으므로, 유의하시기 바랍니다.<br>* 조용하고 편안한 휴식과 성숙된 숙박 문화를 위하여 고성방가, 무분별한 음주를 삼가합니다.<br>* 입실시간 이전에는 입실이 불가하오니 참고바랍니다.<br>* 퇴실시간 이후는 추가요금이 발생하오니, 시간을 꼭!! 지켜주시기 바랍니다.</p>
                            	
                            	<h4 style="font-size: 18px;margin-bottom:15px;color:#333;font-weight:600;padding-bottom:0">환불규정</h4>
                            	<hr style="margin:15px 0px; border-top: 1px solid #eee;">
                            	<p>※ 업무시간외 담당자 부재로 예약취소 및 변경이 불가합니다.(업무시간 : 평일 09:00~18:00 / 토,일 공휴일 제외) <br>취소 및 변경시 영업일(토,일요일/공휴일제외)기준으로 산정되며, 업무시간이후 취소시에는 다음날 취소된것으로 인정됩니다. 평수기/성수기 취소규정이 다릅니다.
                            	
                            	
	                            	<h5 style="margin: 15px 0; font-weight:500;font-size: 16px;">비수기</h5>
		                            	<table class="table CancellTable1" >
				                        	<tbody>
				                        	<tr>
				                        	<th>취소일</th>
				                        	
					                        	 
					                        	 	
					                        	 	
						                        		<th>30 ~ 8일전</th>
						                        	
					                        	
					                        
					                        	 
					                        	 	
					                        	 	
						                        		<th>7 ~ 4일전</th>
						                        	
					                        	
					                        
					                        	 
					                        
					                        <th>이용당일</th>
				                       		</tr>
				                       		<tr>
				                       		<th>환불금액</th>
					                        
					                        
					                        	<td>100%환불</td>
					                        
					                        
					                        
					                        	<td>50%환불</td>
					                        
					                        
					                        
					                        	<td>0%환불</td>
					                        
					                        
					                        </tr>
				                        	</tbody>
				                        </table>
	                            	
                            	</p>
                            	
                            </div>
                        </div>
                    </div>
</div>
</div>
</section>




                            <ul>
                                <li class="hide">
                                    <img src="/me/resources/images/room-ico/ico-room-bed.png" width="50" height="50" alt="퀸사이즈 침대">
                                    <span>퀸사이즈침대</span>
                                </li>
                                <li class="hide">
                                    <img src="/me/resources/images/room-ico/ico-room-bedding.png" width="50" height="50"  alt="침구">
                                    <span>침구</span>
                                </li>
                                <li class="hide">
                                    <img src="/me/resources/images/room-ico/ico-room-tv.png" width="50" height="50" alt="TV">
                                    <span>TV</span>
                                </li>
                                <li class="hide">
                                    <img src="/me/resources/images/room-ico/ico-room-aircon.png" width="50" height="50" alt="에어컨">
                                    <span>에어컨</span>
                                </li>
                                <li class="hide">
                                    <img src="/me/resources/images/room-ico/ico-room-bbq.png" width="50" height="50" alt="개별바베큐">
                                    <span>개별바베큐</span>
                                </li>
                                <li class="hide">
                                    <img src="/me/resources/images/room-ico/ico-room-refrigerator.png" width="50" height="50" alt="냉장고">
                                    <span>냉장고</span>
                                </li>
                                <li class="hide">
                                    <img src="/me/resources/images/room-ico/ico-room-microwave.png" width="50" height="50" alt="전자레인지">
                                    <span>전자레인지</span>
                                </li>
                                <li class="hide">
                                    <img src="/me/resources/images/room-ico/ico-room-kettle.png"width="50" height="50"  alt="전기주전자">
                                    <span>전기주전자</span>
                                </li>
                                <li class="hide">
                                    <img src="/me/resources/images/room-ico/ico-room-water.png" width="50" height="50" alt="정수기">
                                    <span>정수기</span>
                                </li>
                                <li class="hide">
                                    <img src="/me/resources/images/room-ico/ico-room-wifi.png" width="50" height="50" alt="WiFi">
                                    <span>WiFi</span>
                                </li>
                                <li class="hide">
                                    <img src="/me/resources/images/room-ico/ico-room-cooking.png" width="50" height="50" alt="조리도구">
                                    <span>조리도구</span>
                                </li>
                                <li class="hide">
                                    <img src="/me/resources/images/room-ico/ico-room-hair.png"width="50" height="50"  alt="헤어드라이어">
                                    <span>헤어드라이어</span>
                                </li>
                                <li class="hide">
                                    <img src="/me/resources/images/room-ico/ico-room-bath-amenity.png" width="50" height="50" alt="욕실 어메니티">
                                    <span>욕실어메니티</span>
                                </li>
                                <li class="hide">
                                    <img src="/me/resources/images/room-ico/ico-room-bath.png"width="50" height="50"  alt="대용량 욕실용품">
                                    <span>대용량욕실용품</span>
                                </li>
                                <li class="hide">
                                    <img src="/me/resources/images/room-ico/ico-room-pool.png" width="50" height="50" alt="실내수영장">
                                    <span>실내수영장</span>
                                </li>
                            </ul>







<jsp:include page="../main/footer.jsp" />

</html>