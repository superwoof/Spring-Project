<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登露HiCamp</title>
    <link rel="stylesheet" href="./campsite/css/project2.css">
    <style>
    	.content{
    		height: 70vh;
    	}
    </style>
    <script defer src="./js/project2.js"></script>
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
        <h3>更新營區資料</h3>
        <form action="Update" method="post" onsubmit="return confirm('您確定要更新營區資料嗎？')">
            <label for="campsiteNo">營區編號：</label>
            <input type="text" id="campsiteNo" name="campsiteNo" value="${camp.campsiteNo}" readonly><br><br>
            <label for="campsiteName">營區名字：</label>
            <input type="text" id="campsiteName" name="campsiteName" value="${camp.campsiteName}"><br><br>
            <label for="campsiteQuantity">營區數量：</label>
            <input type="text" id="campsiteQuantity" name="campsiteQuantity" value="${camp.campsiteQuantity}"><br><br>
            <label for="campsiteLocation">營區地點：</label>
            <input type="text" id="campsiteLocation" name="campsiteLocation" value="${camp.campsiteLocation}"><br><br>
            <label for="campsiteInfo">營區資訊：</label>
            <input type="text" id="campsiteInfo" name="campsiteInfo" value="${camp.campsiteInfo}"><br><br>
            <input type="submit" value="更新">
        </form>
    </div>
</div>

       <!-- 頁尾 -->
        <footer>
            <div class="infomation">
                <h2><a href="./project2.html"><img src="campsite/images/logo.png" alt="logo"></a></h2>
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
