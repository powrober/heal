/**
 * 
 */
(function($){
	$(document).ready(function(){
		 $('select:not(.hidden)[data-init-plugin="select2"]').each(function() {
	        $(this).select2({
	            minimumResultsForSearch: ($(this).attr('data-disable-search') == 'true' ? -1 : 1),
	            dropdownParent: $(this).data('parent') != undefined ? $($(this).data('parent')) : $(document.body)
	        }).on('select2:open', function() {
	            $.fn.scrollbar && $('.select2-results__options').scrollbar({
	                ignoreMobile: false
	            })
	        });
	    });
		 
		$("#reserveCheckModal").on('shown.bs.modal',function(){
			$("#reserveCheckModal input[name='name']").focus();
			$("#reserveCheckFrm input[type=text]").val('');
		});
		
		$(document).on('blur, keyup',"#reserveCheckFrm input[type=text]",function(){
			var $target = $("#reserveCheckFrm input[type=text]");
			var check = true;
			
			for(var i=0; i<$target.length; i++)	{
				if($target.eq(i).val() == '')
					check = false;
			}
			
			if(check)	{
				$("#reserveCheck").removeClass('disabled');
				$("#reserveCheck").prop('disabled',false);
			} else	{
				$("#reserveCheck").addClass('disabled');
				$("#reserveCheck").prop('disabled',true);
			}
		})
	
		$("#reserveCheck").click(function(){
			var name = $("#reserveCheckFrm input[name=name]").val();
			var hp1 = $("#reserveCheckFrm select[name=hp1] option:selected").val();
			var hp2 = $("#reserveCheckFrm input[name=hp2]").val();
			var hp3 = $("#reserveCheckFrm input[name=hp3]").val();
			var hp = hp1 + hp2 + hp3;
	
			$("#reserveCheckFrm").submit();
		})
		$(".cancel-btn").click(function(){
			$('.loading-payment').removeClass('hidden');
			var order_idx = $(this).data("idx");
			$.ajax({
				url:'/calendar/v2/refundInfo',
				type:'post',
				dataType:'json',
				data:{
					order_idx: order_idx
				},
				success:function(data)	{
					$('.loading-payment').addClass('hidden');
					if(data.result == 'success'){
						if(confirm(data.msg)){
							$('.loading-payment').removeClass('hidden');
							$.ajax({
								url:'/calendar/v2/cancelOrder',
								type:'post',
								dataType:'json',
								data:{
									order_idx: order_idx
								},
								success:function(data)	{
									$('.loading-payment').addClass('hidden');
									if(data.result == "success"){
										alert("취소요청이 완료되었습니다.");
										location.reload(0);
									}else{
										alert("관리자에게 문의하시기 바랍니다! \n 고객센터 :1899-1209");
									}
								}, error:function(){
									alert("관리자에게 문의하시기 바랍니다! \n 고객센터 :1899-1209");
								}
							})
						}
					}else{
						alert("관리자에게 문의하시기 바랍니다! \n 고객센터 :1899-1209");
					}
				}, error:function(){
					alert("관리자에게 문의하시기 바랍니다! \n 고객센터 :1899-1209");
				}
			})
		});
		
		$("footer a").hover(function(){
			$(this).find('.logo-bk').addClass('hidden');
			$(this).find('.logo-cl').removeClass('hidden');
		}, function(){
			$(this).find('.logo-bk').removeClass('hidden');
			$(this).find('.logo-cl').addClass('hidden');
		})
		
		$('.chatting-quickview-btn').click(function(){
			var url = $(this).data('url');
			
			chat(url);
		});
	})
})(window.jQuery);

function date_add(sDate, nDays) {
    var yy = parseInt(sDate.substr(0, 4), 10);
    var mm = parseInt(sDate.substr(5, 2), 10);
    var dd = parseInt(sDate.substr(8), 10);
 
    d = new Date(yy, mm - 1, dd + Number(nDays));
 
    yy = d.getFullYear();
    mm = d.getMonth() + 1; mm = (mm < 10) ? '0' + mm : mm;
    dd = d.getDate(); dd = (dd < 10) ? '0' + dd : dd;
 
    return '' + yy + '-' +  mm  + '-' + dd;
}

function numberFormat(num) {
	var pattern = /(-?[0-9]+)([0-9]{3})/;
	while(pattern.test(num)) {
		num = num.replace(pattern,"$1,$2");
	}
	return num;
}

function isMobile(){
	var result = false;
	
	var mobileKeyWords = new Array('iPhone', 'Android', 'Windows CE', 'LG', 'MOT', 'SAMSUNG', 'SonyEricsson');
	var device_name = '';
	for (var word in mobileKeyWords){
		if (navigator.userAgent.match(mobileKeyWords[word]) != null){
			result = true;
			break;
		}
	}
	return result;
}

function isBrowserCheck(){
    var agt = navigator.userAgent.toLowerCase();
    if (agt.indexOf("chrome") != -1) return 'Chrome'; 
    if (agt.indexOf("opera") != -1) return 'Opera'; 
    if (agt.indexOf("staroffice") != -1) return 'Star Office'; 
    if (agt.indexOf("webtv") != -1) return 'WebTV'; 
    if (agt.indexOf("beonex") != -1) return 'Beonex'; 
    if (agt.indexOf("chimera") != -1) return 'Chimera'; 
    if (agt.indexOf("netpositive") != -1) return 'NetPositive'; 
    if (agt.indexOf("phoenix") != -1) return 'Phoenix'; 
    if (agt.indexOf("firefox") != -1) return 'Firefox'; 
    if (agt.indexOf("safari") != -1) return 'Safari'; 
    if (agt.indexOf("skipstone") != -1) return 'SkipStone'; 
    if (agt.indexOf("netscape") != -1) return 'Netscape'; 
    if (agt.indexOf("mozilla/5.0") != -1) return 'Mozilla'; 
    if (agt.indexOf("msie") != -1) { // 익스플로러 일 경우
        var rv = -1;    
        if (navigator.appName == 'Microsoft Internet Explorer') {        
            var ua = navigator.userAgent;   
            var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");  
            if (re.exec(ua) != null) rv = parseFloat(RegExp.$1);    
        }
        
        var result = 'MSIE ';
        
        if(rv >= 9)
        	result += 'HIGH';
        else
        	result += 'LOW';
        
        return result;
    }
}

function zeros(n, digits) {
	var zero = '';
	n = n.toString();
	
	if (n.length < digits) {
		for (var i = 0; i < digits - n.length; i++)
			zero += '0';
	}
	return zero + n;
}

function comma(x) {
	var y = x.toString().replace(/,/g, "");
	
    return y.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function chat(url)	{
	window.open(url,'_blank');
}

function popup(){
	
	$.ajax({
		url:"/getPopup",
		type:'post',
		dataType:'json',
		success:function(data){
			var resultValue = data;
				if(resultValue.result == "success"){
					var modalList = new Array();
					var popup_cookie = new Map();
					var popupList = '';
					modalList = resultValue.list;
					if(modalList.length != null){
						for(var i=0;i<modalList.length; i++){
							if ($.cookie(modalList[i].popup_idx) == undefined) {
								popupList += 
					            "<div class=\"modal\" data-modal=\"modal"+i+"\">"+
					            "<div class=\"col-md-6 col-md-offset-3\" style='height:580px;' >"+
				                "<div class=\"boxed boxed--radius boxed--shadow-lg bg-color--white\" style='background-color:"+modalList[i].popup_image+";'>"
					                        if(modalList[i].popup_image == '#ffffff'){
					                        	popupList += "<i class=\"material-icons ico-xs arcticmodal-close right\">clear</i>"+
					                        				 "<h5 style='color:#000000;font-weight: 500;'>"+modalList[i].popup_title+"</h5>"+
					                        				  "<p style='color:#000000;'>"+modalList[i].popup_content+"</p>"+
					                        				  "<div class=\"pull-right\">"+
					                        				  "<span  class='arcticmodal-close' style='color:#000000;' onclick='setCookie(\""+modalList[i].popup_idx+"\",\"ok\",\"365\")'>다시보지않기</span>"+
					                        				  "</div></div></div></div>";
					                        }	
					                        else{
					                        	popupList +=  "<i class=\"material-icons ico-xs arcticmodal-close right\">clear</i>"+
					                        				  "<h5 style='color:#ffffff;font-weight: 500;'>"+modalList[i].popup_title+"</h5>"+
					                        				  "<p style='color:#ffffff;'>"+modalList[i].popup_content+"</p>"+
					                        				  "<div class=\"pull-right\">"+
					                        				  "<span  class='arcticmodal-close' style='color:#ffffff;' onclick='setCookie(\""+modalList[i].popup_idx+"\",\"ok\",\"365\")'>다시보지않기</span>"+
					                        				  "</div></div></div></div>";
					                        }
					            
					            
							}
							
						}
					$("#createPopup").html(popupList);
					if(modalList.length == 1){
						CMain.makeArcticModal($('.modal[data-modal=modal0]'), .8);
					}
					else if(modalList.length == 2){
						CMain.makeArcticModal($('.modal[data-modal=modal0]'), .8);
						CMain.makeArcticModal($('.modal[data-modal=modal1]'), .8);
					}else{
						CMain.makeArcticModal($('.modal[data-modal=modal0]'), .8);
						CMain.makeArcticModal($('.modal[data-modal=modal1]'), .8);
						CMain.makeArcticModal($('.modal[data-modal=modal2]'), .8);
					}
					}
					
				}else{
					
				}
			}
		})
}

function setCookie(cName, cValue, cDay){
    var expire = new Date();
    var cookies;
    expire.setDate(expire.getDate() + cDay);
    cookies = cName + '=' + escape(cValue) + '; path=/; '; // 한글 깨짐을 막기위해 escape(cValue)를 합니다.
    if(typeof cDay != 'undefined') cookies += 'expires=' + expire.toGMTString() + ';';
    console.log(document.cookie);
    document.cookie = cookies;
}