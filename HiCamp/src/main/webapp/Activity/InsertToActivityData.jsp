<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>project2</title>
<link rel="stylesheet" href="/HiCamp/Activity/styles/project2.css">

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

			<!-- 新增內容 -->
			<ul class="bar"
				style="font-size: 100%; justify-content: space-between; margin: 200px auto;">
				<form method="post" action="/HiCamp/Activity_Insert" class="form">
					<p>
					<h1 style="color: #000000;">新增資料</h1>
					</p>
					<hr style="border-bottom: 2px solid #00448d;">
					<br>
					<p>請輸入資料：</p>

					<br> <label for="">活動類型：</label> <label for=""><input
						type="text" name="activityType" list="typelist" class="st1"
						placeholder="請輸入類型" /> <datalist id="typelist">
							<option value="新手專區"></option>
							<option value="百岳入門"></option>
							<option value="百岳進階"></option>
							<option value="長天數縱走"></option>
							<option value="中級山野營"></option>
						</datalist></label> <br> <label for="">活動名稱：</label> <label for=""><input
						type="text" name="activityName" list="namelist" class="st1"
						placeholder="請輸入名稱" /><datalist id="namelist">
						<option value="帝王之山~南湖群峰五天四夜"></option>
						<option value="寶島第一尖~中央尖山四天三夜"></option>
						<option value="步步驚心~北二段縱走四天三夜"></option>
						<option value="一生必朝聖: 水鹿大軍圍繞的北三段(能高安東軍)縱走六天五夜"></option>
						<option value="野外求生體驗營"></option>
						<option value="新手入門: 七星山"></option>
						<option value="台版富士山: 苗栗加里山一日單攻"></option>
					</datalist></label> 
					<br> <label for="">活動地點：</label> <label for=""><input
						type="text" name="activityLocation" list="locationlist"
						class="st1" placeholder="請輸入地點" /> <datalist id="locationlist">
							<option value="太魯閣國家公園"></option>
							<option value="玉山國家公園"></option>
							<option value="雪山國家公園"></option>
							<option value="陽明山國家公園"></option>
							<option value="奧萬大國家森林遊樂區"></option>
							<option value="新北市山區"></option>
						</datalist></label> <br> <label for="">活動資訊：</label> <label for=""><input
						type="text" name="activityInfo" class="st1" placeholder="請輸入資訊" /></label>
					<br> <label for="">活動名額：</label> <label for=""><input
						type="number" name="activityQuota" class="st1" placeholder="請輸入名額" /></label>
					<br> <label for="">活動價格：</label> <label for=""><input
						type="number" name="activityPrice"  list="Pricelist" class="st1" placeholder="請輸入價格" /><datalist id="Pricelist">
							<option value="6500"></option>
							<option value="1600"></option>
							<option value="12000"></option>
							<option value="500"></option>
							<option value="3200"></option>
							<option value="5000"></option></datalist></label>

					<br> <br> <input type="submit" style="font-size: 120%;"
						value="確定" /> <input type="reset" style="font-size: 120%;"
						value="清除" />
			</ul>
		</div>

		<!-- 頁尾 -->
		<footer>
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