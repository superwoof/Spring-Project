<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>論壇</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/project2.css">
    <style>
        article {
            margin: 150px 0 400px 0;
        }

        form {
            width: 50%;
            margin: 0 auto;
        }

        label,
        input {
            display: block;
            width: 100%;
            margin-bottom: 15px;
        }

        input[type="submit"] {
            width: auto;
            margin: 15px 0;
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
                <h1 class="logo"><a href="/HiCamp/Member/ProjectManagerPage.jsp"><img src="./images/logo.png" alt="logo"></a></h1>
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
             <h2 class="text-center mt-3 mb-5">請輸入要刪除的貼文</h2>
    <form method="post" action="../DeleteForum">
        <div class="form-group">
            <label for="forumNo">文章編號：</label>
            <input type="text" class="form-control" name="forumNo" id="forumNo" autocomplete="off">
            <input type="submit" class="btn btn-primary" value="確定">
        </div>
    </form>
            </article>
        </div>

        <!-- 頁尾 -->
        <footer>
            <div class="infomation">
                <h2><a href="/HiCamp/Member/ProjectManagerPage.jsp"><img src="./images/logo.png" alt="logo"></a></h2>
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
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>