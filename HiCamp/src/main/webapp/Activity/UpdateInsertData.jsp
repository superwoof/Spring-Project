<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>project2</title>
<link rel="stylesheet" href="/HiCamp/Activity/styles/project2.css">
<jsp:useBean id="activity" scope="request"
	class="hiCampBean.ActivityBean" />
<style>
table {
	border-collapse: collapse;
	overflow-x: auto;
	margin: auto;
	justify-content: space-between;
	margin-left: 0;
}

th, td {
	padding: 5px;
	/* border: 1px solid black; */
	text-align: left;
}

th {
	background-color: #eee;
	position: sticky;
	left: 0;
}

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

			<!-- 更新內容 -->
			<div class="bar">

				<table
					style="margin-left: 0; margin-top: 0%; font-size: 120; justify-content: space-between;">

					<tr>
						<label for=""><td><h1>更新結果:</h1></label>
						<td></td>
					<tr>
					<tr>
						<td>活動編號:
						<td><input type="number" size="30" class="st1" disabled 
							value="<%=activity.getActivityNo()%>">
					<tr>
						<td>活動類型:
						<td><input type="text" size="30" class="st1" disabled
							value="<%=activity.getActivityType()%>">
					<tr>
						<td>活動名稱:
						<td><input type="text" size="30" class="st1" disabled
							value="<%=activity.getActivityName()%>"></td>
					<tr>
						<td>活動地點:
						<td><input type="text" size="30" class="st1" disabled
							value="<%=activity.getActivityLocation()%>">
					<tr>
						<td>活動資訊:
						<td><input type="text" size="30" class="st1" disabled
							value="<%=activity.getActivityInfo()%>">
					<tr>
						<td>活動名額:
						<td><input type="text" size="30" class="st1" disabled
							value="<%=activity.getActivityQuota()%>">
					<tr>
						<td>活動價格:
						<td><input type="text" size="30" class="st1" disabled
							value="<%=activity.getActivityPrice()%>">
						<td>
					<tr>
						<td><br>
							<button
								onclick="location.href='/HiCamp/Activity_SelectAll'"
								style="font-size: 120%;">查看活動列表</button>
						</td>
					</tr>

				</table>


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
		</footer> -->
		</div>
</body>

</html>