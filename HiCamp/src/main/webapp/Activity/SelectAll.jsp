<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查詢活動資料</title>
<link rel="stylesheet" href="/HiCamp/Activity/styles/project2.css">
<script src="https://kit.fontawesome.com/c919345bd6.js"
	crossorigin="anonymous"></script>

<script>
	function searchActivities() {
		var input, filter, table, tr, td, i, txtValue;
		input = document.getElementById("searchInput");
		filter = input.value.toUpperCase();
		table = document.getElementById("activityTable");
		tr = table.getElementsByTagName("tr");
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[1];
			if (td) {
				txtValue = td.textContent || td.innerText;
				if (txtValue.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
				} else {
					tr[i].style.display = "none";
				}
			}
		}
	}
</script>

<style>
.container {
	width: 100%;
	height: 100%;
	margin: 0 auto;
	margin-left: 0%;
	margin-top: 10%;
	justify-content: center;
	overflow: auto;
}

body {
	overflow: scroll;
}

table {
	max-width: 100%;
	table-layout: fixed;
	width: 1200px;
	border-collapse: collapse;
}

thead {
	background-color: #c6c2bd;
	font-weight: bold;
}

th, td {
	padding: 10px;
	text-align: center;
	border: 1px solid #ddd;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

td {
	white-space: nowrap; /* 不換行 */
	overflow: hidden; /* 超出部分隱藏 */
	text-overflow: ellipsis; /* 顯示省略號 */
}

.btn-add {
	display: block;
	width: 150px;
	margin: 30px auto;
	padding: 10px;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.btn-edit, .btn-delete {
	display: inline-block;
	width: 80px;
	padding: 8px;
	margin: 0 5px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.btn-edit {
	background-color: #2196F3;
	color: white;
	cursor: pointer;
}

.btn-delete {
	background-color: #f44336;
	color: white;
	cursor: pointer;
}

/*search-box*/
.search-box {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.search-box input[type="text"] {
	width: 70%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 16px;
}

.btn-search {
	display: inline-block;
	width: 20%;
	padding: 10px;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 4px;
	font-size: 16px;
	cursor: pointer;
}

.searchall-box, .insert-box {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.searchall-box, .insert-box input[type="text"] {
	width: 70%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 16px;
}

.btn-searchall, .btn-insert {
	display: inline-block;
	width: 20%;
	padding: 10px;
	background-color: #2196F3;
	color: white;
	border: none;
	border-radius: 4px;
	font-size: 16px;
	cursor: pointer;
}
</style>
</head>

<body>
<%
	session.getAttribute("managerAccount");
	if(session.getAttribute("managerAccount") == null)
	response.sendRedirect("/HiCamp/Member/ProjectMemberLogin.jsp");
%>
	<div align="center">
		<jsp:useBean id="activity" scope="request"
			class="hiCampBean.ActivityBean" />

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



			<!-- 選單 -->
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

				<!-- 內容 -->

				<div class="container">

					<table>
						<tr>
							<th style="border: none; text-align: left;"><button
									onclick="location.href='/HiCamp/Activity_SelectAll'"
									class="btn-searchall">顯示所有活動</button>
								<button
									onclick="location.href='/HiCamp/Activity/InsertToActivityData.jsp'"
									class="btn-insert">新增活動</button></th>

						</tr>
					</table>


					<form method="post"
						action="/HiCamp/Activity_SelectByKeyword"
						class="form">
						<table>
							<tr>
								<th class="search-box">關鍵字搜尋: <input type="text"
									name="keyword" id="searchInput" onkeyup="searchActivities()"
									placeholder="輸入關鍵字">
									<button type="submit" class="btn-search">搜尋</button>
								</th>
							</tr>
						</table>
					</form>

					<th><button onclick="sortTable(0)"></button></th>
					<th><button onclick="sortTable(1)"></button></th>
					<th><button onclick="sortTable(2)"></button></th>

					<table>
						<thead>
							<tr>
								<!--  <th><input type="checkbox" name="" id="checkAll"></th>-->
								<th>活動編號 <!--	<button
										style="background: none; border: none; padding: 0; cursor: pointer;"
										onclick="sort(0)">
										<i class="fa-solid fa-caret-down"></i>
									</button>-->
								</th>
								<th>活動類型</th>
								<th>活動名稱</th>
								<th>活動地點</th>
								<th>活動資訊</th>
								<th>活動名額</th>
								<th>活動價格</th>
								<th>詳細資料</th>
								<th>修改資料</th>
								<th>刪除資料</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="activity" items="${actList}">
								<tr>
									<!-- <td><input type="checkbox" name="" id="check1"
										class="checkbox1"></td>-->
									<td>${activity.activityNo}</td>
									<td>${activity.activityType}</td>
									<td>${activity.activityName}</td>
									<td>${activity.activityLocation}</td>
									<td style="height:3em, overflow: hidden">${activity.activityInfo}</td>
									<td>${activity.activityQuota}</td>
									<td>${activity.activityPrice}</td>

									<th>
										<form action="/HiCamp/Activity_SelectByNo" method="post">
											<input type="hidden" name="activityNo"
												value="<c:out value='${activity.activityNo}'/>">
											<button
												style="background: none; border: none; padding: 0; cursor: pointer;"
												onclick="location.href='/HiCamp/Activity/InsertToActivity.html'">
												<i class="fa-solid fa-magnifying-glass-plus fa-2xl"></i>
											</button>
											</form>
									</th>

									<td>
										<form action="/HiCamp/Activity_Update" method="post">
											<input type="hidden" name="activityNo"
												value="<c:out value='${activity.activityNo}'/>">
											<button type="submit"
												style="background: none; border: none; padding: 0; cursor: pointer;">
												<i class="fa-solid fa-pen-to-square fa-2xl"></i>
											</button>
										</form>
									</td>

									<td>
										<form action="/HiCamp/Activity_Delete" method="post"
											onsubmit="return confirm('確定要刪除此活動嗎？')">
											<input type="hidden" name="activityNo"
												value="<c:out value='${activity.activityNo}'/>">

											<button type="submit"
												style="background: none; border: none; padding: 0; cursor: pointer;">
												<i class="fa-solid fa-trash-can fa-2xl"></i>
											</button>
										</form>
								</tr>


							</c:forEach>
						</tbody>
					</table>
				</div>


				<c:choose>
					<c:when test="${empty actList}">
						<p>查無符合條件的活動。</p>
					</c:when>
					<c:otherwise>
						<br>
						<p>--- 共有 ${actList.size()} 筆活動 ---</p>
					</c:otherwise>
				</c:choose>

				<!-- 頁尾
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
						<p>Copyright © 2023 登露荒野 Wild Adventures by JAVAEE65 Media.
							All Rights Reserved</p>
					</div>
				</footer>
				-->
			</div>
</body>

</html>