<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登露HiCamp</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/HiCamp/forum/css/project2.css">
    <style>
    	ul{
    		margin-bottom: 0;
    	}
        article {
            margin: 150px 0;
        }

        .card {
            margin-bottom: 20px;
        }

        .card-header {
            padding: 10px;
            background-color: #f5f5f5;
        }

        .card-header .category {
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .card-body {
            padding: 20px;
            background-color: #ffffff;
        }

        .card-body .title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .card-body .content {
            font-size: 16px;
            line-height: 1.5;
            height: 1.5em;
            overflow: hidden;
        }
    </style>
</head>

<body>
    <div class="wrap">
        <!-- 表頭 -->
        <header>
            <div>
                <h1 class="logo"><a href="/HiCamp/Member/ProjectHomePage.jsp"><img src="/HiCamp/forum/images/logo.png"
                            alt="logo"></a></h1>
                <nav>
                    <ul class="list">
                        <li class="shop" id="shop">
                            <a href="#">商城</a>
                        </li>
                        <li class="discussion">
                            <a href="/HiCamp/GetAllForumPost">論壇</a>
                        </li>
                        <li class="journey"><a href="#">行程</a></li>
                        <li class="news"><a href="#">露營區</a></li>
                        <li class="connection"><a href="#">聯絡我們</a></li>
                        <c:choose>
                        <c:when test="${sessionScope.memberName != null }">
                       		<li class="member"><a>${sessionScope.memberName}</a>
                       		<ul>
	                        	<li>
	                                <a href="/HiCamp/Member/ProjectMemberSetting.jsp">帳號設定</a>
	                            </li>
	                            <li>
	                                <a href="/HiCamp/Logout">登出</a>
	                            </li>
	                        </ul>
	                        </li>
                        </c:when>
                        <c:when test="${sessionScope.memberName == null }">
                       		<li class="member"><a href="/HiCamp/Member/ProjectMemberLogin.jsp">登入</a></li>
                        </c:when>
                        </c:choose>
   
                    </ul>
                </nav>
            </div>
        </header>

        <!-- 內容 -->
        <div class="content">
            <article>
                <div class="container">
                    <c:forEach var="forum" items="${forums}">
                        <div class="card">
                            <div class="card-header">
                                <div class="category">${forum.forumType}</div>
                            </div>
                            <div class="card-body">
                                No.${forum.forumNo}<br>
                                <div class="title">
                                    ${forum.forumTitle}
                                </div>
                                <div class="content">
                                    ${forum.forumPost}<br>
                                </div>
                                <c:if test="${not empty forum.forumAlbum}">
                                    <img src="data:image/jpeg;base64,${forum.forumAlbum}" alt="Forum image" width="200"
                                        height="150">
                                </c:if>
                                <div class="forum-info">
                                    <br>發文作者:${forum.memberNo} 最後編輯日期：${forum.forumDate}
                                </div>
                                <a href="GetForumPostDetail?forumNo=${forum.forumNo}" class="btn btn-primary">閱讀更多</a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </article>
        </div>

        <!-- 頁尾 -->
        <footer>
            <div class="infomation">
                <h2><a href="/HiCamp/Member/ProjectManagerPage.jsp"><img src="/HiCamp/forum/images/logo.png" alt="logo"></a></h2>
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