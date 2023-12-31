<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Depthspace後台</title>
    <%--  include head.jsp--%>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet">

    <!-- 引入Bootstrap 5.3.0 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- 引入Bootstrap 5.3.0 Bundle JS (包括Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- 引入jQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <!-- 載入icon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/indexpage/images/iconhtml.png"/>
    <style>
        #sidebar-wrapper .nav-item {
            list-style-type: none;
            /* 移除項目符號 */
        }

        #wrapper {
            min-height: 60vh;
            /* 設定最小高度為視口的100% */
        }

        #sidebar-wrapper {
            width: 180px;
            min-width: 180px;
            min-height: 50vh;
        }

        <c:if test="${adminId!=null && admin.adminFuncName == 1 }">
        #sidebar-wrapper {
            width: 180px;
            min-width: 180px;
            min-height: 15vh;
        }

        </c:if>

        .parent-div {
            display: flex;
            /* 使用Flexbox布局 */
            justify-content: flex-start;
            /* 確保項目從開始位置對齊 */
        }

        .child-div {
            margin-left: auto;
            /* 推動這個元素到最右側 */
        }

        /*.bg-gray {*/
        /*    background-color: rgb(211, 211, 211);*/
        /*    !* 淺灰色 *!*/
        /*}*/

        .text-choco {
            color: #4E342E;
            text-decoration: none;
        }

        .text-choco.collapse-item:hover {
            color: #f2f0ee;
            text-decoration: underline;
        }

        .text-dark {
            color: #4E342E;
            text-decoration: none;
        }

        .text-dark.fw-bold:hover {
            text-decoration: underline;
        }

        .mh {
            height: 44px;
            margin-left: -10px;
        }

        body {

            margin: 0;
            /* 移除邊距 */
            padding: 0;
            /* 移除填充 */
            height: 100%;
            /* 設定高度為100% */

        <%--background-image: url("${pageContext.request.contextPath}/backend/backIndex/image/table2.jpg");--%> background-image: url("${pageContext.request.contextPath}/backend/backIndex/image/mountain.jpg");

            background-size: cover;

            background-attachment: fixed;

            background-position: top center;

            background-repeat: no-repeat;
        }

        .color-2-4 {
            background-color: #627D98;
        }

        .color-4-1 {
            background-color: #B0C4DE;
        }


        nav.navbar {
            background-color: rgba(211, 211, 211, 0);
        }

        .transparent {
            background-color: rgba(255, 255, 255, 0.7);
        }

        .fs-li {
            font-size: 0.9rem;
        }

        .sidebar-center {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .logout:hover {
            background-color: rgba(255, 255, 255, 0.3);
            /*color: rgba(0, 0, 0, 0.3);*/
        }

        /*固定側邊欄*/
        .sidebar-sticky {
            position: fixed;
            top: 0px;
        }
    </style>
</head>
<body>
<%--include header.jsp--%>
<nav class="navbar navbar-expand-lg navbar-light parent-div pb-0 ">
    <%--    <a class="navbar-brand fs-2 mx-2 my-0 fw-bold p-0" href="${pageContext.request.contextPath}/indexpage/index.jsp">--%>
    <%--        <img class="mh my-0" src="${pageContext.request.contextPath}/backend/backIndex/image/logo.jpg">--%>
    <%--    </a>--%>
    <%--    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"--%>
    <%--            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">--%>
    <%--        <span class="navbar-toggler-icon"></span>--%>
    <%--    </button>--%>
    <div class="collapse navbar-collapse child-div" id="navbarNav">
        <ul class="navbar-nav ms-auto fs-5 mx-2 ">
            <c:if test="${adminId != null}">
                <li class="nav-item active">
                    <a class="logout nav-link fs-4 btn bg-bu"
                       href="${pageContext.request.contextPath}/ad/logout">登出<span class="sr-only">()</span></a>
                </li>
            </c:if>
        </ul>
    </div>
</nav>
<div class="container-fluid">
    <div class="row">
        <%--    側邊欄--%>
        <div class="col-lg-2 g-3 mt-0 sidebar-sticky">
            <div class="mt-2">
                <a class="navbar-brand fs-2 mx-2 my-0 fw-bold p-0"
                   href="${pageContext.request.contextPath}/indexpage/index.jsp">
                    <img class="mh my-0" src="${pageContext.request.contextPath}/backend/backIndex/image/logo.jpg">
                </a>
            </div>
            <div class="border-right rounded color-2-4" id="sidebar-wrapper">
                <%--                <div class="fs-4 fw-bold offset-1 my-2">後台管理系統</div>--%>
                <a href="${pageContext.request.contextPath}/backend/backIndex/index.jsp"
                   class="fs-4 text-dark fw-bold my-2 sidebar-center">後台管理系統</a>
                <div class="list-group list-group-flush sidebar-center">
                    <c:if test="${adminId!=null && admin.adminFuncName == 2}">
                        <!-- 員工管理 -->
                        <li class="nav-item mb-2">
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                               data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                                <span class="text-light fs-5">員工管理 <i
                                        class="fa-solid fa-angle-down"></i></span>
                            </a>
                            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
                                 data-bs-parent="#sidebar-wrapper">
                                <div class="color-4-1 py-2 collapse-inner rounded">
                                    <a class="text-choco collapse-item fs-6 offset-1"
                                       href="${pageContext.request.contextPath}/backadmin/list">查詢資料</a>
                                    <br>
                                    <a class="text-choco collapse-item fs-6 offset-1"
                                       href="${pageContext.request.contextPath}/admin/addAdmin.jsp">新增資料</a>
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
                                    <a class="text-choco collapse-item fs-6 offset-1"
                                       href="${pageContext.request.contextPath}/backmem/list">查詢資料</a>
                                        <%--                                <br>--%>
                                        <%--                                <a class="text-choco collapse-item fs-5 offset-3" href="#">修改資料</a>--%>
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
                                    <a class="text-choco collapse-item fs-6 offset-1"
                                       href="${pageContext.request.contextPath}/backend/Rest.do?action=getRests">餐廳列表</a>
                                    <br>
                                    <a class="text-choco collapse-item fs-6 offset-1"
                                       href="${pageContext.request.contextPath}/backend/Rest.do?action=forAdd">新增餐廳</a>
                                    <br>
                                    <a class="text-choco collapse-item fs-6 offset-1"
                                       href="${pageContext.request.contextPath}/backend/Rest.do?action=getBookingDate">預約設定</a>
                                    <br>
                                    <a class="text-choco collapse-item fs-6 offset-1"
                                       href="${pageContext.request.contextPath}/backend/Rest.do?action=getMembooking">訂位查詢</a>
                                </div>
                            </div>
                        </li>

                        <!-- 票券管理 -->
                        <li class="nav-item mb-2">
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                               data-bs-target="#collapseTickets" aria-expanded="true" aria-controls="collapseTickets">
                                <span class="text-light fs-5">票券管理 <i
                                        class="fa-solid fa-angle-down"></i></span>
                            </a>
                            <div id="collapseTickets" class="collapse" aria-labelledby="headingTickets"
                                 data-bs-parent="#sidebar-wrapper">
                                <div class="color-4-1 py-2 collapse-inner rounded">
                                    <a class="text-choco collapse-item fs-6 offset-1"
                                       href="${pageContext.request.contextPath}/ticketmg/list">票券列表</a>
                                    <br>
                                    <a class="text-choco collapse-item fs-6 offset-1"
                                       href="${pageContext.request.contextPath}/tickettypesmg/list">票券類型</a>
                                    <br>
                                    <a class="text-choco collapse-item fs-6 offset-1"
                                       href="${pageContext.request.contextPath}/to/listAll">訂單管理</a>
                                    <br>
                                    <a class="text-choco collapse-item fs-6 offset-1"
                                       href="${pageContext.request.contextPath}/pro/getAll">促銷管理</a>
                                </div>
                            </div>
                        </li>

                        <!-- 文章管理 -->
                        <li class="nav-item mb-2">
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                               data-bs-target="#collapseArticleManagement" aria-expanded="true"
                               aria-controls="collapseArticleManagement">
                                <span class="text-light fs-5">文章管理 <i
                                        class="fa-solid fa-angle-down"></i></span>
                            </a>
                            <div id="collapseArticleManagement" class="collapse"
                                 aria-labelledby="headingArticleManagement"
                                 data-bs-parent="#sidebar-wrapper">
                                <div class="color-4-1 py-2 collapse-inner rounded">
		                            <a class="text-choco collapse-item fs-6 offset-1" href="${pageContext.request.contextPath}/backend/articles/list.jsp">文章列表</a>
		                            <br>
		                            <a class="text-choco collapse-item fs-6 offset-1" href="${pageContext.request.contextPath}/backend/reportarticles/list.jsp">檢舉管理</a>
		                            <br>
		                            <a class="text-choco collapse-item fs-6 offset-1" href="${pageContext.request.contextPath}/backend/articlesType/list.jsp">類型管理</a>
		                        </div>
                            </div>
                        </li>

                        <!-- 景點管理 -->
                        <li class="nav-item mb-2">
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                               data-bs-target="#collapseAttractionsManagement" aria-expanded="true"
                               aria-controls="collapseAttractionsManagement">
                                                <span class="text-light fs-5">景點管理 <i
                                                        class="fa-solid fa-angle-down"></i></span>
                            </a>
                            <div id="collapseAttractionsManagement" class="collapse"
                                 aria-labelledby="headingAttractionsManagement"
                                 data-bs-parent="#sidebar-wrapper">
                                <div class="color-4-1 py-2 collapse-inner rounded">
                                    <a class="text-choco collapse-item fs-6 offset-1"
                                       href="${pageContext.request.contextPath}/attractionsEnd/list">景點列表</a>

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
                            <div id="collapseColumnManagement" class="collapse"
                                 aria-labelledby="headingColumnManagement"
                                 data-bs-parent="#sidebar-wrapper">
                                <div class="color-4-1 py-2 collapse-inner rounded">
                                    <a class="text-choco collapse-item fs-6 offset-1"
                                       href="${pageContext.request.contextPath}/columnmg/list">專欄列表</a>
                                    <br>
                                    <a class="text-choco collapse-item fs-6 offset-1"
                                       href="${pageContext.request.contextPath}/columntypesmg/list">專欄類型</a>
                                </div>
                            </div>
                        </li>



                        <!-- faq管理 -->
                        <li class="nav-item mb-2">
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                               data-bs-target="#collapseFaqService" aria-expanded="false"
                               aria-controls="collapseFaqService">
                                <span class="text-light fs-5">FAQ管理 <i
                                        class="fa-solid fa-angle-down"></i></span>
                            </a>
                            <div id="collapseFaqService" class="collapse" aria-labelledby="headingFaqService"
                                 data-bs-parent="#sidebar-wrapper">
                                <div class="color-4-1 py-2 collapse-inner rounded">
                                    <a class="text-choco collapse-item fs-6 offset-1"
                                       href="${pageContext.request.contextPath}/faq/select_page.jsp">常見問題</a>
                                    <br>
                                    <a class="text-choco collapse-item fs-6 offset-1"
                                       href="${pageContext.request.contextPath}/faqtypes/select_page.jsp">問題類型</a>
                                </div>
                            </div>
                        </li>

                    </c:if>

                    <c:if test="${adminId!=null && admin.adminFuncName == 1 }">
                        <!-- 餐聽管理 -->
                        <li class="nav-item mb-2">
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                               data-bs-target="#collapseRestService" aria-expanded="false"
                               aria-controls="collapseRestService">
                                <span class="text-light fs-5">餐廳管理 <i
                                        class="fa-solid fa-angle-down"></i></span>
                            </a>
                            <div id="collapseRestService" class="collapse" aria-labelledby="headingRestService"
                                 data-bs-parent="#sidebar-wrapper">
                                <div class="color-4-1 py-2 collapse-inner rounded">
                                    <a class="text-choco collapse-item fs-6 offset-1"
                                       href="${pageContext.request.contextPath}/backend/Rest.do?action=getId_for_update">餐廳修改</a>
                                    <br>
                                    <a class="text-choco collapse-item fs-6 offset-1"
                                       href="${pageContext.request.contextPath}/backend/Rest.do?action=getBookingDate">預約設定</a>
                                    <br>
                                    <a class="text-choco collapse-item fs-6 offset-1"
                                       href="${pageContext.request.contextPath}/backend/Rest.do?action=getMembooking">訂位查詢</a>
                                </div>
                            </div>
                        </li>
                    </c:if>
                </div>
            </div>
        </div>
        <div class="col-lg-10 g-2 mt-2">
            <%--      放入自己body裡的代碼--%>


        </div>
    </div>
</div>

</body>
</html>
