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
    <link rel="stylesheet" href="/HiCamp/Member/css/projectMemberUpdate.css?ver=123">
    <style>
body {
    background-color: #d5f3f5;
}
.content{
    width: 100%;
}
article {
    margin: 0 auto;
    font-weight: bold;
    width: 70%;
}

.content h4 {
    font-size: 28px;
    margin-bottom: 20px;
}

article form{
    margin: 130px auto;
    display: flex;
    flex-direction: column;
    background-color: #fff;
    width: 50%;
    padding: 40px 80px;
    border-radius: 10px;
    font-size: 20px;
    color: var(--text_color);
    font-weight: bold;
    position: relative;
}
    </style>
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
                <form action="/HiCamp/ProjectMemberUpdate" method="post">
                <h4>個人資料</h4>
                    <label>
                        姓名<br>
                        <input type="text" name="memberName" id="memberName" value="<c:out value="${memberInfo.memberName }"/>" required>
                    </label>
                    <label>
                        密碼<br>
                        <input type="password" name="memberPassword" id="memberPassword" value="<c:out value="${memberInfo.memberPassword }"/>" required>
                    </label>
                    <label>
                        手機號碼<br>
                        <input type="text" name="memberPhone" id="memberPhone" value="<c:out value="${memberInfo.memberPhone }"/>" required>
                    </label>
                    <label>
                        地址<br>
                        <input type="text" name="memberAddress" id="memberAddress" value="<c:out value="${memberInfo.memberAddress }"/>" required>
                    </label>
                    <label>
                        身分證字號<br>
                        <input type="text" name="memberId" id="memberId" value="<c:out value="${memberInfo.memberId }"/>" required>
                    </label>
                    <label>
                        緊急聯絡人<br>
                        <input type="text" name="memberEmergencyContact" id="memberEmergencyContact" value="<c:out value="${memberInfo.memberEmergencyContact }"/>" required>
                    </label>
                    <label>
                        聯絡人電話<br>
                        <input type="text" name="memberEmergencyPhone" id="memberEmergencyPhone" value="<c:out value="${memberInfo.memberEmergencyPhone }"/>" required>
                    </label>
                    <button type="submit" class="submit">確認修改</button>
                    <a class="cancel"href="/HiCamp/Member/ProjectMemberSetting.jsp"><i class="fa-solid fa-arrow-left fa-2xl"
                                style="color: #D08856;"></i></a>
                </form>
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
    <script>
    document.addEventListener("DOMContentLoaded", function() {
  	  var cancel = document.querySelectorAll(".cancel");

  	  cancel.forEach(function(cancelItem) {
  	    cancelItem.addEventListener("mouseenter", function() {
  	      this.querySelector("i").classList.add("fa-beat-fade");
  	    });
  	    cancelItem.addEventListener("mouseleave", function() {
  	      this.querySelector("i").classList.remove("fa-beat-fade");
  	    });
  	  });


  	});
    </script>

</body>

</html>