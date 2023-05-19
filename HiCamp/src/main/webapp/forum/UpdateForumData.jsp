<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>修改貼文</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/project2.css">
    <style>
        article {
            margin: 150px 0 50px 0;
        }

        form {
            width: 50%;
            margin: 0 auto;
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
                <h2 class="text-center mt-3 mb-5">請輸入要修改的內容</h2>
                <form method="post" action="/HiCamp/UpdateForum">
                    <div class="form-group">
                        <label for="forumNo">文章編號：</label>
                        <input type="text" class="form-control" name="forumNo" id="forumNo" autocomplete="off">
                    </div>
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
                    <input type="submit" class="btn btn-primary" value="確定">
                    <input type="button" class="btn btn-primary ml-1" id="fillData" value="一鍵輸入">
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
	    document.getElementById('fillData').addEventListener('click', function() {
	    document.getElementById('forumType').value = "心得"; 
	    document.getElementById('forumTitle').value = "熱愛探索的野外基因 Cindy，PUMA 登山、野跑雙棲新戰友—Eeplore NITRO GTX"; 
	    document.getElementById('forumPost').value = "熱愛戶外的 Cindy 黃語熙，目前百岳進度已達 64% ，除了登山也熱愛露營、越野跑與三鐵，近期也開始嘗試自由潛水，可說是上山又下海，對於戶外的喜愛，是從小烙印在骨子裡的習慣「我家人本來就很喜歡爬山之類的戶外活動，從小就是被帶往山裡趴趴走」。自幼就在山林裡打滾的 Cindy，相較於一般人更熟悉非人工道路或是石階的踏感，也對於完成一些不同坡度地貌的路線容易感到有成就感，對於野外的適應力也是從孩提時代被打磨出來。除了大自然的氛圍外， Cindy 也特別喜歡在戶外跟人聊天交流，「不論年紀，『凹豆咖』大多數都很陽光、很開朗，不管是我小時候還是到現在，山上大夥的話題不外乎從爬山、跑步開始聊起，不會在那邊比較誰比較厲害、誰賺得多，真正把日常的瑣事拋諸腦後」，完全隔絕世俗，只要享受純粹原始的自然林相和大口呼吸的運動當下就好。"; 
	});
	</script>
</body>

</html>