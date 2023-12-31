<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
.previewImg {
    width: 20%;
    height: 20%;
    object-fit: cover; 
}
select {
    -webkit-appearance: menulist !important; 
    -moz-appearance: menulist !important;
    appearance: menulist !important;
}
</style>

<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://cdn.ckeditor.com/4.16.1/basic/ckeditor.js"></script>
<title>新增專欄文章</title>

<%--  include --%>
	<jsp:include page="/backend/backIndex/head.jsp"></jsp:include>
  
</head>

<body>

	<jsp:include page="/backend/backIndex/header.jsp"></jsp:include>
	<div class="container-fluid my-0">
	<div class="row">
	  
	<div class="col-lg-2 g-3 my-0">
	<jsp:include page="/backend/backIndex/sidebar.jsp"></jsp:include>
	</div>
	
	<div class="col-lg-10 g-2 transparent rounded my-0">
	
<%-- include end--%>

<div class="table-list">

	<div class="container mt-5">
		<h5>新增專欄文章</h5>
		<form action="<%=request.getContextPath()%>/columnmg/add"
			method="post" enctype="multipart/form-data">
			<div class="row">
				<!-- 類型 -->
				<!-- 關聯表格說明，三個變數，itmes是servlet傳來的list、option value為其元素值、第三個為出現在選單的文字-->
				<!-- forEach的var跟option的是有關連的，取自於其forEach遍歷的資料 -->
				<div class="form-group col-md-6">
					<label for="colTypeId">專欄類型</label> <select name="colTypeId"
						id="colTypeId" class="form-control" required>
						<option value="">請選擇專欄類型</option>
						<c:forEach var="typeItem" items="${columnTypes}">
							<option value="${typeItem.colTypeId}">${typeItem.colTypeName}</option>
						</c:forEach>
					</select>
				</div>
				<!-- 文章標題 -->
				<div class="form-group col-md-6">
					<label for="artiTitle">文章標題</label> <input type="text"
						class="form-control" id="artiTitle" name="artiTitle" required>
				</div>
				<!-- 專欄圖片 獨立一行-->
				<div class="form-group col-md-6">
					<label for="columnImage">文章主圖</label> <input type="file"
						class="form-control-file" id="colImg" name="colImg" required
						onchange="previewImage(event)">
				</div>

				<div class="form-group col-md-6">
					<label>圖片預覽</label>
					<div id="imagePreview"></div>
				</div>
				<!-- 文章內容 獨立一行-->
				<div class="form-group col-md-12">
					<label for="artiContent">描述</label>
					<textarea class="form-control" id="artiContent" name="artiContent"
						rows="4" required></textarea>
					<script>
						CKEDITOR.replace('artiContent');
					</script>
				</div>
				<!-- 上下架狀況 -->
				<div class="form-group col-md-6">
					<label>上下架</label><br> <input type="radio" id="on"
						checked="true" name="artiStatus" value="1"> <label
						for="on">上架</label> <input type="radio" id="off" name="artiStatus"
						value="0"> <label for="off">未上架</label>
				</div>
				<!-- 發文管理者 -->
				<div class="form-group col-md-6">
					<label for="adminId">發文者</label> <select name="adminId"
						id="adminId" class="form-control" required>
						<option value="adminId">發文管理者</option>
						<c:forEach var="adminItem" items="${admins}">
							<option value="${adminItem.adminId}">${adminItem.adminName}</option>
						</c:forEach>
						</select>
				</div>
			</div>

			<button type="submit" class="btn btn-primary" name="action">送出</button>
		</form>
	</div>

			</div>
<%--  include --%>	
		</div>
	</div>		
</div>
<%--  include end --%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
	function previewImage(event) {
		var file = event.target.files[0];
		if (file) {
			var reader = new FileReader();
			reader.onload = function(e) {
				var imagesPreview = document
						.getElementById('imagePreview');

				// div容器，圖片和刪除按鈕
				var container = document.createElement('div');
				container.className = 'imageContainer';

				var img = document.createElement('img');
				img.src = e.target.result;
				img.className = 'previewImg';
				container.appendChild(img);

				var deleteButton = document.createElement('div');
				deleteButton.innerText = 'x';
				deleteButton.className = 'deleteIcon';
				deleteButton.onclick = function() {
					imagesPreview.removeChild(container);
				};
				container.appendChild(deleteButton);

				imagesPreview.appendChild(container);
			}
			reader.readAsDataURL(file);
		}
	}
</script>
</body>
</html>
