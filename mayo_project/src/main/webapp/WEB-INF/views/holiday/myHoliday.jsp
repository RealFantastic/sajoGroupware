<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 연차현황</title>
	<!-- 부트스트랩 -->
	<link 
		rel="stylesheet" 
		href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" 
		integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" 
		crossorigin="anonymous">
	<script 
		src="https://code.jquery.com/jquery-3.5.1.slim.min.js" 
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" 
		crossorigin="anonymous"></script>
	<script 
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" 
		crossorigin="anonymous"></script>
	<!-- J쿼리 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	
	<link href="<%=request.getContextPath()%>/resources/css/holiday.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/reset.css" rel="stylesheet">

	<jsp:include page="/WEB-INF/views/template_header.jsp"/>
</head>
<body>
	<script type="text/javascript">
	//현재시간  https://stickode.tistory.com/124 
		function setClock(){
		    var dateInfo = new Date(); 
		    var hour = modifyNumber(dateInfo.getHours());
		    var min = modifyNumber(dateInfo.getMinutes());
		    var sec = modifyNumber(dateInfo.getSeconds());
		    var year = dateInfo.getFullYear();
		    var month = dateInfo.getMonth()+1; //monthIndex를 반환해주기 때문에 1을 더해준다.
		    var date = dateInfo.getDate();
		    document.getElementById("time").innerHTML = hour + ":" + min  + ":" + sec;
		    document.getElementById("date").innerHTML = year + "년 " + month + "월 " + date + "일";
		}
		function modifyNumber(time) {
			if(parseInt(time)<10){
				return "0"+time;
			}else{
				return time;
			}
		}
		window.onload=function(){
			setClock();
			setInterval(setClock,1000); //1초마다 setClock 함수실행
		}
	</script>
	
	<div class="left_bar">
		<div class="left_bar_img">
			<img alt="" src="">
			이미지 자리<br>
			이미지 자리<br>
			이미지 자리<br>
			이미지 자리<br>
			이미지 자리<br>
			이미지 자리<br>
		</div>
		<div>
			<div id="date" class="left_bar_date font3"></div>
			<div id="time" class="left_bar_time font6"></div>
		</div>
		<div class="left_bar_btn">
			<button class="btn_green btn_attendance">출근</button>
			<button class="btn_green btn_leave">퇴근</button>
<!-- 			<button class="btn_green btn_off">근무 외 시간</button> -->
		</div>
		<div>
		달력 자리<br>
		달력 자리<br> 
		달력 자리<br>
		달력 자리<br>
		달력 자리<br>  
		<!-- 혜리니자리 -->
		</div>
	</div>



	<div class="left_bar_exception">
	
		<div class="holiday_list font4">나의 연차현황</div>
		
		<div>
			<div>
				그래프 자리
			</div>
			<div>
				조회날짜 자리
			</div>
			<div>
				사원번호 :  사원명 :  직함 :  <br>
				부서명 :  연락처 :  
			</div>
		</div>

	
		
		<div class="table_all">
			<table class="holiday_table">
				<colgroup>
					<col width="15%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					<col width="20%">
					<col width="20%">
				</colgroup>
				<thead>
					<tr>
						<th class="holiday_table_list_th font2">연차 신청일</th>
						<th class="holiday_table_list_th font2">연차 시작일</th>
						<th class="holiday_table_list_th font2">연차 종료일</th>
						<th class="holiday_table_list_th font2">연차 일수</th>
						<th class="holiday_table_list_th font2">연차 잔여일수</th>
						<th class="holiday_table_list_th font2">비고</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
		</div>
	</div>
</body>
</html>