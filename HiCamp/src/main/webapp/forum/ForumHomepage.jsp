<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登露HiCamp</title>
    <link rel="stylesheet" href="/HiCamp/forum/css/project2.css">
    <link rel="stylesheet" href="/HiCamp/forum/css/ForumHomepage.css">
    <style>
		
        
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
            <article>
		    <table class="memberInformation">
		        <thead>
		            <tr>
		                <th class="th1">編號</th>
		                <th class="th2">類別</th>
		                <th class="th3">標題</th>
		                <th class="th4">內容</th>
		                <th class="th5">作者</th>
		                <th class="th6">最後編輯日期</th>
		                <th class="th7">操作</th>
		            </tr>
		        </thead>
		        <tbody>
		            <c:forEach var="forum" items="${forums}">
		                <tr>
		                    <td class="id">${forum.forumNo}</td>
		                    <td>${forum.forumType}</td>
		                    <td class="th3">${forum.forumTitle}</td>
		                    <td class="th4">${forum.forumPost}</td>
		                    <td>${forum.memberNo}</td>
		                    <td>${forum.forumDate}</td>
		                    <td>
		                        <a href="UpdateForum?forumNo=${forum.forumNo}" class="btn btn-success">修改</a>
		                        <a class="btn btn-danger" id="btn-danger">刪除</a>
		                   	</td>
		                	</tr>
		            	</c:forEach>
		        	</tbody>
		    	</table>
			</article>
        </div>

        <!-- 頁尾 -->
        <footer>
            <div class="infomation">
                <h2><a href="forum/Project2Homepage.html"><img src="/HiCamp/forum/images/logo.png" alt="logo"></a></h2>
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
    <script src="https://code.jquery.com/jquery-3.6.4.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
	const btn = document.querySelectorAll(".btn-danger");
	$(".btn-danger").click(function(){
		console.log($(this).parent().siblings(".id").text());
		Swal.fire({
            title: '確定要刪除產品?',
            text: "",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Delete!'
        })
            .then((result) => {
                if (result.isConfirmed) {
                	
                    Swal.fire(
                        '刪除',
                        '此商品已不存在於資料庫',
                        'success'
                    )
                        .then(() => {
                            console.log("succ");
                            window.location.href = "DeleteForum?forumNo=" + $(this).parent().siblings(".id").text();
                        })
                }
		})
	
    });
	</script>
</body>

</html>