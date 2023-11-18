<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"	href="<c:url value='/static/css/backendlist.css'/>">

<title>景點列表</title>
<style>
 .table-hover tbody tr:hover {
     background-color: #f5f5f5;
 }
</style>
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
 <div class="col-lg-10 g-2 transparent rounded my-0">
   <div class="table-list">
	<h5>搜尋結果</h5>
     <div class="container mt-5">
         <!-- 判斷 list 是否為空 -->
         <c:choose>
             <c:when test="${not empty list}">
		<!-- 表格 -->
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>景點編號</th>
					<th>景點類型</th>
					<th>圖片</th>
					<th>景點名稱</th>
					<th>描述</th>
					<th>地址</th>
					<th>狀態</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<!-- 所有資料 -->
				<c:forEach var="attr" items="${list}" varStatus="status">
						<td>${attr.attractionsId}</td>
						<td>${attr.attractionsTypeId.typeName}</td>
						<td><img
							src="<%=request.getContextPath()%>/attractionsImage?attractionsId=${attr.attractionsId}"
							alt="Main Image"></td>
						<td>${attr.attractionsName}</td>
						<td><c:choose>
								<c:when test="${fn:length(attr.description) > 30}">
								${fn:substring(attr.description,0,30)}...
								</c:when>
								<c:otherwise>
								${attr.description}
								</c:otherwise>
							</c:choose></td>
						<td>${attr.address}</td>
						<td><c:choose>
								<c:when test="${attr.attractionsStatus == 0 }">上架</c:when>
								<c:otherwise>未上架</c:otherwise>
							</c:choose></td>
						<td>
						    <a href="${pageContext.request.contextPath}/attractionsEnd/edit?attractionsId=${attr.attractionsId}" class="btn btn-primary btn-sm" style="background-color: #63bfc9; border-color: #63bfc9;">
							    <i class="fas fa-edit"></i>
							</a><p></p>
						    <button type="button" class="btn btn-primary btn-sm view" data-toggle="modal" data-target="#viewModal" data-arti-id="${attr.attractionsId}" style="background-color: #63bfc9; border-color: #63bfc9;">
						        <i class="fas fa-eye"></i>
						    </button>
						</td>				
				</tr>
				</c:forEach>
				</table>
                </c:when>
                <c:otherwise>
                    <!-- 查詢結果為空 -->
                    <div class="text-center">
<!--                         <img src="path_to_cute_image.jpg" alt="No Results Found" /> -->
                        <p>沒有找到任何結果</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    
 	 <!-- 查看 -->		
		<div class="modal fade" id="viewModal" tabindex="-1" role="dialog" aria-labelledby="viewModalLabel" aria-hidden="true">
		    <div class="modal-dialog modal-lg" role="document">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h5 class="modal-title" id="viewModalLabel">景點詳情</h5>
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                    <span aria-hidden="true">&times;</span>
		                </button>
		            </div>
		            <div class="modal-body">
		                <div class="row">
                          <!-- 輪播圖 -->
		                    <div id="carouselExampleIndicators" class="carousel slide">
		                        <div class="carousel-inner" id="images"></div>
		                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
		                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		                            <span class="sr-only">Previous</span>
		                        </a>
		                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
		                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
		                            <span class="sr-only">Next</span>
		                        </a>
							</div>
		                    <div class="col-md-6 mb-3"><strong class="d-block mb-2">景點類型</strong>
		                        <p id="attractionsType"></p>
		                    </div>
		                    <div class="col-md-6 mb-3"><strong class="d-block mb-2">景點</strong>
		                        <p id="attractionsName"></p>
		                    </div>
		                    <div class="col-md-12 mb-3"><strong class="d-block mb-2">景點介紹</strong>
		                        <div id="description"></div>
		                    </div>		                    
		                    <div class="col-md-6 mb-3"><strong class="d-block mb-2">地址</strong>
		                        <p id="address"></p>
		                    </div>
		                    <div class="col-md-6 mb-3" id="attractionsStatus"><strong class="d-block mb-2"></strong>
		                    </div>
		                </div>
		            </div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
		                <a href="${pageContext.request.contextPath}/attractionsEnd/edit?attractionsId=${attr.attractionsId}" class="btn btn-primary" id="editButton">修改</a>
		            </div>
		        </div>
		    </div>
		</div>
		
	<!-- 回首頁 -->
	<div class="page-item">
		<a class="page-link"
			href="${pageContext.request.contextPath}/attractionsEnd/index.jsp">回總列表</a>
	</div>
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
$('.view').on('click', function() {
    var artiId = $(this).data('arti-id');
	    $.ajax({
	        url: "<%=request.getContextPath()%>/attractionsEnd/view",
	        type: "GET",
	        data: {attractionsId: attractionsId},           
	        success: function(column) {
	        	console.log(column);
	        	$('#attractionsId').text(attr.attractionsId);
	            $('#attractionsName').text(attr.attractionsName);
	            $('#description').html(attr.description);
	            $('#address').text(attr.address);
	            $('#attractionsStatus').text(attr.attractionsStatus == 0 ? '此文章上架中' : '此文章未上架');
	            $('#attractionsStatus').text(attr.attractionsTypeId);
	            $('#editButton').attr('href', '${pageContext.request.contextPath}/attractionsEnd/edit?attractionsId=' + attractionsId);
	            var carouselInner = $('#images').empty();
	            var carouselItem = $('<div>').addClass('carousel-item active');
	            var img = $('<img>')
	                .attr("src", "<%=request.getContextPath()%>/attractionsImage?attractionsId=" + attractionsId)
	                .addClass("d-block w-100");
	            carouselItem.append(img);
	            carouselInner.append(carouselItem);
	        },
	        error: function(error) {
	            console.log("Error: ", error);
	        }
	    });
    });

</script>
</body>
</html>