<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/HiCamp/Activity/styles/project2.css">
<jsp:useBean id="activity" scope="request"
	class="hiCampBean.ActivityBean" />
<style>
.st1 {
	width: 450px;
	margin: 3px;
	margin-top: 3%;
	border: 2px solid #000000;
	border-radius: 5px;
	padding-bottom: 10px;
	text-size-adjust: auto;
	font-size: 120%;
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
			<!-- 選單 -->
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

			<!-- 修改內容 -->
			<ul class="bar"
				style="font-size: 100%; justify-content: space-between; margin: 200px auto;">
				<form method="post" action="/HiCamp/Activity_UpdateInsertData" class="form">

					<h1 style="color: #000000;">更改資料</h1>

					<hr style="border-bottom: 2px solid #00448d;">
					<br>

					<p>請輸入更正的資料內容：：</p>
					<br> <label for="">活動編號：</label> <label for=""> <input
						type="number" name="activityNo" class="st1" readonly
						value="<%=activity.getActivityNo()%>" /></label> <br> <label for="">活動類型：</label>
					<label for=""><input type="text" name="activityType"
						class="st1" value="<%=activity.getActivityType()%>" /></label> <br>
					<label for="">活動名稱：</label> <label for=""><input
						type="text" name="activityName" class="st1"
						value="<%=activity.getActivityName()%>" /></label> <br> <label
						for="">活動地點：</label> <label for=""><input type="text"
						name="activityLocation" class="st1"
						value="<%=activity.getActivityLocation()%>" /></label> <br> <label
						for="">活動資訊：</label> <label for=""><input type="text"
						name="activityInfo" class="st1"
						value="<%=activity.getActivityInfo()%>" /></label> <br> <label
						for="">活動名額：</label> <label for=""><input type="text"
						name="activityQuota" class="st1"
						value="<%=activity.getActivityQuota()%>" /></label> <br> <label
						for="">活動價格：</label> <label for=""><input type="text"
						name="activityPrice" class="st1"
						value="<%=activity.getActivityPrice()%>" /></label> 
						<br> <br> 
						<input type="submit" style="font-size: 120%;" value="確定" /> 
						<input type="reset" style="font-size: 120%;" value="清除" />
				</form>

			</ul>
		</div>

		<!-- 頁尾 
		<footer>
			<div class="infomation">
				<h2>
					<a href="./project2.html"><img src="../images/logo.jpg"
						alt="logo"></a>
				</h2>
				<ul>
					<li>復興南路390號</li>
					<li><a href="tel:0987654321">0987654321</a></li>
					<li><a href="mailto:123@gmail.com">123@gmail.com</a></li>
				</ul>
			</div>
			<div class="bottom">
				<p>Copyright © 2023 資展國際旅行社 by JAVAEE65 Media. All Rights
					Reserved</p>
			</div>
		</footer>-->
	</div>

</body>

</html>