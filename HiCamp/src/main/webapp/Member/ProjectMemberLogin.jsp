<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/HiCamp/Member/css/project2.css">
    <link rel="stylesheet" href="/HiCamp/Member/css/projectMemberLogin.css">
    <script defer src="./js/project2.js"></script>
    <title>登露HiCamp</title>
</head>

<body>
    <div class="wrap">
        <!-- 表頭 -->
        <header>
            <div>
                <h1 class="logo"><a href="${pageContext.request.contextPath}/Member/ProjectHomePage.jsp"><img src="/HiCamp/Member/images/logo.png" alt="logo"></a></h1>
                <nav>
                    <ul class="list">
                        <li class="shop" id="shop">
                            <a href="#">商城</a>
                        </li>
                        <li class="discussion">
                            <a href="#">論壇</a>
                        </li>
                        <li class="journey"><a href="#">行程</a></li>
                        <li class="news"><a href="#">露營區</a></li>
                        <li class="connection"><a href="#">聯絡我們</a></li>
                        <li class="member"><a href="/HiCamp/Member/ProjectMemberLogin.jsp">登入</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <!-- 內容 -->
        <div class="content">
            <article>
                <div class="login">

                    <form action="/HiCamp/MemberLogin" method="post">
                        <fieldset>
                            <h4>會員登入</h4>
                            <label>帳號：<input type="text" name="memberEmail" id="memberEmail"></label><br>
                            <label>密碼：<input type="password" name="memberPassword" id="memberPassword"></label><br>
                            <div class="newRegister">
                                <a href="/HiCamp/Member/Register.jsp">註冊帳號</a>
                                <p>
                                
                                	<c:choose>
			                        <c:when test="${requestScope.emailFalse != null }">
		                       		${requestScope.emailFalse}
			                        </c:when>
                               		<c:when test="${requestScope.passwordFalse != null }">
		                       		${requestScope.passwordFalse}
			                        </c:when>
			                        </c:choose>
                               	</p>
                                
                            </div>
                            <div class="bottom1">
                                <a href="#">忘記密碼</a>
                                <button type="submit">登入</button>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </article>
        </div>

        <!-- 頁尾 -->
        <footer>
            <div class="infomation">
                <h2><a href="${pageContext.request.contextPath}/Member/ProjectHomePage.jsp"><img src="/HiCamp/Member/images/logo.png" alt="logo"></a></h2>
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