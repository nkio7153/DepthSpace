<%@ page import="com.depthspace.member.service.MemberService"%>
<%@ page import="com.depthspace.member.model.MemVO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Base64" %>

<html>
<head>
<jsp:include page="../indexpage/head.jsp" />
<title>修改會員資料 revise.jsp</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<style>
    #preview_img {
        border-radius: 50%;
        width: 120px;
        height: 120px;
        object-fit: cover;
    }

    .btn_save {
        width: 150px;
        font-size: 20px;
        color: #fff;
        background-color: #008CBA;
        border: none;
        padding: 10px;
        cursor: pointer;
        border-radius: 10px;
        margin: 10px;
    }

    .image-container {
        text-align: center;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .upload-container {
        display: flex;
        align-items: center;
        margin-left: 20px;
    }

    .info-table {
        width: 50%;
        margin: 20px auto;
        border-collapse: collapse;
    }

    .info-table th, .info-table td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: center;
    }

    .info-table th {
        background-color: #f2f2f2;
    }

	.info-table input[type="text"],
	.info-table input[type="email"],
	.info-table input[type="date"] {
	    width: 250px;
	}
    .center-element {
        display: flex;
        justify-content: center;
    }
/*     button:hover { */
/*         outline: 2px solid blue; /* 修改聚焦框的樣式和顏色 */
/*     } */
	.key-container {
            display: inline-flex; /* 讓元素內容在一行顯示 */
            align-items: center;
            transition: transform 0.3s ease-in-out; /* 加入 hover 效果的過渡效果 */
            cursor: pointer;
        }

        .key-container:hover {
            transform: scale(1.2); /* 在 hover 時放大圖案和文字 */
        }

        .key-icon {
            font-size: 20px;
            color: #FFD700;
        }

        .key-text {
            margin-left: -1px; /* 調整文字與圖案之間的間距 */
            font-size: 19px; /* 調整文字大小 */
        }
    
  </style>
</head>
<body>
  <jsp:include page="../indexpage/header.jsp" />
  <jsp:include page="../indexpage/headpic.jsp" />

  <h1 align="center">修改會員資料</h1>
  <form align="center" action="${pageContext.request.contextPath}/mem/modify" method="post" enctype="multipart/form-data">
    <table class="info-table" align="center" width="50%">
      
      <tr>
        <th>會員大頭貼</th>
        <td>
          <div class="image-container">
            <img src="data:image/jpeg;base64,${base64Image}" id="preview_img" alt="ProfileImage" />
            <div class="upload-container">
              <input type="file" class="form-control" id="picture" name="memImage" style="width: 89px;">
            </div>
          </div>
        </td>
      </tr>
      
      <tr>
        <th>帳號</th>
        <td  class="center-element"><input type="text" name="memAcc" value="${authenticatedMem.memAcc}" class="form-control-plaintext" required readonly></td>
      </tr>
      
      <tr>
        <th>密碼</th>
        <td>
        	<a href="${pageContext.request.contextPath}/member/changePassword.jsp">
			    <i class="fas fa-key key-icon"></i>
			    <span class="key-text">修改密碼</span>
			    <input type="hidden" name="memPwd" value="${mem.memPwd}" />
			</a>
<%--         	<button type="text" name="memPwd" value="${mem.memPwd}" required style="background: none; border: none; cursor: pointer;"> --%>
<%-- 		    	<img src="${pageContext.request.contextPath}/member/images/key.png" alt="Key Icon" style="width: 20px; height: 20px;"> --%>
<!-- 			</button> -->
		</td>
      </tr>
      
      <tr>
        <th>會員姓名</th>
        <td><input type="text" name="memName" value="${mem.memName}" required></td>
      </tr>
      
      <tr>
        <th>身分證字號</th>
        <td><input type="text" name="memIdentity" value="${mem.memIdentity}" required></td>
      </tr>
      
      <tr>
        <th>生日</th>
        <td><input type="date" name="memBth" value="${mem.memBth}" required 
         		max="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>"></td>
      </tr>
      
      <tr>
    <th>性別</th>
    <td>
        <div class="form-check form-check-inline">
            <input type="radio" class="form-check-input" id="memSex1" name="memSex" value="1" ${mem.memSex == 1 ? 'checked' : ''}>
            <label class="form-check-label" for="memSex1"><i class="fas fa-mars"></i> 男</label>
        </div>
        <div class="form-check form-check-inline">
            <input type="radio" class="form-check-input" id="memSex2" name="memSex" value="2" ${mem.memSex == 2 ? 'checked' : ''}>
            <label class="form-check-label" for="memSex2"><i class="fas fa-venus"></i> 女</label>
        </div>
    </td>
</tr>
      
      <tr>
        <th>電子郵件</th>
        <td><input type="email" name="memEmail" value="${mem.memEmail}" required></td>
      </tr>
      
      <tr>
        <th>手機電話</th>
        <td><input type="text" name="memTel" value="0${mem.memTel}" required></td>
      </tr>
      
      <tr>
        <th>地址</th>
        <td>
        	<!-- 縣市 -->
			<select name="city" id="city" required>
				<option value="">請選縣市</option>
					<c:forEach var="typeItem" items="${city}">
						<option value="${typeItem.cityId}"
							${typeItem.cityId == cvo.cityId ? 'selected' : ''}
						>${typeItem.cityName}</option>
				    </c:forEach>
			</select>
			  
			<!-- 區域 -->
			<select name="area" id="area"  required>
				<c:forEach var="typeItem" items="${area}">
					<option value="${typeItem.areaId}" 
				         	${typeItem.areaId == avo.areaId ? 'selected' : ''}>
				            ${typeItem.areaName}</option>
				</c:forEach>
			</select>
<!-- 	        <input type="text" class="form-control" id="memAdd" name="memAdd" value="" placeholder="請輸入地址" required> -->
        <input type="text" name="memAdd" value="${newAddress}" required></td>
      </tr>
      
<!--       <tr> -->
<!--         <th>狀態</th> -->
<%--         <td><input type="text" name="accStatus" value="${status}" readonly></td> --%>
<!--       </tr> -->
      
      <tr>
        <th>點數</th>
        <td>${mem.memPoint}</td>
      </tr>
      
    </table>
    <p align="center">
    	<input type="hidden" name="accStatus" value="${status}" readonly>
    	<input type="hidden" name="memId" value="${memId}" readonly>
      <input type="submit" class="btn_save" value="儲存會員資料">
    </p>
  </form>
  <p align="center">
    <input type="button" class="btn_save" value="取消" onclick="history.back()">
  </p>

    
    <script type="text/javascript">
    var file = $("#picture");
    var preview_el = $("#preview_img");
    
    file.on("change", function() {
        if (this.files && this.files[0]) {
            var reader = new FileReader();

            reader.onload = function(e) {
                preview_el.attr("src", e.target.result);
            }

            reader.readAsDataURL(this.files[0]);
        }
    });

  </script>
  <script src="${pageContext.request.contextPath}/member/js/add.js"></script>
  
	<jsp:include page="../indexpage/footer.jsp" />
</body>
</html>
