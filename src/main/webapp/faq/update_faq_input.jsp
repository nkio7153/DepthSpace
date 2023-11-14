<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.depthspace.faq.model.model.FaqVO"%>
<%@ page import="com.depthspace.faq.model.service.*"%>
<%@ page import="com.depthspace.faq.model.controller.*"%>
<%@ page import="com.depthspace.faq.model.model.*"%>

<% //見com.emp.controller.EmpServlet.java第163行存入req的faqVO物件 (此為從資料庫取出的faqVO, 也可以是輸入格式有錯誤時的faqVO物件)
   FaqVO faqVO = (FaqVO) request.getAttribute("faqVO");
%>
<html>
<head>
   <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
	<title>FAQ資料修改 - update_faq_input.jsp</title>
<%--  include head.jsp--%>
  <jsp:include page="/backend/backIndex/head.jsp"></jsp:include>
<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>
</head>
<body>
<%--include header.jsp--%>
<jsp:include page="/backend/backIndex/header.jsp"></jsp:include>
<div class="container-fluid my-0">
  <div class="row">
<%--    側邊欄--%>
    <div class="col-lg-2 g-3 my-0">
    <jsp:include page="/backend/backIndex/sidebar.jsp"></jsp:include>
    </div>

    <div class="col-lg-10 g-2 transparent rounded my-0">
<%--      放入自己body裡的代碼--%>
     <table id="table-1">
	<tr><td>
		 <h3>FAQ員工資料修改 - update_faq_input.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料修改:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="faq.do" name="form1">

<table>
	<tr>
		<td>SerialId<font color=red><b>*</b></font></td>
		<td><%=faqVO.getSerialId()%></td>
	</tr>
	<tr>
		<td>Faq編號:</td>
		<td><input type="TEXT" name="faqNo" value="<%=faqVO.getFaqNo()%>" size="45"/></td>
	</tr>
	<tr>
		<td>Faq名稱:</td>
		<td><input type="TEXT" name="faqName"   value="<%=faqVO.getFaqName()%>" size="45"/></td>
	</tr>
	<tr>
		<td>Faq答案:</td>
		<td><input type="TEXT" name="faqAns"   value="<%=faqVO.getFaqAns()%>" size="45"/></td>
	</tr>

<%-- 	<jsp:useBean id="faqSvc" scope="page" class="com.depthspace.faq.model.service.FaqService" /> --%>
<!-- 	<tr> -->
<!-- 		<td>�券��:<font color=red><b>*</b></font></td> -->
<!-- 		<td><select size="1" name="serialId"> -->
<%-- 			<c:forEach var="FaqVO" items="${faqSvc.all}"> --%>
<%-- 				<option value="${deptVO.deptno}" ${(empVO.deptno==deptVO.deptno)?'selected':'' } >${deptVO.dname} --%>
<%-- 			</c:forEach> --%>
<!-- 		</select></td> -->
<!-- 	</tr> -->

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="serialId" value="<%=faqVO.getSerialId()%>">
<input type="submit" value="送出修改"></FORM>
</body>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>
    </div>
  </div>
</div>

</body>
</html>
