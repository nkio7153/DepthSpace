<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.depthspace.faq.model.FaqVO"%>
<%@ page import="com.depthspace.faq.service.*"%>
<%@ page import="com.depthspace.faq.controller.*"%>
<%@ page import="com.depthspace.faq.model.*"%>

<%
	FaqVO faqVO = (FaqVO) request.getAttribute("faqVO");
%>

<html>
<head>
    <title>常見問題 - listOneFaq</title>
    <jsp:include page="/backend/backIndex/head.jsp"></jsp:include>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        .container-fluid {
            background-color: white;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
            padding: 15px;
        }

        h3 {
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
            background-color: white;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        a {
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <jsp:include page="/backend/backIndex/header.jsp"></jsp:include>
    <div class="container-fluid">
        <h3>常見問題 - listOneFaq</h3>
        <a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a>
        
        <table>
            <tr>
                <th>流水號</th>
                <th>FAQ編號</th>
                <th>FAQ名稱</th>
                <th>FAQ答案</th>
            </tr>
            <tr>
                <td>${faqVO.serialId}</td>
                <td>${faqVO.faqNo}</td>
                <td>${faqVO.faqName}</td>
                <td>${faqVO.faqAns}</td>
            </tr>
        </table>
    </div>
</body>
</html>
