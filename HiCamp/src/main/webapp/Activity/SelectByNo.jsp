<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:useBean id="activity" scope="request"
	class="hiCampBean.ActivityBean" />
<link rel="stylesheet" href="/HiCamp/Activity/styles/project2.css">
<link rel="stylesheet" href="jquery-ui-1.13.2/jquery-ui.css">
<style>
main {
	max-width: 1400px;
	margin: 0 auto;
	padding: 2em;
}

.gallery {
	margin-bottom: 2em;
	margin-top: 100px;
}

table {
	border-collapse: collapse;
	width: 100%;
}

td {
	padding: 10px;
	vertical-align: top;
}

.left {
	width: 50%;
	height: 450px;
}

.right {
	width: 50% height: 450px;
}

.middle {
	width: 100%;
}

.photo {

	width: 100%;
	background-color: #f8f8f8;
	background-image: url('your-photo-url');
	background-size: cover;
	background-position: center center;
	border-radius: 5px;
	
}

.introduction {
	padding: 20px;
	background-color: #f8f8f8;
	height: 410px;
	width: 100%;
	border-radius: 5px;
	font-size: 130%;
	line-height: 1.5;
}

.details {
	padding: 20px;
	width: 100%;
	background-color: #fff;
	border-radius: 5px;
	overflow: hidden;
	text-overflow: ellipsis;
}

.related {
	padding: 20px;
	width: 100%;
	background-color: #f8f8f8;
	border-radius: 5px;
}

h2 {
	margin-top: 0;
}

p {
	margin-bottom: 20px;
	text-align: justify;
	line-height: 1.5;
}

.btn-search {
	display: inline-block;
	width: 20%;
	padding: 10px;
	background-color: #2a80d0;
	color: white;
	border: none;
	border-radius: 4px;
	font-size: 16px;
	cursor: pointer;
	right: 0%;
}

.btn-readmore {
	display: inline-block;
	width: 20%;
	padding: 10px;
	background-color: #2a80d0;
	color: white;
	border: none;
	border-radius: 4px;
	font-size: 16px;
	cursor: pointer;
	right: 20%;
}

.st1 {
	width: 300px;
	margin: 3px;
	margin-top: 3%;
	border: 2px solid #000000;
	border-radius: 5px;
	padding-bottom: 10px;
	text-size-adjust: auto;
	font-size: 100%;
}

.test {
	position: relative;
}

.test>button {
	position: absolute;
	bottom: -50px;
	right: -30px;
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
			<!--  <aside>
                <nav>
                    <ul class="content_list">
                        <li class="content_member">
                            <a href="#">會員編輯</a>
                            <ul>
                                <li><a href="#">一</a></li>
                                <li><a href="#">二</a></li>
                                <li><a href="#">三</a></li>
                            </ul>
                        </li>
                        <li class="content_forum"><a href="#">論壇編輯</a>
                            <ul>
                                <li><a href="#">一</a></li>
                                <li><a href="#">二</a></li>
                                <li><a href="#">三</a></li>
                            </ul>
                        </li>
                        <li class="content_product"><a href="#">商品編輯</a></li>
                        <li class="content_activity"><a href="#">行程編輯</a></li>
                        <li class="content_camp"><a href="#">營區編輯</a></li>
                    </ul>
                </nav>
            </aside>-->
		</div>
		<main>
			<section class="gallery">
				<div class="test">
					<table>
						<tr>
							<td class="left">
								<div class="photo">
									<img src="/HiCamp/Activity/images/mountain.jpg">
									<button style="background: none; border: none; padding: 0; cursor: pointer;" onclick="">
									<i class="fa-regular fa-image"></i>
									</button>
								</div>
							</td>
							<td class="right">
								<div class="introduction">
									<h3>
										活動編號:<%=activity.getActivityType()%></h3>
									<h3>
										活動類型:<%=activity.getActivityType()%></h3>
									<h3>
										活動名稱:<%=activity.getActivityName()%></h3>
									<h3>
										活動地點:<%=activity.getActivityLocation()%></h3>

									<!-- <h2>出發日期: -->
									<!-- <input type="text" id="datepicker"></h2> -->
									<!-- <h2>回程日期: -->
									<!-- <input type="text" id="datepicker"></h2> -->
									<h3>
										活動名額:<%=activity.getActivityQuota()%></h3>
									<h3>
										活動價格:<%=activity.getActivityPrice()%></h3>

									<button type="submit" class="btn-search">編輯內容</button>

								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="middle">
								<div class="details">
									<h2>
										活動資訊:
										<p><%=activity.getActivityInfo()%>"
										</p>
									</h2>
									<button type="submit" class="btn-readmore">閱讀更多</button>
								</div>
							</td>
						</tr>
					</table>
					<button
						onclick="location.href='/HiCamp/Activity_SelectAll'"
						class="btn-search">回活動列表</button>
				</div>
			</section>
		</main>

		<!-- 

        <section class="testimonial">
            <h2>旅客的心得分享</h2>
            <div>
                <p>"這次的草原之旅真是太棒了！景色壯麗，風景迷人，真的很值得一去。"</p>
                <p class="author">- 張先生</p>
            </div>
            <div>
                <p>"我從來沒有想到草原的風景可以這麼美麗，一定會再來的。"</p>
                <p class="author">- 李小姐</p>
            </div>
            <div>
                <p>"草原狂歡節
        
                    ChatGPT
                    的氣氛非常熱鬧，真的是一個難忘的體驗。"</p>
                <p class="author">- 王先生</p>
            </div>
        </section> -->



		<!-- 頁尾 
        <footer>
            <div class="infomation">
                <h2><a href="./project2.html"><img src="../images/logo.jpg" alt="logo"></a></h2>
                <ul>
                    <li>復興南路390號</li>
                    <li><a href="tel:0987654321">0987654321</a></li>
                    <li><a href="mailto:123@gmail.com">123@gmail.com</a></li>
                </ul>
            </div>
            <div class="bottom">
                <p>Copyright © 2023 資展國際旅行社 by JAVAEE65 Media. All Rights Reserved</p>
            </div>
        </footer> -->
	</div>

</body>

</html>