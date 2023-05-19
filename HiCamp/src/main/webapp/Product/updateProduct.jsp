<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>登露HiCamp</title>
    <link rel="stylesheet" href="/HiCamp/Product/css/project2.css">
    
    <style>
    .content{
    	height: 20vh;
    }
        .insert {
            /* background-color: #f3b1b1; */
            /* margin-left: 50px; */
            margin-bottom: 10px;
            width: 100%;
            height: 300px;
            border-radius: 15px;
            padding: 10px;
            /* display: flex; */
            justify-content: center;
            align-items: center;
            overflow: auto;
        }

        legend {
            border-bottom: 2px solid black;
            text-align: center;
            font-size: large;

        }

        h2 {
            /* background-color: #fff; */
            display: flex;
            justify-content: center;
            align-items: center;
        }

        h3 {
            margin-top: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
                .btn {
                    width: 100%;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                }
                button,
                .input1 {
                    background-color: #9cc9ec;
                    padding: 4px 8px;
                    border-radius: 5px;
                    font-size: 14px;
                    margin: 10px 10px;
                    cursor: pointer;
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
                <div class="insert">
                    <legend>
                        <h2>修改商品</h2>
                    </legend>
                    <h3><%=request.getAttribute("row") %></h3>

                </div>
                </div>
                   <div class="btn">
                        <a href="./GetAllProduct">
                            <button>回商品後台管理</button>
                        </a>
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

</body>
</html>