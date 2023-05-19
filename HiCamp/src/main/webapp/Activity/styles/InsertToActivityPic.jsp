<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="/styles/project2.css">

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
	<div class="wrap">
		<!-- 表頭 -->
		<header>
			<div>
				<h1 class="logo">
					<a href="./project2.html"><img src="./images/logo.jpg"
						alt="logo"></a>
				</h1>
				<nav>
					<ul class="list">
						<li class="shop" id="shop"><a href="#">商城</a>
							<ul>
								<li><a href="#">裝備</a></li>
							</ul></li>
						<li class="discussion"><a href="#">論壇</a>
							<ul>
								<li><a href="#">討論</a></li>
							</ul></li>
						<li class="journey"><a href="#">行程</a></li>
						<li class="news"><a href="#">露營區</a></li>
						<li class="connection"><a href="#">聯絡我們</a></li>
						<li class="member"><a href="./projectMemberLogin.html">登入</a></li>
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
						<li><a
							href="http://localhost:8080/Project_Hiking/Activity_SelectAll">活動列表</a></li>
						<li class="content_member"><a href="#">查詢活動</a>
							<ul>
								<li><a
									href="http://localhost:8080/Project_Hiking/Activity/SelectAll.html">查詢全部</a>
								</li>
								<li><a
									href="http://localhost:8080/Project_Hiking/Activity/SelectByNo.html">單筆查詢</a>
								</li>
								<li><a
									href="http://localhost:8080/Project_Hiking/Activity/SelectByKeyword.html">關鍵字查詢</a>
								</li>
							</ul></li>
						<li><a
							href="http://localhost:8080/Project_Hiking/Activity/InsertToActivity.html">新增活動</a></li>
						<li><a
							href="http://localhost:8080/Project_Hiking/Activity/UpdateActivity.html">修改活動</a>
						</li>
						<li><a
							href="http://localhost:8080/Project_Hiking/Activity/DeleteActivity.html">刪除活動</a>
						</li>
					</ul>
				</nav>
			</aside>
			<!-- 新增結果 -->
			<div class="bar">
				<table
					style="margin-left: 0; margin-top: 0%; font-size: 120; justify-content: space-between;">

					<tr>
						<label for=""><td><h1>新增結果:</h1></label>
						<td></td>
					<tr>
					<tr>
						<label for=""><td>活動編號:${activityNo}</label>
						<label for=""><td></label>
						<img src='data:image/jpg;base64,${activityPic}'/>
					</tr>

				</table>
			</div>
			<!-- 頁尾 -->
			<footer>
				<div class="infomation">
					<h2>
						<a href="./project2.html"><img src="./images/logo.jpg"
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
	</div>
</body>

</html>