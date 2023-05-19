<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>新增貼文</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/project2.css">
    <style>
        article {
            margin: 150px 0 50px 0;          
        }

        form {
            width: 50%;
            margin: 0 auto;
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        label,
        input,
        textarea,
        select {
            display: block;
            width: 100%;
            margin-bottom: 15px;
        }

        input[type="submit"],input[type="button"] {
            width: auto;
            margin: 15px 0;
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
                <h1 class="logo"><a href="/HiCamp/Member/ProjectManagerPage.jsp"><img src="./images/logo.png" alt="logo"></a></h1>
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
                <h2 class="text-center mt-3 mb-5">發表文章</h2>
                <form method="post" action="/HiCamp/InsertForum" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="forumType">文章類別:</label>
                        <select class="form-control" name="forumType" id="forumType">
                            <option value="">請選擇文章類別</option>
                            <option value="閒聊">閒聊</option>
                            <option value="心得">心得</option>
                            <option value="登山">登山</option>
                            <option value="露營">露營</option>
                            <option value="其他">其他</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="forumTitle">請輸入標題：</label>
                        <input type="text" class="form-control" name="forumTitle" id="forumTitle" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="forumPost">請輸入內容：</label>
                        <textarea class="form-control" name="forumPost" id="forumPost" rows="10"
                            autocomplete="off"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="forumAlbum">插入圖片：</label>
                        <input type="hidden" id="forumAlbum" name="forumAlbum">
                        <input type="file" class="form-control-file" name="forumAlbum" id="forumAlbum"
                            onchange="convertImageToBase64(this)">
                    </div>
                    <div class="form-group">
                        <input type="submit" class="btn btn-primary" value="發文">
                        <input type="button" class="btn btn-primary ml-1" id="fillData" value="一鍵輸入">
                    </div>
                </form>
            </article>
        </div>

        <!-- 頁尾 -->
        <footer>
            <div class="infomation">
                <h2><a href="/HiCamp/Member/ProjectManagerPage.jsp"><img src="./images/logo.png" alt="logo"></a></h2>
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

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        function convertImageToBase64(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    document.getElementById('forumAlbum').value = e.target.result;
                }

                reader.readAsDataURL(input.files[0]);
            }
        }
        
        	document.getElementById('fillData').addEventListener('click', function() {
            document.getElementById('forumType').value = "閒聊"; 
            document.getElementById('forumTitle').value = "想召喚愛山的你，一起讓中央山脈躍上大銀幕！"; 
            document.getElementById('forumPost').value = "「越野」挑戰中央山脈大縱走創紀錄！周青、古明政 8 天 16 小時 54 分橫越 332 公里、40 座百岳金鐘導演楊守義發起《赤心巔峰》紀錄片後製暨上映集資計畫盼邀大眾共同支持 為台灣留下珍貴山林影像。有「台灣屋脊」之稱的中央山脈，已靜靜守護台灣數百萬年。我們都曾在地理課本中，與中央山脈有過紙本圖片上的一面之緣，卻未曾走入中央山脈深處、登上遙遠高處，一窺那幅員廣闊卻鮮少為人所見的珍貴山林景象。"; 
        });
    </script>
</body>

</html>