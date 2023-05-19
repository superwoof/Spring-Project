<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/HiCamp/Member/css/project2.css">
    <link rel="stylesheet" href="/HiCamp/Member/css/projectMemberUpdate.css?ver=123">
    <style>
    .member ul {
	    position: absolute;
	    bottom: -100%;
	    left: 0;
	    display: none;
	}
    </style>
    <title>登露HiCamp</title>
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
                <form action="/HiCamp/ProjectManageMemberUpdate" method="post">
                <h4>個人資料</h4>
                    <label>
                        會員編號<br>
                        <input type="text" readonly name="memberNo" id="memberNo" value="<c:out value="${member.memberNo }"/>" required>
                    </label>
                    <label>
                        會員信箱<br>
                        <input type="text" readonly name="memberEmail" id="memberEmail" value="<c:out value="${member.memberEmail }"/>" required>
                    </label>
                    <label>
                        姓名<br>
                        <input type="text" name="memberName" id="memberName" value="<c:out value="${member.memberName }"/>" required>
                    </label>
                    <label>
                        性別<br>
                        <input type="text" name="memberGender" id="memberGender" value="<c:out value="${member.memberGender }"/>" required>
                    </label>
                    <label>
                        密碼<br>
                        <input type="password" name="memberPassword" id="memberPassword" value="<c:out value="${member.memberPassword }"/>" required>
                    </label>
                    <label>
                        手機號碼<br>
                        <input type="text" name="memberPhone" id="memberPhone" value="<c:out value="${member.memberPhone }"/>" required>
                    </label>
                    <label>
                        地址<br>
                        <input type="text" name="memberAddress" id="memberAddress" value="<c:out value="${member.memberAddress }"/>" required>
                    </label>
                    <label>
                        身分證字號<br>
                        <input type="text" name="memberId" id="memberId" value="<c:out value="${member.memberId }"/>" required>
                    </label>
                    <label>
                        生日<br>
                        <input type="text" name="memberBirthday" id="memberBirthday" value="<c:out value="${member.memberBirthday }"/>" required>
                    </label>
                    <label>
                        緊急聯絡人<br>
                        <input type="text" name="memberEmergencyContact" id="memberEmergencyContact" value="<c:out value="${member.memberEmergencyContact }"/>" required>
                    </label>
                    <label>
                        聯絡人電話<br>
                        <input type="text" name="memberEmergencyPhone" id="memberEmergencyPhone" value="<c:out value="${member.memberEmergencyPhone }"/>" required>
                    </label>
                    <a class="delete" href="#" >刪除會員</a>
                    <button type="submit" class="submit">確認修改</button>
                    <a class="cancel"href="/HiCamp/SearchAllMember"><i class="fa-solid fa-arrow-left fa-2xl"
                                style="color: #D08856;"></i></a>
                </form>
                <div class="deleteConfirm">
                    <h3>確定要刪除嗎</h3>
                    <a href="/HiCamp/DeleteMember">確定</a>
                    <a class="no">取消</a>
               	</div>
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

    <script src="./js/jquery-3.6.4.min.js"></script>
    <script src="https://kit.fontawesome.com/f2dedc11a5.js" crossorigin="anonymous"></script>
    <script>
    document.addEventListener("DOMContentLoaded", function() {
    	  var cancel = document.querySelectorAll(".cancel");
    	  var deleteBtn = document.querySelector(".delete");
    	  var deleteConfirm = document.querySelector(".deleteConfirm");
    	  var deleteConfirmNo = document.querySelector(".deleteConfirm .no");

    	  cancel.forEach(function(cancelItem) {
    	    cancelItem.addEventListener("mouseenter", function() {
    	      this.querySelector("i").classList.add("fa-beat-fade");
    	    });
    	    cancelItem.addEventListener("mouseleave", function() {
    	      this.querySelector("i").classList.remove("fa-beat-fade");
    	    });
    	  });

    	  deleteBtn.addEventListener("click", function() {
    	    deleteConfirm.style.display = "block";
    	  });

    	  deleteConfirmNo.addEventListener("click", function() {
    	    deleteConfirm.style.display = "none";
    	  });

    	  document.addEventListener("mouseup", function(e) {
    	    if (!deleteConfirm.contains(e.target)) {
    	      deleteConfirm.style.display = "none";
    	    }
    	  });
    	});

    </script>
    
</body>

</html>