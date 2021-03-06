<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.css" />

<!-- If you use the default popups, use this. -->
<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.css" />

<script src="https://uicdn.toast.com/tui.code-snippet/v1.5.2/tui-code-snippet.min.js"></script>
<script src="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.min.js"></script>
<script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.min.js"></script>
<script src="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>

<style>
#calendar > div > div.tui-full-calendar-floating-layer.tui-view-13 > div > div.tui-full-calendar-popup-container > div:nth-child(3) > div{
	display: none;
}
#calendar > div > div.tui-full-calendar-floating-layer.tui-view-13 > div > div.tui-full-calendar-popup-container > div.tui-full-calendar-popup-section.tui-full-calendar-dropdown.tui-full-calendar-close.tui-full-calendar-section-state > button{
	display: none;
}


</style>
<body>
<br><br><br><br><br><br>

<div id="menu">
      <span id="menu-navi">
        <button type="button" class="btn btn-default btn-sm move-today" data-action="move-today">Today</button>
          <span id="renderRange" class="render-range"></span>
        <button type="button" class="btn btn-default btn-sm move-day" data-action="move-next">
          <i class="calendar-icon ic-arrow-line-right" data-action="move-next">??????</i>
        </button>
      </span>
    
    </div>

<div id="calendar" style="height: 800px;"></div>

<script type="text/javascript">

$(document).ready(function(){
	const today1 = moment();
	let today = new Date();
	var day = today.toLocaleDateString().substr(5,6).split('.');
	var month = parseInt(day[0]); 
	var year = today.toLocaleDateString().substr(0,4);
	
	$("#renderRange").text(year+'???'+month+'???');
	revList();
	
	var templates = {
		    popupIsAllDay: function() {
		      return '????????????';
		    },
		    titlePlaceholder: function() {
		      return '??????';
		    },
		    startDatePlaceholder: function() {
		      return '?????????';
		    },
		    endDatePlaceholder: function() {
		      return '?????????';
		    },
		    popupSave: function() {
		      return '??????';
		    },
		    popupUpdate: function() {
		      return '??????';
		    },
		    popupDetailDate: function(isAllDay, start, end) {
		      var isSameDate = moment(start).isSame(end);
		      var endFormat = (isSameDate ? '' : 'YYYY.MM.DD ') + 'hh:mm a';
		      if (isAllDay) {
		    	  console.log(start);
		        return moment(start).format('YYYY.MM.DD') + (isSameDate ? '' : ' - ' + moment(end).format('YYYY.MM.DD'));
		      }

		      return (moment(start).format('YYYY.MM.DD hh:mm a') + ' - ' + moment(end).format(endFormat));
		    },
		    popupDetailLocation: function(schedule) {
		      return 'Location : ' + schedule.location;
		    },
		    popupDetailUser: function(schedule) {
		      return 'User : ' + (schedule.attendees || []).join(', ');
		    },
		    popupDetailState: function(schedule) {
		      return 'State : ' + schedule.state || 'Free';
		    },
		    popupDetailRepeat: function(schedule) {
		      return 'Repeat : ' + schedule.recurrenceRule;
		    },
		    popupDetailBody: function(schedule) {
		      return 'Body : ' + schedule.body;
		    },
		    popupEdit: function() {
		      return '??????';
		    },
		    popupDelete: function() {
		      return '??????';
		    }
		  };
	var calendar;
	
	//????????? ??????
	function CreateCalendar(){
			calendar = new tui.Calendar(document.getElementById('calendar'), {
		    defaultView: 'month',
		    taskView: true,    // Can be also ['milestone', 'task']
		    scheduleView: false,  // Can be also ['allday', 'time']
		    useCreationPopup : false,
		    useDetailPopup : true,
		    disableClick : false,
		    disableDblClick : true,
		    template: templates,
		    month: {
		        daynames: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
		        startDayOfWeek: 0,
		    },
		});
	}
	//??????????????????
	function revList(){
		var p_id = "${p_id}";
		$("#calendar").empty();
		CreateCalendar();
		$.ajax({
			url : "revsetlist",
			method : "POST",
			dataType : "JSON",
			data : {"p_id" : p_id},
			success : function(result){
				console.log(result);
				for(var i =0;i<result.length;i++){
					
				var id = result[i].id;
				var calendarid = result[i].calendarid;
				var start = result[i].c_start;
				var end = result[i].c_end;
				var time = result[i].c_time;
				var category = result[i].category;
				var title = result[i].title;
				var pid = result[i].p_id;
				var ctime = result[i].c_time;
				var bgColor = result[i].bgColor;
				console.log(bgColor);
				
					calendar.createSchedules([
						{
							id: id,
						    title: title,
						    start: start,
						    end: end,
						    category: category,
						    bgColor : bgColor
						}
					]);
				}
			}
		});
	}

	//??? ?????? ???????????????
	calendar.on('beforeCreateSchedule', scheduleData => {
	  var schedule = {
	    title: scheduleData.title,
	    isAllDay: scheduleData.isAllDay,
	    start: scheduleData.start,
	    end: scheduleData.end,
	    category: scheduleData.isAllDay ? 'allday' : 'time'
	  }
	  console.log(schedule);
  
  //????????? ??? ????????????
  
  //end
  //var end = formatDate(schedule.end._date);
  var end = new Date(schedule.end._date.getTime() - (schedule.end._date.getTimezoneOffset() * 60000)).toISOString().slice(0,10)
  var strEnd = end.slice(0,10);
  console.log(end);
  
  //start
  //var start = formatDate(schedule.start._date);
  var start = new Date(schedule.start._date.getTime() - (schedule.start._date.getTimezoneOffset() * 60000)).toISOString().slice(0,10)
  var strStart = start.slice(0,10);
  console.log("?????????",start.split('-'));
  var reservDate = start.split('-')[0]+start.split('-')[1]+start.split('-')[2]
  console.log("??????????",reservDate);
  if(parseInt(today1.format('YYYYMMDD'))<= parseInt(reservDate)){
	  var flag = confirm("?????????????????????????");
	  var bgColor = "#00CCFF";
	  if(flag == true){
		$.ajax({
			url : "revsetinsert",
			method : "POST",
			data : {"title": '????????????',
				    "c_start": start,
				    "c_end": end,
				    "category":'allday',
				    "bgColor" : bgColor},
			success : function(res){
				console.log(res);
				calendar.createSchedules([
					{
						id: res.id,
					    title: res.title,
					    start: res.c_start,
					    end: res.c_end,
					    category: res.category,
					    bgColor : bgColor
					}
				]);
				toastr.success('????????? ?????????????????????.');
			}
		})
	  }else{
		  toastr.error("?????????????????????.");
	  }
  }else{
	  toastr.error("???????????? ????????????.")
  }
});
 //?????? ???????????????
 calendar.on('beforeUpdateSchedule', function(event) {
    var schedule = event.schedule;
    var changes = event.changes;
    var end,start,category,title;
     
  //????????? ??? ????????????
    //end,start ?????????
    console.log(schedule);
      if(typeof changes.end == 'undefined'){
    	end = null;
    }else{
    	//end = changes.end._date.toISOString().slice(0,16);
    	end = new Date(changes.end._date.getTime() - (changes.end._date.getTimezoneOffset() * 60000)).toISOString().slice(0,10);
    }
    
    if(typeof changes.start =='undefined'){
    	start = null;
    }else{
    	//start = changes.start._date.toISOString().slice(0,16);
    	start = new Date(changes.start._date.getTime() - (changes.start._date.getTimezoneOffset() * 60000)).toISOString().slice(0,10);
    }
    
    if(typeof changes.category =='undefined'){
    	category = null;
    }else{
    	category = changes.category;
    } 
    
    if(typeof changes.title =='undefined'){
    	title = null;
    }else{
    	title = changes.title;
    } 
    
    //end
    
    //start
   // var start = changes.start._date.toISOString();
    /* var strStart = start.slice(0,16);*/
    console.log(changes);
    console.log(start);
	  $.ajax({
		url : "revsetupdate",
		method : "POST",
		data : { "id" : schedule.id ,
				 "c_start": start,
				 "c_end" : end,
				 "title" : title,
				 "category" : category
				},
		success : function(res){
			
		    calendar.updateSchedule(schedule.id, schedule.calendarId, changes);
		    alert("?????? ??????");
			
		}
	})  
});

//?????? ???????????????
calendar.on('beforeDeleteSchedule', scheduleData => {
		  const {schedule, start, end} = scheduleData;
		  schedule.start = start;
		  schedule.end = end;
		  console.log(start);
		 var p_id = "${p_id}";
		  $.ajax({
			  url : 'revsetdelete',
			  method : 'POST',
			  data : {"id" : schedule.id,
				  	  "p_id": p_id},
			  success : function(res){
				  console.log(res)
				  if(res == "ok"){
			  		calendar.deleteSchedule(schedule.id, schedule.calendarId);
			  		alert("?????? ??????????????? ?????????????????????.");
				  }else if(res ="no"){
					  alert("??????????????? ?????? ???????????? ????????????.");
				  }
			  }
		  })
	});
 
	//?????? ???????????? ?????? ?????????
	$(".ic-arrow-line-left").on('click',function(event){
		month = month-1;
		if(month == 0){
			year = parseInt(year)-1;
			month = 12;
		}
		calendar.prev();
		$("#renderRange").text(year+'???'+month+'???');
		
	});
		//?????? ???????????? ?????? ?????????
	$(".ic-arrow-line-right").on('click',function(event){
		month = month+1;
		if(month == 13){
			year = parseInt(year)+1;
			month = 1;
		}
		calendar.next();
		$("#renderRange").text(year+'???'+month+'???');
	});
	//?????? Today ?????? ?????????
	$(".move-today").on('click',function(event){
		calendar.today();
 		day = today.toLocaleDateString().substr(5,6).split('.');
 		month = parseInt(day[0]); 
 		year = today.toLocaleDateString().substr(0,4);
 		$("#renderRange").text(year+'???'+month+'???');
	});

 });
 </script>
</body>
</html>