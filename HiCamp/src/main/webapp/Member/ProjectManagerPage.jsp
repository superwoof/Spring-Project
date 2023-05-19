<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>登露HiCamp</title>
<link rel="stylesheet" href="/HiCamp/Member/css/project2.css?ver=123">
<style>
.member ul {
    position: absolute;
    bottom: -100%;
    left: 0;
    display: none;
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
            <article>
                <ul class="bar">
                    <li><a href="/HiCamp/SearchAllMember"><img src="/HiCamp/Member/images/people.png" alt="member">會員管理</a></li>
                    <li><a href="/HiCamp/Activity_SelectAll"><img src="/HiCamp/Member/images/mountains.png" alt="course">課程管理</a></li>
                    <li><a href="/HiCamp/SelectAll"><img src="/HiCamp/Member/images/camping-tent.png" alt="camp">營區管理</a></li>
                    <li><a href="/HiCamp/GetAllProduct"><img src="/HiCamp/Member/images/package.png" alt="shopping cart">商城管理</a></li>
                    <li><a href="/HiCamp/GetAllForumPostCRUD"><img src="/HiCamp/Member/images/discussion.png" alt="forum">論壇管理</a></li>   
                </ul>
            </article>
        </div>

        <!-- 頁尾 -->
        <footer class="footer">
            <div class="infomation">
                <h2><a href="/HiCamp/Member/ProjectManagerPage.jsp"><img src="/HiCamp/Member/images/logo.png" alt="logo"></a></h2>
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