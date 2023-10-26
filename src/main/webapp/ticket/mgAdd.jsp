<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<title>新增票券</title>

<script>
	function previewImage(event) {
		var reader = new FileReader();
		reader.onload = function() {
			var output = document.getElementById('imagePreview');
			output.src = reader.result;
			output.style.display = "block";
		};
		reader.readAsDataURL(event.target.files[0]);
	}
</script>

<style>
        body, label {
            font-size: 0.875rem; /* 調整字體大小，您可以根據需要修改這個值 */
            line-height: 1.5; /* 調整行距，您可以根據需要修改這個值 */
        }

        h1 {
            white-space: nowrap; /* 防止標題斷行 */
            font-size: 1.5rem; /* 如果您覺得標題太大，也可以稍微調小 */
            overflow: hidden; /* 為了避免在某些極端情況下的布局問題 */
            text-overflow: ellipsis; /* 如果標題過長，用省略號表示 */
        }

        .form-control, .btn { /* 可選：如果您想要同時縮小表單控件和按鈕的大小 */
            font-size: 0.875rem;
        }
</style>
</head>
<body>
	<div class="container mt-5">
		<div class="container mt-5">
			<div class="container mt-5">
				<h1>新增票券</h1>
				<form action="<%= request.getContextPath()%>/backendticket/mgadd" method="post" enctype="multipart/form-data">
					<div class="row">

						<!-- 類型 -->
						<!-- 關聯表格說明，三個變數，itmes是servlet傳來的list、option value為其元素值、第三個為出現在選單的文字-->
						<!-- forEach的var跟option的是有關連的，取自於其forEach遍歷的資料 -->
						<div class="form-group col-md-6">
						    <label for="ticketTypeId">票券類型</label>
						    <select name=ticketTypeId id="ticketTypeId" class="form-control"> 
						        <option value="">請選擇票券類型</option>
						        <c:forEach var="typeItem" items="${ticketTypes}">
						            <option value="${typeItem.ticketTypeId}">${typeItem.typeName}</option>
						        </c:forEach>
						    </select>
						</div>

						<!-- 票券名稱 -->
						<div class="form-group col-md-6">
							<label for="ticketName">票券名稱</label> <input type="text"
								class="form-control" id="ticketName" name="ticketName">
						</div>

						<!-- 價格 -->
						<div class="form-group col-md-6">
							<label for="price">價格</label> <input type="number"
								class="form-control" id="price" name="price">
						</div>

						<!-- 數量 -->
						<div class="form-group col-md-6">
							<label for="stock">數量</label> <input type="number"
								class="form-control" id="stock" name="stock">
						</div>


						<div class="row">
						<!-- 圖片上傳 -->
							<div class="form-group col-md-6">
								<label for="ticketImage">圖片</label> <input type="file"
									class="form-control-file" id="ticketImage" name="ticketImage"
									onchange="previewImage(event)">
							</div>

						<!-- 圖片預覽 -->
							<div class="form-group col-md-6">
								<label>圖片預覽</label> <img id="imagePreview" src="#" alt="圖片預覽"
									style="max-width: 100%; max-height: 300px; display: none;" />
							</div>
						</div>

						<!-- 是否為主圖 -->
						<div class="form-group col-md-6">
						    <label for="isMainImage">是否為主圖</label>
						    <input type="checkbox" id="isMainImage" name="isMainImage" value="1">
						</div>

						<!-- 使用天數 -->
						<div class="form-group col-md-12">
							<label for="validDays">使用天數</label> <input type="text"
								title="請輸入數字，例如: 365"
								class="form-control" id="validDays" name="validDays">
						</div>

						<!-- 描述 -->
						<div class="form-group col-md-12">
							<label for="description">描述</label>
							<textarea class="form-control" id="description"
								name="description" rows="4"></textarea>
						</div>

						<!-- 區域 -->
						<div class="form-group col-md-6">
						    <label for="cityId">區域</label> 
						    <select name="cityId" id="cityIdhhshs" class="form-control">
						        <option value="">請選擇縣市</option>
						        <c:forEach var="cityItem" items="${cities}">
						            <option value="${cityItem.cityId}">${cityItem.cityName}</option>
						        </c:forEach>
						    </select>
						</div>

						<!-- 地址 -->
						<div class="form-group col-md-6">
							<label for="address">地址</label> <input type="text"
								class="form-control" id="address" name="address">
						</div>

						<!-- 經度 -->
						<div class="form-group col-md-6">
							<label for="longitude">經度</label> <input type="text"
								class="form-control" id="longitude" name="longitude">
						</div>

						<!-- 緯度 -->
						<div class="form-group col-md-6">
							<label for="latitude">緯度</label> <input type="text"
								class="form-control" id="latitude" name="latitude">
						</div>

						<!-- 上下架狀況 -->
						<div class="form-group col-md-6">
							<label>上下架</label><br> <input type="radio" id="on" checked="true"
								name="status" value="1"> <label for="on">上架</label>

							<input type="radio" id="off" name="status" value="0">
							<label for="off">未上架</label>
						</div>
					</div>

					<button type="submit" class="btn btn-primary" name="action" >送出</button>
				</form>
			</div>
    			


			<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
			<script
				src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
			<script
				src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>