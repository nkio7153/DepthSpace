<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>訂單已成立</title>
  <jsp:include page="../indexpage/head.jsp" />
  <!-- Bootstrap CSS -->
<%--  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">--%>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <!-- Custom Styles -->
  <style>
    .confirmation {
      display: flex;
      flex-direction: column;
      align-items: center;
    }
    .fs-5 {
      margin-bottom: 10px;
    }
  </style>
</head>
<body class="bg-light">
<jsp:include page="../indexpage/header.jsp" />
<jsp:include page="../indexpage/headpic.jsp"/>
<div class="container mt-4">
  <h1 class="text-center display-3 mb-4">訂單已成立</h1>
  <div class="row">
    <div class="col-12">
      <div class="mb-4 border rounded shadow-sm p-3 confirmation">
        <i class="fa fa-check-circle fa-5x text-success mb-3"></i>
        <h4 class="border-bottom pb-2">謝謝您的訂購！</h4>
        <!-- 使用 d-flex 使其成為flex容器 -->
        <div class="d-flex align-items-center">
          <!-- 使用 fs-5 設定字體大小 -->
          <span class="fs-5">訂單編號：</span>
          <!-- ml-auto 會將元素推到右側 -->
          <p class="mt-0 ml-auto fs-5">${ticketOrder.orderId}</p>
        </div>
        <div class="d-flex align-items-center">
          <span class="fs-5">總金額：</span>
          <p class="mt-0 ml-auto fs-5">${ticketOrder.amountPaid}</p>
        </div>
        <div class="d-flex align-items-center" id="pmDiv">
          <span class="fs-5">付款方式：</span>
          <p class="mt-0 ml-auto fs-5" id="paymentMethod">${ticketOrder.paymentMethod}</p>
        </div>

        <a href="${pageContext.request.contextPath}/indexpage/index.jsp" class="btn btn-primary mt-4 rounded">返回首頁</a>
      </div>
    </div>
  </div>
</div>

<script>
  $(document).ready(function(){
    let transferHtml=`<div class="d-flex align-items-center flex-column">
                        <span class="fs-5">請於1天內轉入以下帳號</span>
                       <div>
                        <span class="fs-5">銀行代號:822</span>
                        <span class="fs-5 mx-2">銀行帳號:02013710138</span>
                        </div>
                      </div>`;
    let linePayHtml=`<div class="d-flex align-items-center">
                        <span class="fs-5">請掃碼進行付款</span>
                        <div>
                        <img src="${pageContext.request.contextPath}/images/linepay.jpg">
                        </div>
                      </div>`;

    //取得付款方式
    let paymentMethod=$("#paymentMethod");
        switch (paymentMethod.text()) {
          case '1':
            paymentMethod.text("信用卡");
            break;
          case '2':
            paymentMethod.text("轉帳");
            paymentMethod.closest("#pmDiv").after(transferHtml);
            break;
          case '3':
            paymentMethod.text("LINE Pay");
            paymentMethod.closest("#pmDiv").after(linePayHtml);
            break;
        }

  })
</script>
<jsp:include page="../indexpage/footer.jsp" />
<!-- Optional JavaScript -->
<!-- jQuery, Popper.js, Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
