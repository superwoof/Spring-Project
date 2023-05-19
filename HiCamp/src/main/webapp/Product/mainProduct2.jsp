<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>登露HiCamp</title>
    <link rel="stylesheet" href="/HiCamp/Product/css/project2.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
    
    <style>
   
        .main {
            width: 100%;
            justify-content: center;
            align-items: center;
        }

        legend {
            border-bottom: 2px solid black;
            text-align: center;
            font-size: large;

        }

                .topform button {
                    /* 清除背景色 */
                    background: #9cbbc5;
                    /* 边框样式、颜色、宽度 */
                    border: 2px solid #283539;
                    /* 给边框添加圆角 */
                    border-radius: 10px;
                    /* 字母转大写 */
                    border: none;
                    color: rgb(31, 38, 41);
                    padding: 8px 16px;
                    text-align: center;
                    display: inline-block;
                    font-size: 16px;
                    margin: 4px 2px;
                    -webkit-transition-duration: 0.4s;
                    /* Safari */
                    transition-duration: 0.4s;
                    cursor: pointer;
                    text-decoration: none;
                    text-transform: uppercase;
                }

                .topform button:hover {
                    background-color: #465357;
                    color: #d5eaf1;
                }

        form {
            margin: 10px 10px;
        }

        h3 {
            text-align: center;
            margin: 5px 0;
        }

        .tables {
            background-color: #f3eded;
            width: 1000px;
            /* border: 1px solid black; */
            margin: 0 auto;
            border-radius: 15px;
            padding: 10px;
        }

        th {
            border-bottom: 1px solid black;
        }

        td {
            /* border: 1px solid blue; */
            text-align: center;
        }
        .display input {
            border: none;
            background-color: transparent;
        }

        .display input:focus {
            outline: none;
        }

        .tr {
            position: relative;
        }

        .tr input {
            margin-left: 10px;
            margin-right: 0px;
            width: 15px;
            padding: 0px

        }

                .btn {
                    position: absolute;
                    left: 10px;
                    background: #c6ebf7;
                    /* 边框样式、颜色、宽度 */
                    border: 2px solid #4e6971;
                    /* 给边框添加圆角 */
                    border-radius: 2px;
                    /* 字母转大写 */
                    border: none;
                    color: rgb(86, 107, 116);
                    padding: 3px 6px;
                    text-align: center;
                    display: inline-block;
                    /* font-size: 16px; */
                    /* margin-bottom: 5px; */
                    cursor: pointer;
                    text-decoration: none;
                    text-transform: uppercase;
                }
    </style>
</head>
<body>
<%
	session.getAttribute("managerAccount");
	if(session.getAttribute("managerAccount") == null)
	response.sendRedirect("/HiCamp/Member/ProjectMemberLogin.jsp");
%>
    <div class="wrap">
        <!-- 表頭 -->
        <header>
            <div>
                <h1 class="logo"><a href="/HiCamp/Member/ProjectManagerPage.jsp"><img src="/HiCamp/Member/images/logo.png" alt="logo"></a></h1>
                <nav>
                    <ul class="list">
                        <c:choose>
                        <c:when test="${sessionScope.managerAccount != null }">
                       		<li class="member"><a>${sessionScope.managerAccount}</a>
                       		<ul>
	                            <li>
	                                <a href="/HiCamp/Logout">登出</a>
	                            </li>
	                        </ul>
	                        </li>
                        </c:when>
                        </c:choose>
                    </ul>
                </nav>
            </div>
        </header>

        <!-- 內容 -->
        <div class="content">
            <aside>
                <nav>
                    <ul class="content_list">
                        <li><a href="/HiCamp/SearchAllMember">會員編輯</a></li>
                        <li class="content_member">
                            <a href="/HiCamp/GetAllForumPostCRUD">論壇編輯</a>
                            <ul class="content_list">
                                <li class="content_member"><a href="/HiCamp/forum/InsertForumData.jsp">新增貼文</a></li>
                                <li class="content_member"><a href="#">查詢貼文</a>
                                    <ul>
                                        <li><a href="/HiCamp/forum/GetForumPostbyTitleData.jsp">查詢標題</a></li>
                                        <li><a href="/HiCamp/forum/GetForumPostbyNoData.jsp">查詢編號</a></li>
                                    </ul>
                                </li>
                                <li><a href="/HiCamp/forum/UpdateForumData.jsp">修改貼文</a></li>
                                <li><a href="/HiCamp/forum/DeleteForumData.jsp">刪除貼文</a></li>
                            </ul>
                        </li>
                        <li><a href="/HiCamp/SelectAll">營區編輯</a></li>
                        <li><a href="/HiCamp/GetAllProduct">商品編輯</a></li>
                        <li><a href="/HiCamp/Activity_SelectAll">活動編輯</a></li>
                    </ul>
                </nav>
            </aside>
            
            <article>
            <div class="main">
                <legend>
                    <h2>商品後台管理</h2>
                </legend>
                <div class="topform">
                    <form method="post" action="/HiCamp/Product/insertProductData.jsp">
                        <button>新增商品</button>
                    </form>

                </div>

                <table id="myTable" class="display">
        <thead>
            <tr>
                <th>商品編號</th>
                <th>商品分類</th>
                <th>商品名稱</th>
                <th>金額</th>
                <th>數量</th>
                <th>狀態</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${products}" var="product" varStatus="s">
                    <tr class="tr">
                        <td>
                		<form method="get" action="./GetProduct">
                        <input readonly type="text" value="${product.productNo}" name="productNo">
                            <button class="btn" type="submit">查詢</button>
                        </td>
                        <td>${product.productType}</td>
                        <td>${product.productName}</td>
                        <td>${product.productPrice}</td>
                        <td>${product.productQuantity}</td>
                        <td>${product.productStutas}</td>
                		</form>

                    </tr>
                <c:set var="count" value="${s.count}" />
            </c:forEach>
        </tbody>
    </table>
            </div>
            </article>
        </div>

        <!-- 頁尾 -->
        <footer>
            <div class="infomation">
                <h2><a href="./project2.html"><img src="/HiCamp/Product/images/logo.png" alt="logo"></a></h2>
                <ul>
                    <li>復興南路390號</li>
                    <li><a href="tel:0987654321">0987654321</a></li>
                    <li><a href="mailto:123@gmail.com">123@gmail.com</a></li>
                </ul>
            </div>
            <div class="bottom">
                <p>Copyright © 2023 資展國際旅行社 by JAVAEE65 Media. All Rights Reserved</p>
            </div>
        </footer>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.4.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.js"></script>
    <script>
        let table = new DataTable('#myTable');

    </script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
	$(function () {
        
       

    })
        
        
    </script>
</body>
</html>