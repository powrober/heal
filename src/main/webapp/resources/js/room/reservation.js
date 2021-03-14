jQuery(document).ready(function(){

    jQuery.ajaxSetup({cache:false});


    /*
        * 실시간 예약 | 조회 링크
    */
    $('.nav-area .list-item').click(function(){

       if($(this).hasClass('list-reservation') && !$(this).hasClass('active')){
            // 실시간 예약 => 예약 확인

            if($(this).hasClass('finish')){ // 예약 완료(데이터는 미리 삭제)
                linkClicks('실시간예약', '버튼클릭', '상단 예약확인 탭 클릭'); // 통계
                window.location.replace(base_url+"home/reservation/viewinfo");
            }
            else if(confirm('현재 입력중인 예약 건이 있습니다.\n정말로 종료하시겠습니까?')){

                linkClicks('실시간예약', '버튼클릭', '상단 예약확인 탭 클릭'); // 통계

                if($(this).hasClass('hold-cancel')){ // 객실 홀드 제거
                    var p_data = JSON.parse(sessionStorage.getItem("p_data"));
                    roomStatusHoldRelease(p_data.idx, p_data.s, p_data.e);

                    // Ajax 로딩 후 넣기
                    $(document).ajaxStop(function(){
                        sessionStorage.removeItem("p_data"); // 이동 => 데이터 삭제
                        window.location.replace(base_url+"home/reservation/viewinfo");
                    });
                }
                else{ // 홀드 제거가 필요 없는 페이지
                    sessionStorage.removeItem("p_data"); // 이동 => 데이터 삭제
                    window.location.replace(base_url+"home/reservation/viewinfo");
                }
            }
        }
        else if($(this).hasClass('view-info') && !$(this).hasClass('active')){
            // 예약 확인 => 실시간 예약
            window.location.replace(base_url+"home/reservation/view/1");
        }
    });

	/*
		* r01
		* 실시간예약 날짜 선택 로딩
        * 팬션 기본 정보 및 옵션 출력
	*/
    if($('.section-date').is(":visible")){
        initIframeCal(); // 달력 출력
        getReserveInfo(); // 팬션 기본 정보 및 옵션 출력
        no_list_room('예약가능 객실을 검색해주세요.');
    }

    /*
        * r01
        * 객실 리스트 더보기
    */
    $('.room-list-more').on('click', debounce(function(event){
        getReserveRoomList();
    },200));

    /*
        * r01
        * 객실 선택 이미지 슬라이드 닫기(슬릭 제거)
    */
    $('.btn-modal-close').click(function(){
        $('#room_slide').removeClass('active'); // 모달 OFF
        $('#room_slide .modal-carousel-group').slick('unslick'); // slick destroy

    });

    /*
        * r01
        * 객실 선택 이미지 슬라이드 딤 클릭시 닫기
    */
    $('#room_slide .modal-full.dimmed').click(function(event){
        var target =  $(event.target);
        if(target.hasClass('dimmed'))
            $('.btn-modal-close').trigger('click');
    });

    /*
        * r02 셋팅
    */
    if($('.room-table-B').is(":visible")){
        setReserve_r02();
    }

    /*
        * r02
        * 객실 예약 정보 입력
        * @이름, @연락처, @이메일(nullable), @요청사항(nullable), @환불규정동의, @개인정보동의 체크
    */
    $('.btn-next.finish').on('click', debounce(function(event){
        var valid = false; // 유효 검사 변수

        if($('#reserve_name').val().length <1){
            alert("이름을 입력해주세요.");
            $('#reserve_name').focus();
            return false;
        }
        else if(!cnf_phone($('#reserve_phone').val())){
            alert("유효하지 않은 휴대폰 번호입니다.");
            $('#reserve_phone').focus();
            return false;
        }
        else if($('#pension_agree_1').length != $('#pension_agree_1').filter(":checked").length){
            alert('예약안내 및 환뷸규정에 동의해주세요.'); // * 환불 규정
            $('#pension_agree_1').focus();
            return false;
        }
        else if($('#pension_agree_2').length != $('#pension_agree_2').filter(":checked").length){
            alert('개인정보 활용에 동의해주세요.');
            $('#pension_agree_1').focus();
            return false;
        }
        else{
            if($('#reserve_email').val().length>1){ // 이메일 입력 있음
                if(!cnf_e_mail($('#reserve_email').val())){
                    alert("유효하지 않은 이메일 번호입니다.");
                    $('#reserve_email').focus();
                    return false;
                }
                else
                    valid = true;
            }
            else
                valid = true;
        }


        if(valid === true){
            var p_data = JSON.parse(sessionStorage.getItem("p_data"));

            /*
                * 옵션 배열 => string
            */
            var optArr = p_data.opt;
            var str = '';
            for(var prop in optArr){
                if(prop>=1)
                    str+='/'; // 2개 이상인 경우 구분자
                str +=optArr[prop].idx+','+optArr[prop].cnt;
            }

            /*
                * 선택 옵션 스트링
            */
            if($('.room-opt-area').find('span').text() == '없음')
                var reserve_options = null;
            else
                var reserve_options = $('.room-opt-area').find('span').text();

            var isDevice = $('body').attr('class'); // PC or Mobile

            if(p_data.add_num == '' || isNaN(p_data.add_num))// 추가인원 
                var additional_number = 0;
            else
                var additional_number = p_data.add_num;

            var total_number = parseInt(p_data.num)+parseInt(additional_number); // 총인원



            alert("데모 버전에서는 지원하지 않는 기능입니다.");

            /*****************************************************
            loading(true);

            
            $.ajax({
                type: 'POST',
                url: base_url+'api/pension/pension/reserveInsert',
                data:{
                    ci_t: $("#token").val(),
                    pension_id: p_data.idx,
                    room_name: p_data.name,
                    reserve_name: $('#reserve_name').val(),
                    reserve_phone: $('#reserve_phone').val(),
                    reserve_email: $('#reserve_email').val(),
                    reserve_memo: $('#reserve_memo').val(),
                    total_number: total_number,
                    additional_number: additional_number,
                    estimate_cost: p_data.total,
                    options: str,
                    reserve_options: reserve_options,
                    isMobile: isDevice,
                    stay_s_date: p_data.s,
                    stay_e_date: p_data.e,
                },
                success: function(resData){
                    // console.log('success >>>>');
                    // console.log(resData);
                    if(resData.status === true && resData.message == "Insert Success" && resData.result === true){
                        loading(false);
                        linkClicks('실시간예약', '버튼클릭', '예약하기 버튼클릭'); // 통계
                        window.location.replace(base_url+"home/reservation/view/3"); // 이동
                    }
                    else if(resData.status === false && resData.message == "Insert Failed"){
                        loading(false);
                        alert('전송할 데이터가 없거나 네트워크에 에러가 발생하였습니다.');
                        return false;
                    }
                },
                error: function(resData){
                    loading(false);
                    alert('전송할 데이터가 없거나 네트워크에 에러가 발생하였습니다.');
                    return false;
                }
            });
            *********************************************************************/
        }

    },200));


    /*
        * r03
        * 예약 완료 페이지
    */
    if($('.section-finish').is(":visible")){
        var p_data = JSON.parse(sessionStorage.getItem("p_data"));

        $('#reserve_date').text(p_data.reg);
        var num = parseInt(p_data.num) + parseInt(p_data.add_num);
        var str = p_data.name+' ,'+num+'명';

        if(p_data.opt != undefined || p_data.opt !=''){
            for(var prop in p_data.opt)
                str+= (', '+p_data.opt[prop].name+'('+p_data.opt[prop].cnt+'EA)');
        }

        $('#reserve_opt').text(str);

        sessionStorage.removeItem("p_data"); // 데이터 삭제
    }

    /*
        * r03 닫기
    */
    $('.btn-next.close').click(function(){
        reservationClose();
        linkClicks('실시간예약', '버튼클릭', '예약완료 후 확인 버튼 클릭'); // 통계
    });

});

/*
    * 팬션 기본 정보 및 옵션 출력
*/
function getReserveInfo(){
    loading(true);
    $.ajax({
        type: 'GET',
        url: base_url+'api/pension/pension/reserveInfo',
        success: function(resData) {
            // console.log('success >>>>');
            // console.log(resData);
            if(resData.status === true && resData.result.message == "NO DATA"){// 기본 정보가 없음
                $('.section-option').remove(); // 옵션 리스트 삭제
                loading(false);
            }
            else if(resData.status === true && resData.message == "Get List Success"){ // 기본 정보 존재
                loading(false);
                setReserveInfo(resData.result);
            }
            else if(resData.status === false && resData.message == "Parameter ERROR"){ // 기본 정보 파라미터 에러
                loading(false);
                // console.log('기본 정보 파라미터 에러');
                return false;
            }
            else{ // 그 외 분기(있으면안됨)
                loading(false);
                return false;
            }
        },
        error: function(resData) {
            // console.log('error >>>');
            loading(false);
            alert("불러올 데이터가 없거나 네트워크에 문제가 발생했습니다.");
        }
    });
};

function setReserveInfo(res){
    // console.log(res);
    /*
        * 팬션 기본 정보 출력
        * php에 key span 존재시 value값 셋팅
    */
    var data = res.data;
    for(var prop in data){
        $('.date-branch-table').find('#'+data[prop].p_key).text(data[prop].p_value);

        if(data[prop].p_key == 'contents') // 요청사항
            var contents = data[prop].p_value;
        else if(data[prop].p_key == 'contents2') // 환불 규정
            var contents2 = data[prop].p_value;
    }

    var p_data ={
        contents: contents, // 주의사항
        contents2: contents2, // 환불규정
    };
    sessionStorage.setItem("p_data", JSON.stringify(p_data)); // r02 필요 데이터 전송

    /*
        * 팬션 옵션 정보
    */
    if(res.data_option.length != 0){ // 옵션 배열이 있는 경우에만
        var pOpt = res.data_option;

        for(var i=0; i<res.data_option.length; i++){

            if(pOpt[i].thumb_img == "" || pOpt[i].thumb_img == null)
                var optImg = 'noimg.png';
            else
                var optImg = pOpt[i].thumb_img;

            var item ='<tr>\
                            <td class="option-table-B-check-area">\
                                <div class="room-table-A-checkbox">\
                                    <input type="checkbox" id="pension_option_'+pOpt[i].idx+'" class="reservation-checkbox opt-checkbox">\
                                    <label for="pension_option_'+pOpt[i].idx+'" class="checkbox-desc">\
                                        <span></span>\
                                    </label>\
                                </div>\
                            </td>\
                            <td class="option-table-B-img-area">\
                                <div class="opt-img" style="background-image:url(\''+base_url+pOpt[i].path+'/'+optImg+'\')" aria-label="'+pOpt[i].name+'"></div>\
                            </td>\
                            <td class="option-table-B-desc-area">\
                                <div class="option-table-B-desc">\
                                    <h5>'+pOpt[i].name+'</h5>\
                                    <ul>\
                                        <li>\
                                            <p>'+pOpt[i].desc+'</p>\
                                        </li>\
                                    </ul>\
                                </div>\
                            </td>\
                            <td class="option-table-B-select-area">\
                                <div class="select-opt-area clearfix">\
                                    <button type="button" class="btn-opt opt-down"></button>\
                                    <input type="number" id="pension_option_set_'+pOpt[i].idx+'" class="select-opt" value="1" readonly="readonly">\
                                    <button type="button" class="btn-opt opt-up"></button>\
                                </div>\
                            </td>\
                            <td class="option-table-B-price-area">\
                                <div>\
                                    <p><span>'+numberWithCommas(pOpt[i].option_unit_price)+'</span><i>원</i></p>\
                                </div>\
                            </td>\
                        </tr>';
            $('.option-table-B tbody').append(item);

            /*
                * 옵션 정보 셋팅 => pension_option_idx(hide)
            */
            $('#pension_option_'+pOpt[i].idx).data('name',pOpt[i].name); // 옵션명
            $('#pension_option_'+pOpt[i].idx).data('option-unit-price', pOpt[i].option_unit_price); // 가격(hide)
            $('#pension_option_set_'+pOpt[i].idx).data('option-unit-price', pOpt[i].option_unit_price); // 가격(hide)
        }
    }
    else{ // 옵션 정보가 없을 경우 영역 삭제
        $('.section-option').remove();
    }
};


/*
    * 예약 가능 객실 리스트 조회
*/
$(document).on('click' ,'.room-search', function(){

    if($(this).hasClass('active')){ // 날짜 검색 후
        linkClicks('실시간예약', '버튼클릭', '예약가능상품검색'); // 통계
        $('.room-table-A tbody').empty(); // 이전 리스트 제거
        $('.section-more.list-more').removeClass('hide'); // 더보기 영역 활성화
        r_offset.room = 1; // 오프셋 초기화
        getReserveRoomList();
    }
    else
        alert("체크인 ~ 체크아웃 날짜를 선택 후\n예약가능 상품을 검색해주세요.");

});

// 달력 선택시 날짜 연동
var g_date = {
    s:'',
    e:'',
}

// 객실 더보기 오프셋
var r_offset ={
    room:1, // 객실 리스트 더보기
}

/*
    * 객실 리스트 조회
*/
var r_carousel = new Object(); // 객실 슬라이드 배열
function getReserveRoomList(){
    loading(true);
    /*
        * 객실 조회
        * @offset, @limit, @stay_s_date, @stay_e_date('yyyy-mm-dd')
    */
    var limit = 6;

    $.ajax({
        type: 'GET',
        url: base_url+'api/pension/pension/reserveRoomList?offset='+r_offset.room+'&limit='+limit+'&stay_s_date='+g_date.s+'&stay_e_date='+g_date.e+'',
        success: function(resData) {
            // console.log('success >>>>');
            // console.log(resData);
            if(resData.status === true && resData.result.message == "NO DATA"){// 객실 리스트 없음
                loading(false);
                if(!$('.room-img-area').length){
                    no_list_room('예약가능 객실이 존재하지 않습니다.');// 노 리스트
                }

                $('.room-list-more').addClass('active'); // 더보기 숨김
            }
            else if(resData.status === true && resData.message == "Get List Success"){ // 객실 리스트 존재
                loading(false);

                $('.section-option, .section-info-check, .section-more.next').removeClass('hide'); // 옵션 리스트, 총 가격정보, 다음 버튼 open
                $('.default-list').remove(); // 기본 가이드 텍스트 숨김

                setReserveRoomList(resData.result.data, limit);
            }
            else if(resData.status === false && resData.message == "Parameter ERROR"){ // 객실 리스트 파라미터 에러
                loading(false);
                return false;
            }
            else{ // 그 외 분기(있으면안됨)
                loading(false);
                return false;
            }
        },
        error: function(resData) {
            // console.log('error >>>');
            loading(false);
            alert("불러올 데이터가 없거나 네트워크에 문제가 발생했습니다.");
        }
    });
};

/*
    * 객실 리스트 출력
*/
function setReserveRoomList(res, limit){
    // console.log(res);
    var list ={};
    var check_in = $('#check_in').text();
    var check_out = $('#check_out').text();

    if(res != undefined){// 객실 리스트 존재

        for(var i=0; i<res.length; i++){
            /*
                * 객실 옵션 텍스트 구분(공백 추가 : word-break)
            */
            var p_options = res[i].p_options;
            var optStr = '';
            var p_opt_length = p_options.split(",").length;

            for(var k=0; k<p_opt_length; k++)
                optStr+=p_options.split(",")[k]+', ';


            optStr = optStr.slice(0,-2); // 마지막 (,) 제거

            list[i] ='<tr class="room_tr" id="room_tr_'+res[i].idx+'">\
                            <td class="room-img-area">\
                                <div id="carousel_'+res[i].idx+'" class="room-img" style="background-image:url(\''+base_url+res[i].path+'/'+res[i].p_thumb_img+'\')" aria-label="'+res[i].name+'">\
                                    <span class="room-img-more"></span>\
                                </div>\
                            </td>\
                            <td class="room-info-area">\
                                <div class="room-info">\
                                    <div class="room-info-name">\
                                        <h4>'+res[i].name+'</h4>\
                                    </div>\
                                    <div class="room-info-cnt">\
                                        <span>기준 <i>'+res[i].fixed_number+'</i>명 / 최대 <i>'+res[i].max_number+'</i>명</span>\
                                        <div class="select-number clearfix">\
                                            <button type="button"  class="btn-number number-down"></button>\
                                            <input type="number" id="select_num_'+res[i].idx+'" class="select-num" value="0" readonly="readonly">\
                                            <button type="button" class="btn-number number-up"></button>\
                                        </div>\
                                    </div>\
                                    <ul class="room-info-desc">\
                                        <li>\
                                            <span> </span>\
                                            <span>'+optStr+'</span>\
                                        </li>\
                                        <li>\
                                            <span>입실시간 : </span>\
                                            <span>'+check_in+'</span>\
                                        </li>\
                                        <li>\
                                            <span>퇴실시간 : </span>\
                                            <span>'+check_out+'</span>\
                                        </li>\
                                    </ul>\
                                </div>\
                            </td>\
                            <td class="room-price-area">\
                                <div class="room-price">\
                                    <p><span>'+numberWithCommas(res[i].price)+'</span><i>원</i></p>\
                                    <div id="choice_'+res[i].idx+'" class="btn-choice"><span>선택</span></div>\
                                </div>\
                            </td>\
                        </tr>';

            $('.room-table-A tbody').append(list[i]);

            /*
                * 버튼 in data 셋팅(hide)
            */
            $('#choice_'+res[i].idx).data('name',res[i].name); // 객실명
            $('#choice_'+res[i].idx).data('path',res[i].path); // 경로
            $('#choice_'+res[i].idx).data('p-thumb-img',res[i].p_thumb_img); // 이미지
            $('#choice_'+res[i].idx).data('fixed-number',res[i].fixed_number); // 기본 인원

            /*
                * 추가인원 데이터(hide)
            */
            $('#select_num_'+res[i].idx).data('min', res[i].fixed_number);// 최솟값
            $('#select_num_'+res[i].idx).data('max', res[i].max_number); // 최댓값
            $('#select_num_'+res[i].idx).data('additional-fee', res[i].additional_fee); // 추가 인원 당 가격 

            /*
                * 객실 슬라이드 이미지 URL 저장
            */
            r_carousel[res[i].idx] = [];
            r_carousel[res[i].idx].push(res[i].p_thumb_img); // 대표 이미지

            r_carousel[res[i].idx]['path'] = res[i].path; // path
            r_carousel[res[i].idx]['name'] = res[i].name; // name
            r_carousel[res[i].idx]['p_desc'] = res[i].p_desc; // 객실 상세

            // 서브이미지 p_img01 ~ 05 존재여부 체크
            for(var k=1; k<=5; k++){
                var str = 'res['+i+'].p_img0'+k;

                if(eval(str) !== ""){ // 객실 이미지 존재
                    var img = eval(str);
                    r_carousel[res[i].idx].push(img); // 서브 이미지 URL 저장
                }
            }
        }

        if(res.length<limit){
            $('.room-list-more').addClass('active'); // 더보기 숨김
            r_offset.room = 1;
        }
        else{
            $('.room-list-more').removeClass('active'); // 더보기 생성
            r_offset.room++;
        }
    }
};

/*
    * 객실 리스트 디폴트 가이드
*/
function no_list_room(txt){
    var item = '<tr class="default-list">\
                    <td colspan="4">\
                        <span>'+txt+'</span>\
                    </td>\
                </tr>';
    $('.room-table-A tbody').append(item);
};

/*
    * 객실 선택 이미지 슬라이드
*/
$(document).on('click', '.room-img-more', function(){
    var idx = $(this).parent().parent().parent().attr('id').split("_")[2]; // 객실 idx = object[idx]

    $('#room_slide .modal-carousel-group').empty(); // 기존 이미지 비우기

    for(var i=0; i<r_carousel[idx].length; i++){ // 선택한 방의 이미지 추가
        var item ='<div class="modal-carousel-item" style="background-image:url(\''+base_url+r_carousel[idx]['path']+'/'+r_carousel[idx][i]+'\')" aria-label="'+r_carousel[idx]['name']+'"></div>';
        $('#room_slide .modal-carousel-group').append(item);
    }

    $('#room_slide').addClass('active'); // 모달 활성화
    $('#room_slide .modal-title span').text(r_carousel[idx]['name']); // 객실명
    $('#room_slide .modal-contents').html(r_carousel[idx]['p_desc']); // 객실 상세 설명

    /*
        * 객실 상세 링크 설정(새창 열기)
        * iframe의 부모 => 메뉴 url 잘라서 메뉴코드 검색 => 링크 설정
    */
    var link = $('.nav-area', parent.document).find("[data-list-type=PENSION]").find('a').eq(0).attr('href').split("/")
    var link_length = link.length;
    var last_link = link[link_length-1];
    var code_g = last_link.split("?")[1].split("&");
    var menu_code = code_g[0].split("=")[1];
    var menu_up_code = code_g[1].split("=")[1];
    var room_link = base_url+'home/pension/detail?idx='+idx+'&menu_code='+menu_code+'&menu_up_code='+menu_up_code;

    $('#room_slide .modal-footer a').attr('href',room_link); // 객실 상세 링크 변경

    setModalCarousel(); // 슬라이드 활성화
});

/*
    * 객실 상세보기 슬라이드 활성화
*/
function setModalCarousel(){
    $(".modal-carousel-group").slick({
        infinite: true, // 무한 재생
        adaptiveHeight: false, // 슬라이더 높이를 현재 슬라이드에 맞춤
        slidesToShow: 1, // 슬라이더 보여줄 갯수
        slidesToScroll: 1, // 한 번에 스크롤 할 슬라이드 수
        arrows: true, // 다음,  이전 화살표 사용
        autoplay: true, // 자동재생
        autoplaySpeed: 8000, // 자동재생 시간
        dots: false, // 현재 슬라이드 표시점
        swipe: true, // 터치 스와이프
        swipeToSlide: true, // slidesToScroll에 관계없이 스 와이프하여 슬라이드
        touchMove: true, // 터치로 슬라이드 이동 가능

        // 반응형 응답 포인트
        responsive: [{
            breakpoint: 1024, // 태블릿
            settings: {
                swipe: true, // 터치 스와이프
                swipeToSlide: true, // slidesToScroll에 관계없이 스 와이프하여 슬라이드
                touchMove: true, // 터치로 슬라이드 이동 가능
            }
        }, {
            breakpoint: 768, // 모바일
            settings: {
                swipe: true, // 터치 스와이프
                swipeToSlide: true, // slidesToScroll에 관계없이 스 와이프하여 슬라이드
                touchMove: true, // 터치로 슬라이드 이동 가능
            }
        }]
    });
};

/*
    * 옵션 선택
    * 체크박스(선택) && 선택 갯수 동시 동기화 (옵션 가격)
*/
var opt_list = new Object(); // opt_list [idx] : [idx][cnt][price]
$(document).on('change', '.opt-checkbox', function(){
    var idx = $(this).attr('id').split("_")[2]; // 선택 옵션 idx
    var price = $(this).data('optionUnitPrice'); // price
    chageOpt(idx, price);
});

/*
    * 옵션 갯수 추가
*/
$(document).on('click', '.btn-opt', function(){
    var display = $(this).siblings('.select-opt');
    var idx = display.attr('id').split("_")[3];
    var num = display.val(); // 현재 추가된 옵션 갯수
    var price = display.data('optionUnitPrice'); // 옵션 EA가격

    if($(this).hasClass('opt-down') && num > 0){ // (-)
        var add_opt = parseInt(num)-parseInt(1);
        display.val(add_opt);
    }
    else if($(this).hasClass('opt-up')){ // (+)
        var add_opt = parseInt(num)+parseInt(1);
        display.val(add_opt);
    }

    var input = $(this).siblings('input');
    valAnimate($(this));

    function valAnimate(tg){

        if(tg.hasClass('opt-down') && num > 0)
            input.css({
                '-ms-transform':'translateY(30px)',
                '-webkit-transform':'translateY(30px)',
                '-moz-transform':'translateY(30px)',
                '-o-transform':'translateY(30px)',
                'transform':'translateY(30px)'
            });
        else if(tg.hasClass('opt-up'))
            input.css({
                '-ms-transform':'translateY(-30px)',
                '-webkit-transform':'translateY(-30px)',
                '-moz-transform':'translateY(-30px)',
                '-o-transform':'translateY(-30px)',
                'transform':'translateY(-30px)'
            });

        tg.addClass('active').delay(100).queue(function(next){
            tg.removeClass('active');
            
            input.css({
                '-ms-transform':'translateY(0px)',
                '-webkit-transform':'translateY(0px)',
                '-moz-transform':'translateY(0px)',
                '-o-transform':'translateY(0px)',
                'transform':'translateY(0px)'
            });

            next(); 
        });
    };

    chageOpt(idx, price);
});

/*
    * 옵션 체크박스 && 콤보 연동
    * @idx, price
*/
function chageOpt(idx, price){

    if($('#pension_option_'+idx).filter(":checked").length){
        // 옵션 선택(체크+갯수)
        var cnt = $('#pension_option_set_'+idx).val(); // EA
        opt_list[idx] = [];
        opt_list[idx]['idx'] = idx;
        opt_list[idx]['cnt'] = cnt;
        opt_list[idx]['price'] = price;
    }
    else{
        // 배열 초기화
        opt_list[idx] = [];
    }

    // 현재 선택된 방이 있으면 계산
    if($('.btn-choice.active').length != 0)
        var room_idx = $('.btn-choice.active').attr('id').split("_")[1];
    else
        var room_idx = undefined;

    calTotalSum(room_idx);
};

/*
    * 인원 추가
*/
var add_number = new Object();
$(document).on('click', '.btn-number', function(){
    var display = $(this).siblings('.select-num');
    var idx = display.attr('id').split("_")[2];
    var min = display.data('min'); // 기준인원
    var max = display.data('max'); // 최대 추가 가능인원
    var diff = max-min; // 사이값
    var num = display.val(); // 현재 추가된 인원 수
    var price = display.data('additionalFee'); // 인원당 추가 가격

    if($(this).hasClass('number-down') && num != 0){ // (-)
        var add_num = parseInt(num)-parseInt(1);
        display.val(add_num);
    }
    else if($(this).hasClass('number-up')&& num <diff){ // (+)
        var add_num = parseInt(num)+parseInt(1);
        display.val(add_num);
    }
    else{
        var add_num = num;
        display.val(num);
    }

    // 배열 생성
    add_number[idx] = [];
    add_number[idx]['idx'] = idx;
    add_number[idx]['cnt'] = add_num;
    add_number[idx]['price'] = price;

    $(this).removeClass('active');


    var input = $(this).siblings('input');

    valAnimate($(this));

    function valAnimate(tg){

        if(tg.hasClass('number-down') && num != 0)
            input.css({
                '-ms-transform':'translateY(30px)',
                '-webkit-transform':'translateY(30px)',
                '-moz-transform':'translateY(30px)',
                '-o-transform':'translateY(30px)',
                'transform':'translateY(30px)'
            });
        else if(tg.hasClass('number-up')&& num <diff)
            input.css({
                '-ms-transform':'translateY(-30px)',
                '-webkit-transform':'translateY(-30px)',
                '-moz-transform':'translateY(-30px)',
                '-o-transform':'translateY(-30px)',
                'transform':'translateY(-30px)'
            });

        tg.addClass('active').delay(100).queue(function(next){
            tg.removeClass('active');
            
            input.css({
                '-ms-transform':'translateY(0px)',
                '-webkit-transform':'translateY(0px)',
                '-moz-transform':'translateY(0px)',
                '-o-transform':'translateY(0px)',
                'transform':'translateY(0px)'
            });

            next(); 
        });
    };

    calTotalSum(idx);
});

/*
    * 객실 선택
*/
$(document).on('click', '.btn-choice', function(){
    var idx = $(this).attr('id').split("_")[1]; // idx

    // 버튼
    $('.btn-choice').removeClass('active');
    $(this).addClass('active');

    // tr 배경
    $('.room_tr').removeClass('active');
    $('#room_tr_'+idx).addClass('active');

    getTotalSum(idx);
});

/*
    * 선택 객실 숙박기간 동안 요금 조회
*/
function getTotalSum(idx){
    loading(true);
    $.ajax({
        type: 'GET',
        url: base_url+'api/pension/pension/totalSum?pension_id='+idx+'&stay_s_date='+g_date.s+'&stay_e_date='+g_date.e+' ',
        success: function(resData) {
            // console.log('success >>>>');
            // console.log(resData);
            if(resData.status === true && resData.result.message == "NO DATA"){// 합산 요금 없음
                loading(false);
            }
            else if(resData.status === true && resData.message == "Get List Success"){ // 합산 요금 존재
                loading(false);
                setTotalSum(resData.result, idx);
            }
            else if(resData.status === false && resData.message == "Parameter ERROR"){ // 합산 요금 파라미터 에러
                loading(false);
                return false;
            }
            else{ // 그 외 분기(있으면안됨)
                loading(false);
                return false;
            }
        },
        error: function(resData) {
            // console.log('error >>>');
            // console.log('getTotalSum');
            loading(false);
            alert("불러올 데이터가 없거나 네트워크에 문제가 발생했습니다.");
        }
    });
};

// * 선택 객실 숙박기간 동안 요금 셋팅
function setTotalSum(res, idx){
    // console.log(res);

    // 선택 결과 판넬 (객실 이용 금액)
    $('#room_price').text(numberWithCommas(res));
    $('#room_price').data('price',res); // hide

    // 최종 금액
    calTotalSum(idx);
};

/*
    * 선택 결과 판넬 정보 출력
    * @ 객실 idx
    * 객실 이용, 인원 추가, 옵션 이용 => 최종
*/
function calTotalSum(idx){

    // 객실 idx 필수 요소(객실이용, 인원 추가)
    if(idx !== undefined){
        // 객실 이용 금액
        var room_price = $('#room_price').data('price');

        // 선택한 방에만 인원 가격 추가
        if($('#choice_'+idx).hasClass('active') && add_number[idx] != undefined)
            var number_price = parseInt(add_number[idx]['cnt'])*parseInt(add_number[idx]['price']);
        else
            var number_price = 0;

        $('#number_price').text(numberWithCommas(number_price)); // 텍스트 출력
        $('#number_price').data('price',number_price); // 추가인원 (hide)
    }

    // 옵션 이용금액
    var total_opt_price = 0;
    for(var prop in opt_list){
        if(opt_list[prop].cnt === undefined){ // 체크 && 갯수 선택이 해제된경우
            opt_list[prop].cnt = 0;
            opt_list[prop].price = 0;
        }
        total_opt_price += opt_list[prop].cnt * opt_list[prop].price; // 옵션 총합
    }

    if(isNaN(total_opt_price)) // 체크 예외 처리
        total_opt_price = '';

    $('#option_price').text(numberWithCommas(total_opt_price)); // 텍스트 출력
    $('#option_price').data('price', total_opt_price); // 옵션 총합계


    if(total_opt_price == '')
        var total = parseInt(room_price)+parseInt(number_price);
    else
        var total = parseInt(room_price)+parseInt(number_price)+parseInt(total_opt_price);

    if(isNaN(total)) // NaN 값 처리
        total = '';

    $('#full_total_sum').text(numberWithCommas(total)); // 텍스트 출력
    $('#full_total_sum').data('price', total); // 총합(hide);
};

/*
    * r01
    * 다음 단계(객실 예약 정보 입력)
*/
$(document).on('click', '.btn-next.next', function(){

    var v = true;

    var s_opt = new Object();
    var o_cnt = 0; // 체크한 옵션 갯수
    var s_cnt = 0; // 체크할 옵션 갯수

    if(!$('.btn-choice').hasClass('active')){// 방선택 여부
        v = false;
        alert('객실을 선택해주세요.');
        return false;
    }
    else if(g_date.s == '' || g_date.e == ''){ // 날짜 선택 여부
        v = false;
        return false;
    }
    var idx = $('.btn-choice.active').attr('id').split("_")[1]; // 객실 idx

    $('.opt-checkbox').each(function(index) {
        var select = $('.opt-checkbox').eq(index).parent().parent().siblings('.option-table-B-select-area');
        if($('.opt-checkbox').eq(index).filter(":checked").length == 1 && select.find('.select-opt').val() == 0){
            // 옵션 체크 O && 갯수 선택 X
            v = false;
            alert('선택하신 옵션 갯수를 선택해주세요.');
            return false;
        }

        if($('.opt-checkbox').eq(index).filter(":checked").length == 1)
            o_cnt++;
    });


    if(o_cnt != 0){
        for(var i=0; i<o_cnt; i++) // 선택 옵션 만큼 다차원 오브젝트 생성
            s_opt[i] = new Object();

        $('.opt-checkbox').each(function(index) {
            var select = $('.opt-checkbox').eq(index).parent().parent().siblings('.option-table-B-select-area');
            if($('.opt-checkbox').eq(index).filter(":checked").length == 1){
                // 체크 된 옵션들
                var optIdx = $('.opt-checkbox').eq(index).attr('id').split("_")[2];

                s_opt[s_cnt]['idx'] = optIdx;
                s_opt[s_cnt]['name'] = $('.opt-checkbox').eq(index).data('name');
                s_opt[s_cnt]['cnt'] = select.find('.select-opt').val();
                s_cnt ++;
            }
        });
    }

    if(v === true){
        var p_data = JSON.parse(sessionStorage.getItem("p_data"));

        linkClicks('실시간예약', '버튼클릭', '다음단계버튼클릭'); // 통계

        // 세션 스토리지에 데이터 추가
        var add_data = {
            idx: idx, // 객실 idx
            name: $('#choice_'+idx).data('name'),
            path: $('#choice_'+idx).data('path'),
            img: $('#choice_'+idx).data('pThumbImg'),
            num: $('#choice_'+idx).data('fixedNumber'),
            add_num: $('#select_num_'+idx).val(),
            opt:s_opt,
            s:g_date.s,
            e:g_date.e,
            reg: $('#info_check_date').data('reg'),
            total: $('#full_total_sum').data('price'),
            contents: p_data.contents,
            contents2: p_data.contents2,
        };

        sessionStorage.setItem("p_data", JSON.stringify(add_data)); // r02 필요 데이터 전송
        window.location.replace(base_url+"home/reservation/view/2"); // 이동
    }
});


/*
    * r02 셋팅
*/
function setReserve_r02(){
    var p_data = JSON.parse(sessionStorage.getItem('p_data'));

    /*
        * 객실 예약 정보 출력
    */
    $('.room-img-area').find('span').text(p_data.name); // 객실명
    $('.room-img-area .room-img').css("background-image",'url("'+base_url+p_data.path+'/'+p_data.img+'")'); // 이미지
    $('.room-img-area .room-img').attr('aria-label', p_data.name); // 대체 텍스트

    if(p_data.add_num == '')// 기본인원 + 추가인원
        $('.room-h-cnt-area').find('span').text(p_data.num); // 기본인원
    else
        $('.room-h-cnt-area').find('span').text(parseInt(p_data.num)+parseInt(p_data.add_num)); // 기본+추가인원

    $('.room-date-area').find('span').text(p_data.reg); // 이용일

    $('.room-total-price-area').find('span').text(numberWithCommas(p_data.total)); // 이용요금

    var optStr = ''; // 옵션 정보
    for(var prop in p_data.opt)
        optStr+=p_data.opt[prop].name+' ('+p_data.opt[prop].cnt+'EA), ';

    if(optStr == ''){
        optStr = '없음';
        $('.room-opt-area').find('span').text(optStr); // 마지막 (,) 제거
    }
    else
        $('.room-opt-area').find('span').text(optStr.slice(0,-2)); // 마지막 (,) 제거

    // 요청사항
    $('.terms-body.demand').html(p_data.contents);

    // 환불규정
    $('.terms-body.refund').prepend(p_data.contents2);

    /*
        * 객실 홀드
    */
    updateRoomStatusHold(p_data.idx, p_data.s, p_data.e);
}; 


function updateRoomStatusHold(idx, s, e){
    loading(true);
    $.ajax({
        type: 'GET',
        url: base_url+'api/pension/pension/roomStatusHold?p_id='+idx+'&stay_s_date='+s+'&stay_e_date='+e+'',
        success: function(resData) {
            // console.log('success >>>>');
            // console.log(resData);
            if(resData.status === true && resData.message == "Insert Success" && resData.result === true){
                loading(false);
                // console.log('hold');
            }
            else if(resData.status === false && resData.message == "Insert Success" ){
                loading(false);
                alert("불러올 데이터가 없거나 네트워크에 문제가 발생했습니다.\n다시 접속해주세요.");
                window.location.replace(base_url+"home/reservation/view/1"); // 이동
            }
            else{ // 그 외 분기(있으면안됨)
                loading(false);
                alert("불러올 데이터가 없거나 네트워크에 문제가 발생했습니다.\n다시 접속해주세요.");
                window.location.replace(base_url+"home/reservation/view/1"); // 이동
                return false;
            }
        },
        error: function(resData) {
            // console.log('error >>>');
            loading(false);
            alert("홀드 불러올 데이터가 없거나 네트워크에 문제가 발생했습니다.\n다시 접속해주세요.");
        }
    });
};

/*
    * 객실 홀드 제거
    * r02 => 취소 | 예약 확인 이동
*/
function roomStatusHoldRelease(idx, s, e){
    loading(true);
    $.ajax({
            type: 'GET',
            url: base_url+'api/pension/pension/roomStatusHoldRelease?p_id='+idx+'&stay_s_date='+s+'&stay_e_date='+e+'',
            success: function(resData) {
                // console.log('success >>>>');
                // console.log(resData);
                if(resData.status === true && resData.message == "Update Success" && resData.result === true){ // 성공
                    // console.log('성공');
                    loading(false);
                }
                else if(resData.status === false && resData.message == "Update Failed"){ // 실패
                    loading(false);
                    alert("불러올 데이터가 없거나 네트워크에 문제가 발생했습니다.");
                }
                else{
                    loading(false);
                    window.location.replace(base_url+"home/reservation/view/1"); // 이동
                    return false;
                    // 그외 분기 X
                }
            },
            // error:function(request,status,error){
            // alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            // console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            // }
            error: function(resData) {
                loading(false);
                alert("불러올 데이터가 없거나 네트워크에 문제가 발생했습니다.");
            }
        });
};

/*
    * 실시간 예약 아이프레임 close
*/
$(document).on('click','.reservation-close', function(){

    if($(this).hasClass('finish')){ // 예약 완료 =>닫기 (데이터는 미리제거완료)
        linkClicks('실시간예약', '버튼클릭', '상단 창닫기 버튼클릭 '); // 통계
        reservationClose();
    }
    else if($(this).hasClass('flag')){ // 예약 확인
        linkClicks('실시간예약', '버튼클릭', '상단 창닫기 버튼클릭 '); // 통계
        reservationClose();
    }
    else if(confirm('현재 입력중인 예약 건이 있습니다.\n정말로 종료하시겠습니까?')){ // 예약
        linkClicks('실시간예약', '버튼클릭', '상단 창닫기 버튼클릭 '); // 통계

        if($(this).hasClass('hold-cancel')){ // 객실 홀드 제거
            var p_data = JSON.parse(sessionStorage.getItem("p_data"));
            roomStatusHoldRelease(p_data.idx, p_data.s, p_data.e);
        }

        sessionStorage.removeItem("p_data"); // 닫기 => 데이터 삭제
        reservationClose();
    }
});

function reservationClose(){
    $(".wrap").css("display","none");

    // 모바일 메뉴가 열리지 않은 경우에만
    if(!$('#modal-reservation', parent.document).siblings('.wrap').find('.menu-box').hasClass('active'))
        $('#modal-reservation', parent.document).parent('body').css({'position': 'relative'});

    $('#modal-reservation', parent.document).removeClass('active'); // 아이프레임 상위 모달 닫기

    // 모바일 플로팅 메뉴 on ? => 닫기
    if($('#modal-reservation', parent.document).siblings('.float-menu').hasClass('active')){
        $('#modal-reservation', parent.document).siblings('.float-menu').find('.btn-float.more').trigger('click');
    }
};

/*
    * r01 날짜 선택 달력
*/
function initIframeCal() {
    window.datepicker = new Datepickk();

    /*Set minDate*/
    var today = new Date();
    datepicker.minDate = new Date(today.getFullYear(), today.getMonth(), today.getDate());

    /* set MaxDate */

    var m = new Date(); // 오늘
    var addDate = datepicker.minDate.getTime() + (maxRange * 24 * 60 * 60 * 1000); // 30일 후
    m.setTime(addDate);

    datepicker.maxDate = m;

    /*Set container*/
    datepicker.container = document.querySelector('#calendar');

    /*Set lang*/
    datepicker.lang = 'kr';
    if( $('.wrap').width()<= 1024){
        var highlight = {
            color: '#ffffff',
            background:"#475EDF",
        };
    }
    else{
        var highlight = {
            color: '#ffffff',
            background:"#475EDF",
        };
    }


    datepicker.highlight = highlight;
    datepicker.el._data = [];
    datepicker.el._data.push(highlight.start,highlight.end);

    datepicker.show();

    // 날짜 선택 시
    datepicker.onSelect = function(checked) {

        var state = (checked)?'selected':'unselected';

        function reset()
        {
            var highlight = {
                start: new Date(datepicker.el._data[0]),
                end: new Date(datepicker.el._data[1]),
                backgroundColor: '',
                color: '',

                // 0814 하이라이트 수정
                background:'',
                // 0821 추가 수정
                backgroundPositionY:'',
                transform:'',

            };
            datepicker.highlight = highlight;

            datepicker.el._data.length = 0;
            datepicker.unselectAll();

            $('#selectedDate').removeClass('select');
            $('.room-search').removeClass('active'); // 예약가능 상품 검색 초기화

            // 셀렉트 데이트 초기화 및 디폴트 부분
            $('.selected-date span').text('체크인 ~ 체크아웃 날짜를 선택 후 검색해주세요.');
            $('.selected-date i').text('');
            g_date.s ='';
            g_date.e ='';

            $('.section-option, .section-info-check, .section-more.list-more, .section-more.next').addClass('hide'); // 옵션 리스트, 총 가격정보, 더보기, 다음 버튼 open
            $('.room-table-A tbody').empty();
            no_list_room('예약가능 객실을 검색해주세요.');
        }

        if (checked) {
            if (!datepicker.el._data) {
                datepicker.el._data = [];
            }

            datepicker.el._data.push(this);

            // 두 날짜 이후 새로운 날짜 선택시
            if (datepicker.el._data.length == 3) {
                reset();
                datepicker.selectDate(this);
            }
            // 두개의 날자 선택 시
            else if (datepicker.el._data.length == 2) {


                // 두 날짜간의 시간차
                var days = (new Date(datepicker.el._data[1]) - new Date(datepicker.el._data[0]))/1000/60/60/24;

                // 두번째 날짜가 과거일 경우
                if (days < 0) {
                    reset();
                    datepicker.selectDate(this);
                }
                else {

                    if(days>maxDate){
                        // 최대 숙박 가능 날짜
                        alert('최대 숙박 가능 일수는 '+maxDate+'일 입니다');
                        reset();
                        return false;
                    }

                    // 텍스트 하이라이트
                    if( $('.wrap').width()<= 1024){
                        var highlight = {
                            start: new Date(datepicker.el._data[0]),
                            end: new Date(datepicker.el._data[1]),
                            color: '#ffffff',
                            background:"#475EDF",
                        };
                    }// 태블릿용 하이라이트 추가하기
                    else{
                        var highlight = {
                            start: new Date(datepicker.el._data[0]),
                            end: new Date(datepicker.el._data[1]),
                            color: '#ffffff',
                            background:"#475EDF",
                        };
                    }
                    datepicker.highlight = highlight;

                    /*
                        * 두 날짜를 선택 
                        * 예약가능 상품검색 버튼 활성화
                        * 날짜 포맷 변경후 저장
                        * 날짜 출력
                    */
                    $('.room-search').addClass('active'); // 버튼 

                    // 체크인, 체크아웃 날짜 포맷 변경
                    g_date.s = datepicker.el._data[0].getFullYear()+'-'+("0"+(datepicker.el._data[0].getMonth()+1)).slice(-2)+'-'+("0"+(datepicker.el._data[0].getDate())).slice(-2);
                    g_date.e = datepicker.el._data[1].getFullYear()+'-'+("0"+(datepicker.el._data[1].getMonth()+1)).slice(-2)+'-'+("0"+(datepicker.el._data[1].getDate())).slice(-2);

                    var print_s_date = datepicker.el._data[0].getFullYear()+'년 '+("0"+(datepicker.el._data[0].getMonth()+1)).slice(-2)+'월 '+("0"+(datepicker.el._data[0].getDate())).slice(-2)+'일';
                    var print_e_date = datepicker.el._data[1].getFullYear()+'년 '+("0"+(datepicker.el._data[1].getMonth()+1)).slice(-2)+'월 '+("0"+(datepicker.el._data[1].getDate())).slice(-2)+'일';
                    var k_diffTime_date = ((datepicker.el._data[1] - datepicker.el._data[0]) /(1000*60*60))/24; // (N박) 계산

                    $('.selected-date span').text(print_s_date+' ~ '+print_e_date); // 선택 날짜 출력
                    $('.selected-date i').text(' ('+k_diffTime_date+'박)'); // (N박 출력)

                    // 선택 결과 판넬 
                    var k_reg_date = print_s_date+' ~ '+print_e_date+' ('+k_diffTime_date+'박)';
                    $('#info_check_date').text(k_reg_date); // 선택 날짜 출력
                    $('#info_check_date').data('reg', k_reg_date);
                }
            }
            else{
                // 하루만 선택 가능
            }
        }
        else {
            // 기존에 선택되어 있던 날짜가 있는 상태에서 취소가 들오온다는건 해당 날짜를 다시 누른경우
            if (datepicker.el._data.length == 2) {
                reset();
                datepicker.selectDate(this);
            }
            else if (datepicker.el._data.length == 1) {
                reset();
                datepicker.selectDate(this);
            }
        }
    };
};