$(function(){
	var browser = isBrowserCheck();
	var first_date = moment(new Date());
	if($('#goods_calendar').data('date') != '')
		first_date = moment($("#goods_calendar").data('date'));
	var year = first_date.year();
	var month = first_date.month() + 1;
	var day = first_date.date();
	var today = new Date(year, month-1, day, 0, 0, 0);
	
//	$('.sidebar-menu .menu-items li.active .sub-menu').scrollbar();
	$('.sidebar-menu .menu-items > li > a, .sidebar-menu .menu-items > li > span').click(function(){
		if($(this).find('.arrow').length > 0)	{
			var $target = $(this).closest('.toggle-btn');
			
			if($target.hasClass("open active"))	{
				$target.removeClass("open active");
				$target.find('.arrow').removeClass('open');
				
//				$target.find('.sub-menu').scrollbar('destroy');
			} else	{
				$target.addClass("open active");
				$target.find('.arrow').addClass('open');
				
//				$target.find('.sub-menu').scrollbar();
			}
			
		}
	});
	
	$(".sidebar").hover(function(){
		if(matchMedia("screen and (min-width:998px)").matches)
			$('body').addClass('sidebar-on');
	},function(){
		if(matchMedia("screen and (min-width:998px)").matches)
			$('body').removeClass('sidebar-on');
	})

	var $calendarEl = $('#goods_calendar');
	var calendar;
	
	if($calendarEl.length > 0)	{
		calendar = new FullCalendar.Calendar($calendarEl[0], {
			  plugins:['dayGrid'],
			  header: {
				  left:'',
				  center:'prev title next',
				  right:''
			  },
			  views:{
				  dayGridMonth:{
					  titleFormat:function(date){
						  return date.date.year+'년 '+zeros(date.date.month+1,2)+'월';
					  }
				  }
			  },
			  columnHeaderText: function(date) {
				  let weekList = [];
				  if(isMobile())
					  weekList = ["일", "월", "화", "수", "목", "금", "토"];
				  else
					  weekList = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
				  return weekList[date.getDay()];
			  },
			  datesRender: function(view){
				  var payment = $("#goods_calendar").data('payment');
				  var html = '<span class="badge">예약가능</span>';
				  html += '<span class="badge soldout">예약완료</span>';
				  if(payment == 'Y')
					  html += '<div class="checkbox"><input type="checkbox" id="show_price"><label for="show_price">일자별 요금보기</label></div>';
				  
				  $(view.el).closest('.fc').find('.fc-toolbar').find('.fc-right').html(html);
			  },
			  contentHeight:'auto',
			  aspectRatio:2,
			  dayHeaderFormat:{
				  weekday: 'long'
			  },
			  fixedWeekCount:false,
			  showNonCurrentDates: false,
			  loading: function(bool) {
				  if(bool)
					  $('.loading-calendar').removeClass('hidden');
				  else
					  $('.loading-calendar').addClass('hidden');
		      },
		      validRange:{
		    	  start: first_date.date(1).format('YYYY-MM-DD')
		      },
			  events:function(date, successCallback, failureCallback){
		    	if($(this).data('idx') != ''){
		    		$.ajax({
		    			url:'/calendar/v2/dates/'+$("#goods_calendar").data('idx')+'/'+$("#goods_calendar").data('opt'),
		    			dataType:'json',
		    			data:{
		    				start_date:moment(date.start).format('YYYY-MM-DD'),
		    				end_date:moment(date.end).add(-1).format('YYYY-MM-DD')
		    			},
		    			success:function(data){
		    				var events = [];
		    				
		    				for(var i=0; i<data.list.length; i++){
		    					var info = data.list[i];
		    					
		    					var tmp = [];
		    					var soldout = true;
		    					
		    					for(var j=0; j<info.options.length; j++)	{
		    						var opt = info.options[j];
		    						
		    						var name = opt.name;
		    						
		    						if(opt.goods_type == 'coupon' && opt.roomOption != undefined && opt.roomOption != '')
		    							name += ' / ' + opt.roomOption;
		    						
			    					if(Number(opt.remain_stock) <= 0)	{
			    						tmp.push({
			    							title: name,
			    							start: info.date,
			    							extendedProps: {
			    								reserve:'N',
			    								option_id:opt.idx,
			    								time: opt.start_time,
			    								price:opt.sale_price,
			    								minLOS:opt.minLOS,
			    								cta:opt.cta
			    							}
			    						});
			    					} else	{
			    						tmp.push({
			    							title: name,
			    							start: info.date,
			    							extendedProps: {
			    								reserve:'Y',
			    								option_id:opt.idx,
			    								time: opt.start_time,
			    								price:opt.sale_price,
			    								minLOS:opt.minLOS,
			    								cta:opt.cta
			    							}
			    						});
			    						
			    						soldout = false;
			    					}
			    				}
		    					
		    					if(soldout)	{
		    						events.push({
		    							start: info.date,
		    							extendedProps:	{
		    								soldout:'Y'
		    							}
		    						});
		    					} else	{
			    					for(var j=0; j<tmp.length; j++)	{
			    						events.push(tmp[j]);
			    					}
		    					}
		    				}
		    				
		    				successCallback(events);
		    			}
		    		})
		    	} else	{
		    		callback();
		    	}
		    },
		    eventRender:function(obj)	{
		    	var html = "";
		    	
		    	var year = new Date().getFullYear();
		    	var month = new Date().getMonth() + 1;
		    	var day = new Date().getDate();
		    	var today = new Date(year, month-1, day, 0, 0, 0);
		    	
		    	var weekday = moment(obj.event.start).weekday() == 0 ? ' sun' : (moment(obj.event.start).weekday() == 6 ? ' sat' : ''); 
		    	
	    		var reserve = obj.event.extendedProps.reserve;
	    		var soldout = obj.event.extendedProps.soldout;
	    		if(soldout == 'Y')	{
	    			html += '<p>예약종료</p>';
	    		} else	{
		    		if(reserve == 'Y')	{
	    				html += "<button type='button' class='btn reserve-btn" + weekday + "' data-option='" + obj.event.extendedProps.option_id + "' data-date='" + moment(obj.event.start).format('YYYY-MM-DD') + "'";
	    				if(obj.event.extendedProps.time != null)
	    					html += " data-time='" + obj.event.extendedProps.time+"'";
	    				html += ">";
	    	    		html += "<span class='name'>";
	    	    		html += obj.event.title;
	    	    		html += "</span>";
	    	    		html += "<span class='price hidden'>";
	    	    		html += comma(obj.event.extendedProps.price);
	    	    		html += "</span>";
	    	    		html += "</button>";
	    				$(".fc-day[data-date='" + moment(obj.event.start).format('YYYY-MM-DD') + "']").addClass("possible-day");
		    		} else	{
		    			html += "<button type='button' class='btn reserve-btn soldout" + weekday + "' data-option='" + obj.event.extendedProps.option_id + "' data-date='" + moment(obj.event.start).format('YYYY-MM-DD') + "'";
		    			if(obj.event.extendedProps.time != null)
	    					html += " data-time='" + obj.event.extendedProps.time+"'";
	    				html += ">";
		    			html += "<span class='name'>";
	    	    		html += obj.event.title;
	    	    		html += "</span>";
	    	    		html += "<span class='price hidden'>";
	    	    		html += comma(obj.event.extendedProps.price);
	    	    		html += "</span>";
	    	    		html += "</button>";
		    			$(".fc-day[data-date='" + moment(obj.event.start).format('YYYY-MM-DD') + "']").addClass("soldout-day");
		    		}
	    		}
		    	
		    	return $(html);
		      },
			  weekends: true
		});
		calendar.render();
	}
	
	$(document).on('click','.fc-button.fc-prev-button', function(){
		var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth()+1;
		
		var title = year +'년 ' + zeros(month,2) +'월';
		
		if(title == $(".fc-toolbar.fc-header-toolbar h2").text())	{
			$(this).prop('disabled','disabled');
		}
	});
	
	$("button.fc-prev-button, button.fc-next-button").on("click", function(){
		var cYear = $(".fc-center > h2").text().split(".")[0];
		var cMonth = $(".fc-center > h2").text().split(".")[1];
		
		if(cYear < year || (cYear == year && cMonth <= month))	{
			$("button.fc-prev-button").css("color", "#ccc");
			$("button.fc-prev-button").attr("disabled", true);
		} else	{
			$("button.fc-prev-button").css("color", "#333");
			$("button.fc-prev-button").attr("disabled", false);
		}
	})
	
	$(document).on('change',"#show_price",function(){
		if($(this).is(':checked'))	{
			$(".btn.reserve-btn span.price").removeClass('hidden');
		} else	{
			$(".btn.reserve-btn span.price").addClass('hidden');
		}
	})
	
	$(document).on("click", ".fc-day, .fc-day-number", function(){
		var date = $(this).data("date");
		
		$(".reserve-btn[data-date='" + date + "']").trigger("click");
	})
	
    $(".goods > a").click(function() {
    	var idx = $(this).closest("li").data("idx");
    	location.href="/calendar?c="+c+"&idx="+idx;
    });
	
	if($('.goods-tabs').length > 0 && ($('body')[0].clientWidth - $('.goods-tabs')[0].clientWidth < 0)){
		$(".goods-slider-left").removeClass("hidden");
		$(".goods-slider-right").removeClass("hidden");
		
		$(".goods-slider").slider({
			start:function(event,ui)	{
				$(".goods-slider").data("x", event.clientX);
			},
			slide:function(event,ui)	{
//				console.log("clientX: " + event.clientX + " / offsetX:" + event.offsetX + " / pageX:" + event.pageX + " / screenX:" + event.screenX );
				var x = $(".goods-slider").data("x");
				
				if(x == '')
					x = 0;
				else
					x = Number(x);
				
				var current = $(".goods-slider").data("current");
				
				if(current == '')
					current = 0;
				else
					current = Number(current);
				
				var min = $('body')[0].clientWidth - 70 - $('.goods-tabs')[0].clientWidth;
				
				var value = current + event.clientX - x;
				
				$(".goods-tabs").css("transform","translate(" + (value < 0 ? (value > min ? value : min) : 0) + "px,0)");
			},
			stop:function(event,ui)	{
				var x = $(".goods-slider").data("x");
				
				if(x == '')
					x = 0;
				else
					x = Number(x);
				
				var current = $(".goods-slider").data("current");
				
				if(current == '')
					current = 0;
				else
					current = Number(current);
				
				var min = $('body')[0].clientWidth - $('.goods-tabs')[0].clientWidth;
				
				var value = current + event.clientX - x;
				
				$(".goods-slider").data("current", (value < 0 ? (value > min ? value : min) : 0))
			}
		})
	} else	{
		$(".goods-slider-left").addClass("hidden");
		$(".goods-slider-right").addClass("hidden");
	}
	
	$(document).on('click','.reserve-btn',function(){
		if(!$(this).hasClass('soldout'))	{
			var goods_id = $("#goods_calendar").data('idx')
			var option_id = $(this).data('option');
			var start_date = $(this).data('date');
			var time = $(this).data('time');
			var url = '/calendar/v2/'+goods_id+'/order?option_id='+option_id+'&start_date='+start_date;
			if(time != undefined)
				url += '&time='+time;
			location.href=url;
		}
	})
	
	$(document).on('change','#option_id',function(){
		var goods_id = $("#goods_calendar").data('idx');
		var option_id = $(this).val();
		
		location.href='/calendar/v2/'+goods_id+'/'+option_id;
	})
}( window.jQuery ));

function goodsType() {
	var text = "";
	if (goods_type == 'coupon') {
		text = "goodsList";
	}
	
	return text;
}
