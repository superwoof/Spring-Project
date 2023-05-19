<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,hiCampBean.CampsiteBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>登露HiCamp</title>
<link rel="stylesheet" href="./campsite/css/project2.css">
<style>
table{
	margin-left: 350px
}
.content{
margin-bottom: 20vh;
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
            </div>		</header>

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
			<div align="center">
				<h3>全部營區資料</h3>

				<table>
					<tr>
						<th>營區編號</th>
						<th>營區名字</th>
						<th>營區數量</th>
						<th>營區地點</th>
						<th>營區資訊</th>
						<th>查看</th>
						<th>更新</th>
						<th>刪除</th>
						<c:forEach items="${camps}" var="camp" varStatus="s">
							<tr>
								<td>${camp.campsiteNo}</td>
								<td>${camp.campsiteName}</td>
								<td>${camp.campsiteQuantity}</td>
								<td>${camp.campsiteLocation}</td>
								<td>${camp.campsiteInfo}</td>
								<td>
									<form method="get" action="GetData">
										<input type="hidden" name="campsiteNo"
											value="${camp.campsiteNo}"> <input type="submit"
											value="查看">
									</form>
								</td>
								<td>
									<form method="get" action="GetUpdateData">
										<input type="hidden" name="campsiteNo"
											value="${camp.campsiteNo}"> <input type="submit"
											value="更新">
									</form>
								</td>
								<td>
									<form method="post" action="DelCamp"
										onsubmit="return confirm('您確定要刪除該營區嗎？')">
										<input type="hidden" name="campsiteNo"
											value="${camp.campsiteNo}"> <input type="submit"
											value="刪除">
									</form>
								</td>
								<c:set var="count" value="${s.count}" />
						</c:forEach>
				</table>
				<h3>共${count}個營區</h3>
				<form action="campsite/AddCamp.jsp">
					<input type="submit" value="新增營區">
				</form>
			</div>
		</div>
	</div>

	<!-- 頁尾 -->
	<footer>
		<div class="infomation">
			<h2>
				<a href="./project2.html"><img src="campsite/images/logo.png"
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
	</footer>
	</div>

</body>

</html>