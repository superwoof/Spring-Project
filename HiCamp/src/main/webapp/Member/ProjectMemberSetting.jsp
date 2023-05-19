<%@page import="javax.websocket.Session"%>
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
    <link rel="stylesheet" href="/HiCamp/Member/css/projectMemberSetting.css">
    <title>登露HiCamp</title>
</head>

<body>
<%
	session.getAttribute("memberInfo");
	if(session.getAttribute("memberInfo") == null)
	response.sendRedirect("/HiCamp/Member/ProjectMemberLogin.jsp");
%>
    <div class="wrap">
        <!-- 表頭 -->
        <header>
            <div>
                <h1 class="logo"><a href="${pageContext.request.contextPath}/Member/ProjectHomePage.jsp"><img src="/HiCamp/Member/images/logo.png" alt="logo"></a></h1>
                <nav>
                    <ul class="list">
                        <li class="shop" id="shop">
                            <a href="#">商城</a>
                            <ul>
                                <li>
                                    <a href="#">裝備</a>
                                </li>
                            </ul>
                        </li>
                        <li class="discussion">
                            <a href="#">論壇</a>
                            <ul>
                                <li>
                                    <a href="#">討論</a>
                                </li>
                            </ul>
                        </li>
                        <li class="journey"><a href="#">行程</a></li>
                        <li class="news"><a href="#">露營區</a></li>
                        <li class="connection"><a href="#">聯絡我們</a></li>
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
                    </ul>
                </nav>
            </div>
        </header>

        <!-- 內容 -->
        <div class="content">
            <article>
                <h4>個人資料</h4>
                <dl>
                    <button><a href="/HiCamp/Member/ProjectMemberUpdate.jsp"><i class="fa-solid fa-gear fa-xl" style="color: #D08856;"></i></a></button>
                    <dt>姓名</dt>
                    <dd><c:out value="${memberInfo.memberName }" /></dd>
                    <dt>Email</dt>
                    <dd><c:out value="${memberInfo.memberEmail }" /></dd>
                    <dt>密碼</dt>
                    <dd>********</dd>
                    <dt>手機號碼</dt>
                    <dd><c:out value="${memberInfo.memberPhone }" /></dd>
                    <dt>地址</dt>
                    <dd><c:out value="${memberInfo.memberAddress }" /></dd>
                    <dt>身分證字號</dt>
                    <dd><c:out value="${memberInfo.memberId }" /></dd>
                    <dt>緊急聯絡人</dt>
                    <dd><c:out value="${memberInfo.memberEmergencyContact }" /></dd>
                    <dt>聯絡人電話</dt>
                    <dd><c:out value="${memberInfo.memberEmergencyPhone }" /></dd>
                   
                </dl>
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

    <script src="./js/jquery-3.6.4.min.js"></script>
    <script src="https://kit.fontawesome.com/f2dedc11a5.js" crossorigin="anonymous"></script>

</body>

</html>