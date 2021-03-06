<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

<link rel="stylesheet" href="resources/assets/css/nice-select.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
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
.table td{
 font-size: 13px;
}
input:disabled {
  background: black;
}
.disabled-radio{
	text-decoration: line-through;
}

#menu{
	margin-left: 80px;
	font-family: 'Binggrae';
}

#calendar{
	margin-left: 80px;
	font-family: 'Binggrae';
}

#tableDiv{
	font-family: 'Binggrae';
}

</style>
<body>
<br><br><br><br><br><br>
 <div id="menu">
      <span id="menu-navi">
        <!-- <button type="button" class="btn btn-default btn-sm move-day" data-action="move-prev">
          <i class="calendar-icon ic-arrow-line-left" data-action="move-prev">??????</i>
        </button> -->
        <button type="button" class="btn btn-default btn-sm move-today" data-action="move-today">Today</button>
          <span id="renderRange" class="render-range"></span>
        <button type="button" class="btn btn-default btn-sm move-day" data-action="move-next">
          <i class="calendar-icon ic-arrow-line-right" data-action="move-next">??????</i>
        </button>
      </span>
    
    </div>

    <div id="calendar" style ="width: 40%; display: inline-block;"></div>
    <div style="width: 20px; height: 600px; display: inline-block;" ></div>
  
  <div id="tableDiv" style ="height: 608px; display: inline-block;">  
	<table class="table" style="width : 95%;">
		<thead>
             <tr>
                <th style="width: 100px; font-family: 'Binggrae';">??????????????????</th>
                <th colspan="10" style= "width: 670px; font-family: 'Binggrae';" align="left">????????????</th>
             </tr>
        </thead>
        <tbody>
        	<tr>
        		<td colspan="2" align="center"><h3 style="font-weight: bold;">???????????? ????????? ??????????????????</h3></td>
        	</tr>
        </tbody>
	</table>
	<div id="reservbutton" style = "float: right;">
	</div>
</div>
	
					<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="exampleModalLabel" style="font-family: 'Binggrae';">????????????</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<!-- modal ?????? -->
			<div class="modal-body" style="font-family: 'Binggrae';">
				<form>
				 <span id="dvalue"><input type ="hidden" id="date_value" ></span> <br>
				 <span id="tvalue"><input type ="hidden" id="time_value"></span> <br>
				 <span> ????????????(??????)   : <input type="text" id ="r_content" placeholder="?????? ??????" style="font-size: 15px; "></span><br>
				 <input type="hidden" id = "AutoCode" >
		   		 
		   		 <select class="animalNo" onchange="NoSelection(event)">
		   		 	<option value="" disabled selected  >??? ??????</option>
					 <c:forEach items="${petList}" var="pet">
					 	<c:forEach items="${careList }" var="careList" >
						 		<c:if test="${pet.code eq careList.code }"> 
			   		 				<option value="${pet.pet_no }">${pet.name }</option>
			   		 			</c:if>
		   		 			</c:forEach>
		   		 	   </c:forEach>
		   		 </select>
		   		 </form>
			</div>
			<!-- modal ?????? ?????? -->
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-dismiss="modal">??????</button>
				<button id="sendReserv" name="sendReserv" type="button"
					class="btn btn-primary" data-dismiss="modal">????????????</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

$(document).ready(function(){
	
	var today = new Date();
	var day = today.toLocaleDateString().substr(5,6).split('.');
	var month = parseInt(day[0]); 
	var year = today.toLocaleDateString().substr(0,4);
	var hours = today.getHours();
	
	var nowDate = year+"-"+month+"-"+parseInt(day[1]);
	var nowTime = hours+"???"
	
	$("#renderRange").text(year+'???'+month+'???');
	revList();
	
	var p_id="${pmember.p_id}";
	//?????? ?????????
	var templates = {
		    popupIsAllDay: function() {
		      return 'All Day';
		    },
		    titlePlaceholder: function() {
		      return 'Subject';
		    },
		    startDatePlaceholder: function() {
		      return 'Start date';
		    },
		    endDatePlaceholder: function() {
		      return 'End date';
		    },
		    popupDetailDate: function(isAllDay, start, end) {
		      var isSameDate = moment(start).isSame(end);
		      var endFormat = (isSameDate ? '' : 'YYYY.MM.DD ') + 'hh:mm a';
		      if (isAllDay) {
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
		      return 'Edit';
		    },
		    popupDelete: function() {
		      return 'Delete';
		    }
		  };
	var calendar;
	//????????? ??????
	function CreateCalendar(){
			calendar = new tui.Calendar(document.getElementById('calendar'), {
		    defaultView: 'month',
		    scheduleView: false,  // Can be also ['allday', 'time']
		    disableClick : true,
		    disableDblClick : true,
		    isReadOnly : false,
		    isAlways6Week : false,
		    template: templates,
		    month: {
		        daynames: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
		        startDayOfWeek: 0,
		    }
		});
	}
	
	//????????????
	function revList(){
		p_id = "${pmember.p_id}";
		
		$("#calendar").empty();
		CreateCalendar();
		$.ajax({
			url : "revsetlist",
			method : "POST",
			data : {"p_id" : p_id},
			dataType : "JSON",
			success : function(result){
				if(result.length== 0){
					alert("?????? ??????????????? ????????????.");
					history.back();
				}
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
	

	//?????? ?????? ??? ?????????????????? ????????? ??????
	calendar.on('clickSchedule', function(event) {
		var today = new Date();
		var day = today.toLocaleDateString().substr(5,6).split('.');
		var month = parseInt(day[0]); 
		var year = today.toLocaleDateString().substr(0,4);
		var hours = today.getHours();
		var nowDate = year+"-"+month+"-"+parseInt(day[1]);
		var nowTime = hours+"???"
		
		var title = event.schedule.title;
		if ( title=='????????????'){
			$(".table tbody").empty();
			$("#reservbutton").empty();
		}else{
			var id = event.schedule.id;
			$.ajax({
				url : 'revSetUpdateSelect',
				method : 'POST',
				data : {"id" :id},
				success : function(res){
					p_id = res.schedule.p_id;
					$(".table tbody").empty();
					$("#reservbutton").empty();
					var i=0;
					var $tbody,tdval;
					var len = res.schedule.c_end.replaceAll('-','')-res.schedule.c_start.replaceAll('-','')+1;
					var split = res.schedule.c_start.split('-');
	
					var sp2 = split[2]
					var ab = String(parseInt(split[2]));
					//????????? - ????????? +1 ??? ???????????? ??????
					for( i; i<len;i++){
			               var ex = ((parseInt(sp2))+i);
			               if(ex.toString().length == 1){
			                  tdval = split[0]+'-'+split[1]+'-0';
			               }else{
			                  tdval = split[0]+'-'+split[1]+'-';
			               }
			              
			               $tbody =` 
			                  <tbody>
			                        <tr>
			                           	<td class="tdvalCheck">`+tdval+ex+`</td>
										<td><input  type="radio" name="selectTime" value="09???">09:00~10:00</td>
										<td><input  type="radio" name="selectTime" value="10???">10:00~11:00</td>
										<td><input  type="radio" name="selectTime" value="11???">11:00~12:00</td>
										<td><input  type="radio" name="selectTime" value="14???">14:00~15:00</td>
										<td><input  type="radio" name="selectTime" value="15???">15:00~16:00</td>
										<td><input  type="radio" name="selectTime" value="16???">16:00~17:00</td>
										<td><input  type="radio" name="selectTime" value="17???">17:00~18:00</td>
									</tr>
									
							</tbody> `;
							if(nowDate == split[0]+'-'+parseInt(split[1])+"-"+ex){
								if(parseInt(nowTime) <= 9){
									$tbody = ` 
						                  <tbody>
						                        <tr>
						                          	<td class="tdvalCheck">`+tdval+ex+`</td>
													<td><input type="radio" name="selectTime" value="10???">10:00~11:00</td>
													<td><input type="radio" name="selectTime" value="11???">11:00~12:00</td>
													<td><input type="radio" name="selectTime" value="14???">14:00~15:00</td>
													<td><input type="radio" name="selectTime" value="15???">15:00~16:00</td>
													<td><input type="radio" name="selectTime" value="16???">16:00~17:00</td>
													<td><input type="radio" name="selectTime" value="17???">17:00~18:00</td>
												</tr>
										</tbody> `;
								}else if (parseInt(nowTime) <= 10){
									$tbody = ` 
						                  <tbody>
						                        <tr>
						                          	<td class="tdvalCheck">`+tdval+ex+`</td>
													<td><input type="radio" name="selectTime" value="11???">11:00~12:00</td>
													<td><input type="radio" name="selectTime" value="14???">14:00~15:00</td>
													<td><input type="radio" name="selectTime" value="15???">15:00~16:00</td>
													<td><input type="radio" name="selectTime" value="16???">16:00~17:00</td>
													<td><input type="radio" name="selectTime" value="17???">17:00~18:00</td>
												</tr>
										</tbody> `;
								}else if (parseInt(nowTime) <= 12){
									$tbody = ` 
						                  <tbody>
						                        <tr>
						                           	<td class="tdvalCheck">`+tdval+ex+`</td>
													<td><input  type="radio" name="selectTime" value="14???">14:00~15:00</td>
													<td><input  type="radio" name="selectTime" value="15???">15:00~16:00</td>
													<td><input  type="radio" name="selectTime" value="16???">16:00~17:00</td>
													<td><input  type="radio" name="selectTime" value="17???">17:00~18:00</td>
												</tr>
										</tbody> `;
								}else if (parseInt(nowTime) <= 14){
									$tbody = ` 
						                  <tbody>
						                        <tr>
					                           		<td class="tdvalCheck">`+tdval+ex+`</td>
													<td><input  type="radio" name="selectTime"  value="15???">15:00~16:00</td>
													<td><input  type="radio" name="selectTime"  value="16???">16:00~17:00</td>
													<td><input  type="radio" name="selectTime"  value="17???">17:00~18:00</td>
												</tr>
										</tbody> `;
								}else if (parseInt(nowTime) <= 15){
									$tbody = ` 
						                  <tbody>
						                        <tr>
					                           		<td class="tdvalCheck">`+tdval+ex+`</td>
													<td><input  type="radio" name="selectTime"  value="16???">16:00~17:00</td>
													<td><input  type="radio" name="selectTime"  value="17???">17:00~18:00</td>
												</tr>
										</tbody> `;
								}else if (parseInt(nowTime) <= 16){
									$tbody = ` 
						                  <tbody>
						                        <tr>
						                           	<td class="tdvalCheck">`+tdval+ex+`</td>
													<td><input  type="radio" name="selectTime"  value="17???">17:00~18:00</td>
												</tr>
										</tbody> `;
								}else if(parseInt(nowTime) <= 17 || parseInt(nowTime) <= 18 || parseInt(nowTime) <= 19 || parseInt(nowTime) <= 20 || parseInt(nowTime) <= 21 ||parseInt(nowTime) <= 22 || parseInt(nowTime) <= 23) {
									$tbody = ` 
						                  <tbody>
						                        <tr>
						                           	<td class="tdvalCheck">`+tdval+ex+`</td>
						                           	<td>??????????????? ???????????? ????????????.</td>
												</tr>
										</tbody> `;
								}
							}
						$(".table").append($tbody);
						}
						$("#reservbutton").append(`<button onclick="reservModal(event)" id="reservModal" type="button" class="btn btn-secondary"
							  	data-toggle="modal" data-target="#exampleModal">??????</button>`);
						for(var i=0; i<res.timeList.length;i++){
							$('.tdvalCheck:contains("'+res.timeList[i].reserv_date+'")').parent().find("[value='"+res.timeList[i].reserv_time+"']").attr('disabled',true);
							$('.tdvalCheck:contains("'+res.timeList[i].reserv_date+'")').parent().find("[disabled='disabled']").parent().attr('class','disabled-radio');
							
						}
				}//ajax success ??????
			})
		}
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
 	})
});

//????????? ?????? ??? ????????????/?????? ??????
function changeSelection(event){
	var reserv_time = $(event.target).val();
	var tdvalue = $(event.target).parent().prev().text();
	console.log("???????????????",reserv_time,"???????????????",tdvalue)
	var p_id = "${pmember.p_id}";
	$("#dvalue").text('????????? : ' + tdvalue);
	$("#tvalue").text('???????????? : ' + reserv_time);
	$.ajax({
		url : 'reservcount',
		method : 'POST',
		data : {"reserv_date": tdvalue,
				"reserv_time": reserv_time,
				"p_id" : p_id},
		success : function(res){
			if((res.reserv_date != null && res.reserv_time != null)){
				$(event.target).parent().next().text('????????????');
			}else{
				$(".selectTime").parent().next().text('');
				$(event.target).parent().next().append(`<button id="reservModal" type="button" class="btn btn-secondary"
					  	data-toggle="modal" data-target="#exampleModal">??????</button>`);
			}
		}
	})
}

function NoSelection(event){
	var pet_no = $(event.target).val();
	$.ajax({
		url : "autoCode",
		method : "POST",
		data : {"pet_no" : pet_no},
		success : function(res){
			$("#AutoCode").val(res);
		}
	})
}

//????????? ??? ?????????
$("#sendReserv").on('click',function(){
	
	$("#exampleModal").modal('hide');
	//????????? ????????????
	var date_value = $("#dvalue").text().slice(6);
	console.log ("????????????",date_value);
	//????????? ????????????
	var time_value = $("#tvalue").text().slice(7);
	console.log("????????????",time_value);
	//????????? ??????
	var r_content = $("#r_content").val();
	//????????? ????????????
	var animalType = $(".animalType option:selected").val();
	if(r_content == '' || animalType == ''){
		toastr.error('??????????????? ??? ????????? ??????????????????.');
	}
	//???????????????????????????
	var p_id = "${pmember.p_id}";
	//?????????
	var pet_no = $(".animalNo option:selected").val();
	
	//??????????????? ????????????
	var code = ${pmember.code};
	
	
	$.ajax({
		url : 'reservinsert',
		method : 'POST',
		data : {"r_date" : date_value,
				"time" : time_value,
				"rcontent" : r_content,
				"r_code" : animalType,
				"pet_no" : pet_no,
				"p_id" : p_id
				},
		success : function(res){
			toastr.success("??????????????? ?????????????????????.");
			$(".table tbody").empty();
			$("#reservbutton").empty();
			
		},
		
	})
})
$('#exampleModal').on('hidden.bs.modal', function(e) {
         $(this).find('form')[0].reset();
         $(".current").text("?????????(??????)");
})
function reservModal(event){
	
	var reserv_time = $('input[name=selectTime]:checked').val();
	var tdvalue = $('input[name=selectTime]:checked').parent().parent().children().first().text();
	console.log("???????????????",reserv_time,"???????????????",tdvalue)
	var p_id = "${pmember.p_id}";
	if(reserv_time =='undefined' || tdvalue ==''){
		toastr.error("??????????????? ??????????????????");
		$("#exampleModal").attr("id","noexam");
		return;
	}else{
		$("#noexam").attr("id","exampleModal");
		$("#dvalue").text('????????? : ' + tdvalue);
		$("#tvalue").text('???????????? : ' + reserv_time);
	}
	if("${fn:length(petList)}"=="0"){
		toastr.error("????????? ??????????????? ?????? ???????????? ????????????.");
		$("#exampleModal").attr("id","noexam");
	}
}



 </script>
</body>
</html>