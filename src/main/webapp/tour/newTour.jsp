<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
	<jsp:include page="../indexpage/head.jsp" />
	<title>新增新行程</title>
	<style>
		label {
			font-weight: bold;
			color: #008CBA;
        	font-family: Arial, sans-serif; /* 設置字體 */
		}
		
		.form-container {
			display: flex; 
			margin-top: 4px;
		}
		
		.left-div {
			flex: 1; 
			padding-top: 10px;
		}
		
		.right-div {
			flex: 1;
			padding: 10px;
		}
		
		#tripDuration {
		    font-weight: bold;
		    color: #008CBA;
		    margin-top: 4px;
		     align-items: center;
		    
		}
		
		#tripDurationSelect {
		    margin-left: 10px;
		}
		
		#attractions {
			margin: 10px 0;
			border: 1px solid #ccc;
			padding: 10px;
			border-radius: 5px;
		}
		
		#newTour {
			background-color: #008CBA;
			color: #fff;
			padding: 10px 20px;
			border: none;
			cursor: pointer;
			margin-top: 10px;
			align-items: center;
			display: block; /* 將按鈕轉換為塊級元素，以便居中 */
    		margin: 0 auto; /* 上下不設邊距，左右自動居中 */
		}
		
		button:hover {
			background-color: #006688;
		}
		
		input[type="text"], input[type="date"] {
			width: 98%;
			padding: 10px;
			margin: 5px 0;
			border: 1px solid #ccc;
			border-radius: 5px;
		}
		
		h1 {
			font-size: 24px;
/* 			color: #008CBA; */
			text-align: center;
			margin: 20px;
/* 			style="font-size: 24px; color: #333; text-align: center;" */
		}
		
		form {
			width: 65%; 
			margin: 0 auto;
			background-color: #fff;
			padding: 20px;
			border-radius: 5px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		}
		
		.circle {
			width: 21px;
			height: 21px;
			border-radius: 50%;
			background-color: lightskyblue;
			margin-top: -8px;
			margin-left: 5px;
		}
		
		.plus {
			color: white;
			font-size: 15px;
			font-weight: bold;
			margin-top: -1px;
			margin-left: 1px;
		}
		
		.circle2 {
			width: 21px;
			height: 21px;
			border-radius: 50%;
			background-color: lightcoral;
			margin-top: -40px;
			margin-right: 10px;
		}
		
		.new {
		    display: flex;
		    align-items: center;
		}
		
		/* 调整时间输入框的样式 */
/* 		.new-input-container input[type="time"] { */
/* 		    margin-right: 10px; */
/* 		} */
		

		/*覆蓋之前的input type=text*/
		#newAttraction {
			margin: 5px 25px 5px 0;
		}
		li {
			list-style: none;
		}
		div.row{
			line-height : 1;
		}
		
		
	</style>
</head>
<body>
<%
//     Integer memId = (Integer) session.getAttribute("memId");
//     if(memId == null) {
//         // 如果 session 中沒有 memId，這裡可以添加處理邏輯，例如重新導向到登入頁面
//         response.sendRedirect("${pageContext.request.contextPath}/login.jsp");
//         return;
//     }
%>
	<jsp:include page="../indexpage/header.jsp" />
	<jsp:include page="../indexpage/headpic.jsp" />
	<h1 >旅遊行程列表新增</h1>
	
	<form action="${pageContext.request.contextPath}/tr/save" method="post" id="form">
	<!-- 	存會員編號 -->
	<input type="hidden" name="memId" value="${memId}">
		<div>
			<label for="tourName">行程名稱:</label>
			<input type="text" name="tourName" value="${tr.tourName}" required><br><br>
		</div>	
	
		<div style="margin-top: 10px">
			<label for="tourDescription">為你規劃的行程寫下簡介吧!</label>
			<br>
		</div>
		<textarea rows="2" cols="101" name="tourDescription" ></textarea>
		<br>
		
<!-- 		下拉式選單:行程類型 -->
		<label style="margin-top: 20px;">選擇旅遊行程類型 :</label>
  		<select name="tourType" id="tourType" style="margin-left: 10px; border-radius: 10px;">
	  		<c:forEach var="tourType" items="${list}">
	            <option value="${tourType.tourTypeId}">${tourType.tourTypName}</option>
	        </c:forEach>
  		</select>
		
		<div class="form-container">
			<div class="left-div">
				<label for="startDate">出發日期:</label>
				<input type="date" name="startDate" required onchange="updateDurationSelect()">
			</div>
			
		<div class="right-div">
				<label for="endDate">結束日期:</label>
				<input type="date" name="endDate" required onchange="updateDurationSelect()">
			</div>
		</div>

		<label for="tripDuration" id="tripDuration">總天數:</label>
		<br><br>	
		
		<div class="tourdays" id="tourdays">
		</div>
		
<!-- 		讓總天數也可以傳到servlet -->
		<div>
			<input type="hidden" name="tripDuration" id="tripDurationInput" value="">
			<input type="submit" name="newTour" id="newTour" value="進行下一步" >
		</div>
	</form>

	<script>
	// 更新日期及計算天數
	function updateDurationSelect() {
		var startDateInput = document.querySelector("input[name='startDate']");
		var endDateInput = document.querySelector("input[name='endDate']");
		var tripDuration = document.getElementById("tripDuration");
		//	    var selectedDays = document.getElementById("selectedDays");
		var tourdays = document.getElementById("tourdays");
		var tripDurationInput = document.getElementById("tripDurationInput");

		if (startDateInput.value && endDateInput.value) {
			var startDate = new Date(startDateInput.value);
			var endDate = new Date(endDateInput.value);

			var timeDiff = Math.abs(endDate - startDate);
			var daysDifference = Math.ceil(timeDiff / (1000 * 3600 * 24) + 1);

			tripDuration.innerText = "總天數: 共 " + daysDifference + " 天";
			tripDurationInput.value = daysDifference;

			// 清除先前的 tourdays 内容
			tourdays.innerHTML = "";

		} else {
			tripDuration.innerText = "總天數:";
			tourdays.innerHTML = ""; // 清除 tourdays 内容
		}
	}
	// 添加日期選擇框的事件監聽器
	document.querySelector("input[name='startDate']").addEventListener("change", updateDurationSelect);
	document.querySelector("input[name='endDate']").addEventListener("change", updateDurationSelect);
	</script>
	<jsp:include page="../indexpage/footer.jsp" />
</body>
</html>