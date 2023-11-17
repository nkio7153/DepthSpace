<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 側邊導航欄 -->
<div class="border-right rounded color-2-4 sidebar-sticky" id="sidebar-wrapper">
<%--    <div class="fs-4 fw-bold offset-1 my-2">後台管理系統</div>--%>
    <a href="${pageContext.request.contextPath}/backend/backIndex/index.jsp" class="fs-4 text-dark fw-bold my-2 sidebar-center">後台管理系統</a>
    <div class="list-group list-group-flush sidebar-center">
        <!-- 員工管理 -->
        <li class="nav-item mb-2">
            <a class="nav-link collapsed mt-0" href="#" data-bs-toggle="collapse"
               data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                                <span class="text-light fs-5">員工管理 <i
                                        class="fa-solid fa-angle-down"></i></span>
            </a>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
                 data-bs-parent="#sidebar-wrapper">
                <div class="color-4-1 py-2 collapse-inner rounded">
                    <a class="text-choco collapse-item fs-6 offset-1" href="${pageContext.request.contextPath}/backmem/list">查詢資料</a>
                    <br>
                    <a class="text-choco collapse-item fs-6 offset-1" href="#">新增資料</a>
                </div>
            </div>
        </li>

        <!-- 會員管理 -->
        <li class="nav-item mb-2">
            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
               data-bs-target="#collapseUtilities" aria-expanded="true"
               aria-controls="collapseUtilities">
                                <span class="text-light fs-5">會員管理 <i
                                        class="fa-solid fa-angle-down"></i></span>
            </a>
            <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                 data-bs-parent="#sidebar-wrapper">
                <div class="color-4-1 py-2 collapse-inner rounded">
                    <a class="text-choco collapse-item fs-6 offset-1" href="${pageContext.request.contextPath}/backmem/list">查詢資料</a>
<%--                    <br>--%>
<%--                    <a class="text-choco collapse-item fs-5 offset-3" href="#">修改資料</a>--%>
                </div>
            </div>
        </li>

        <!-- 廠商管理 -->
        <li class="nav-item mb-2">
            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
               data-bs-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
                                <span class="text-light fs-5">廠商管理 <i
                                        class="fa-solid fa-angle-down"></i></span>
            </a>
            <div id="collapsePages" class="collapse" aria-labelledby="headingPages"
                 data-bs-parent="#sidebar-wrapper">
                <div class="color-4-1 py-2 collapse-inner rounded">
                    <a class="text-choco collapse-item fs-6 offset-1" href="#">新增資料</a>
                    <br>
                    <a class="text-choco collapse-item fs-6 offset-1" href="#">修改資料</a>
                    <br>
                    <a class="text-choco collapse-item fs-6 offset-1" href="#">檢舉廠商</a>
                </div>
            </div>
        </li>

        <!-- 票卷管理 -->
        <li class="nav-item mb-2">
            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
               data-bs-target="#collapseTickets" aria-expanded="true" aria-controls="collapseTickets">
                                <span class="text-light fs-5">票卷管理 <i
                                        class="fa-solid fa-angle-down"></i></span>
            </a>
            <div id="collapseTickets" class="collapse" aria-labelledby="headingTickets"
                 data-bs-parent="#sidebar-wrapper">
                <div class="color-4-1 py-2 collapse-inner rounded">
                    <a class="text-choco collapse-item fs-6 offset-1" href="${pageContext.request.contextPath}/ticketmg/list">票卷列表</a>
                    <br>
                    <a class="text-choco collapse-item fs-6 offset-1" href="${pageContext.request.contextPath}/tickettypesmg/list">票卷類型</a>
                    <br>
                    <a class="text-choco collapse-item fs-6 offset-1" href="${pageContext.request.contextPath}/to/listAll">訂單管理</a>
                    <br>
                    <a class="text-choco collapse-item fs-6 offset-1" href="${pageContext.request.contextPath}/pro/getAll">促銷管理</a>
                    <br>
                    <a class="text-choco collapse-item fs-6 offset-1" href="#">銷售分析</a>
                </div>
            </div>
        </li>

        <!-- 網頁管理 -->
        <li class="nav-item mb-2">
            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
               data-bs-target="#collapseWebManagement" aria-expanded="true"
               aria-controls="collapseWebManagement">
                                <span class="text-light fs-5">網頁管理 <i
                                        class="fa-solid fa-angle-down"></i></span>
            </a>
            <div id="collapseWebManagement" class="collapse" aria-labelledby="headingWebManagement"
                 data-bs-parent="#sidebar-wrapper">
                <div class="color-4-1 py-2 collapse-inner rounded">
                    <a class="text-choco collapse-item fs-6 offset-1" href="#">文章管理</a>
                    <br>
                    <a class="text-choco collapse-item fs-6 offset-1" href="#">檢舉管理</a>
                </div>
            </div>
        </li>

        <!-- 權限設定 -->
        <li class="nav-item mb-2">
            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
               data-bs-target="#collapsePermissions" aria-expanded="true"
               aria-controls="collapsePermissions">
                                <span class="text-light fs-5">權限設定 <i
                                        class="fa-solid fa-angle-down"></i></span>
            </a>
            <div id="collapsePermissions" class="collapse" aria-labelledby="headingPermissions"
                 data-bs-parent="#sidebar-wrapper">
                <div class="color-4-1 py-2 collapse-inner rounded">
                    <a class="text-choco collapse-item fs-6 offset-1" href="#">員工權限</a>
                    <br>
                    <a class="text-choco collapse-item fs-6 offset-1" href="#">廠商權限</a>
                </div>
            </div>
        </li>

        <!-- 專欄 -->
        <li class="nav-item mb-2">
            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
               data-bs-target="#collapseColumnManagement" aria-expanded="false"
               aria-controls="collapseColumnManagement">
                                <span class="text-light fs-5">專欄管理 <i
                                        class="fa-solid fa-angle-down"></i></span>
            </a>
            <div id="collapseColumnManagement" class="collapse" aria-labelledby="headingColumnManagement"
                 data-bs-parent="#sidebar-wrapper">
                <div class="color-4-1 py-2 collapse-inner rounded">
                    <a class="text-choco collapse-item fs-6 offset-1" href="${pageContext.request.contextPath}/columnmg/list">專欄列表</a>
                    <br>
                    <a class="text-choco collapse-item fs-6 offset-1" href="${pageContext.request.contextPath}/columntypesmg/list">專欄類型</a>
                </div>
            </div>
        </li>

        <!-- 客服中心 -->
        <li class="nav-item mb-2">
            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
               data-bs-target="#collapseCustomerService" aria-expanded="false"
               aria-controls="collapseCustomerService">
                                <span class="text-light fs-5">客服中心 <i
                                        class="fa-solid fa-angle-down"></i></span>
            </a>
            <div id="collapseCustomerService" class="collapse" aria-labelledby="headingCustomerService"
                 data-bs-parent="#sidebar-wrapper">
                <div class="color-4-1 py-2 collapse-inner rounded">
                    <a class="text-choco collapse-item fs-6 offset-1" href="#">客服問題</a>
                    <br>
                    <a class="text-choco collapse-item fs-6 offset-1" href="#">回報問題</a>
                </div>
            </div>
        </li>

    </div>
</div>
