<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登露HiCamp</title>
    <link rel="stylesheet" href="/HiCamp/Member/css/project2.css">
    <link rel="stylesheet" href="/HiCamp/Member/css/projectManageMember.css">
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

            <article class="article">
            	<input type="search" name="search" id="search" placeholder="搜尋">
                <table class="memberInformation">
                    <thead>
                        <tr>
                            <th>會員編號</th>
                            <th>會員姓名</th>
                            <th>會員帳號</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${members}" var="member" varStatus="s">
                        <tr>
                            <form action="/HiCamp/SearchOneMember" method="get">
                            <th>${member.memberNo}</th>
                            <th>${member.memberName}</th>
                            <th><input name="memberEmail" type="text" value="${member.memberEmail}" readonly></th>
                            <th><button type="submit">編輯</button></th>
                        	</form>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </article>
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

<script>
        document.querySelector("#search").addEventListener("keyup", function () {
            let search = document.querySelector("#search");
            let memberNo = parseInt(search.value);
            let memberName = search.value;
            let memberEmail = search.value.toUpperCase();
            let table = document.querySelector(".memberInformation");
            let tr = table.querySelectorAll("tbody tr");
            let count = 0;
            let countNo = 0;

            for (let i = 0; i < tr.length; i++) {
                let td = tr[i].getElementsByTagName("th")[0];
                if (td) {
                    let txtValue = td.textContent || td.innerText;
                    if (txtValue.indexOf(memberNo) > -1) {
                        tr[i].style.display = "";
                        count++;
                        countNo++;
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }

            if(countNo < 1){
            	for (let i = 0; i < tr.length; i++) {
	                let td = tr[i].getElementsByTagName("th")[1];
	                if (td) {
	                    let txtValue = td.textContent || td.innerText;
	                    if (txtValue.indexOf(memberName) > -1) {
	                        tr[i].style.display = "";
	                        count++;
	                    } else {
	                        tr[i].style.display = "none";
	                    }
	                }
            	}
            }
            
			if(count < 1){
	            for (let i = 0; i < tr.length; i++) {
	                let td = tr[i].getElementsByTagName("th")[2];
	                let input = td.querySelector("input");
	                if (input) {
	                    let txtValue = input.value;
	                    console.log(txtValue);
	                    if (txtValue.toUpperCase().indexOf(memberEmail) > -1) {
	                        tr[i].style.display = "";
	                    } else {
	                        tr[i].style.display = "none";
	                    }
	                }
	            }
			}
        });



    </script>

</body>

</html>