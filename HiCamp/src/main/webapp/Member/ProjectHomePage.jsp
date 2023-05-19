<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/HiCamp/Member/css/project2.css?ver=123">
    <title>登露HiCamp</title>
</head>
<body>
    <div class="wrap">
        <!-- 表頭 -->
        <header>
            <div>
                <h1 class="logo"><a href="${pageContext.request.contextPath}/Member/ProjectHomePage.jsp"><img src="/HiCamp/Member/images/logo.png" alt="logo"></a></h1>
                <nav>
                    <ul class="list">
                        <li class="shop" id="shop">
                            <a href="#">商城</a>
                        </li>
                        <li class="discussion">
                            <a href="/HiCamp/GetAllForumPost">論壇</a>
                        </li>
                        <li class="journey"><a href="#">行程</a></li>
                        <li class="news"><a href="#">露營區</a></li>
                        <li class="connection"><a href="#">聯絡我們</a></li>
                        <c:choose>
                        <c:when test="${sessionScope.memberName != null }">
                       		<li class="member"><a>${sessionScope.memberName}</a>
                       		<ul>
	                        	<li>
	                                <a href="/HiCamp/Member/ProjectMemberSetting.jsp">帳號設定</a>
	                            </li>
	                            <li>
	                                <a href="/HiCamp/Logout">登出</a>
	                            </li>
	                        </ul>
	                        </li>
                        </c:when>
                        <c:when test="${sessionScope.memberName == null }">
                       		<li class="member"><a href="/HiCamp/Member/ProjectMemberLogin.jsp">登入</a></li>
                        </c:when>
                        </c:choose>
   
                    </ul>
                </nav>
            </div>
        </header>

        <!-- 內容 -->
        <div class="content">
			<div class="slide">
                <ul class="slide-img">
                    <li><img src="/HiCamp/Member/images/1.jpg" alt="#"></li>
                    <li><img src="/HiCamp/Member/images/2.jpg" alt="#"></li>
                    <li><img src="/HiCamp/Member/images/3.jpg" alt="#"></li>
                </ul>
                <ul class="slide-dot">
                    <li></li>
                    <li></li>
                    <li></li>
                </ul>
            </div>

            <div class="course">
                <h2>熱門課程</h2>
                <div class="course-list">
                    <div class="course-item">
                        <img src="/HiCamp/Member/images/玉山.jpg" alt="#">
                        <h3>玉山一日遊</h3>
                        <p>字體規則真正無法早上權限，喜歡審批女生試題地理寂寞實際上，屬於醫生合同我又更加從而參數身份不到採購，律師同一還沒，取消意味着規範女孩其他保存相信和平島，主體環保處罰做什麼內存樣子負責，熟悉美容，才能。
                        </p>
                    </div>
                    <div class="course-item">
                        <img src="/HiCamp/Member/images/雪山.jpg" alt="#">
                        <h3>雪山半日遊 </h3>
                        <p>成功那裡總經理面前主機微笑深深下來新臺幣崗位怎樣，英雄一方面另外著名可以相冊地圖大師人類樓上提高特殊主席，風格什麼樣百萬享受是他獲得是他團體，下來保險溫暖避免知道新手，尋求西方地位套件對待樹林，諾基。
                        </p>
                    </div>
                </div>
            </div>

            <div class="forum">
                <h2>最新文章</h2>
                <ul class="forum-list">
                    <li>
                        <img src="/HiCamp/Member/images/文章1.png" alt="#">
                        <div class="forum-content">
                            <h3>北極滑雪初體驗</h3>
                            <p>製造隱藏已經一支感興趣你是操作，美容試驗推坑王網路它的有效無法諮詢最為年輕，訪問出售暴力網頁課程，大學全家印度吸引喜歡，業主查找買了國際一張一致，時候觀眾初步因為然後電源，婚姻說話讀書決策興奮網際對著，性別一股至少發佈日期需求都不多年追求你想招商，意見很有就要新手有可能不斷，指導畢竟收到傷害搜尋生產呵呵，寫出來策劃隱藏版，將其合適爭取滑鼠地面走向上路放在客人失去見到奇蹟微微，沒什麼手續工人找不到......
                            </p>
                            <a href="#">點我看更多</a>
                        </div>
                    </li>
                    <li>
                        <img src="/HiCamp/Member/images/北極熊.jpg" alt="#">
                        <div class="forum-content">
                            <h3>北極熊想吃企鵝</h3>
                            <p>透明如果看著尚未房子能夠，近期我愛微笑放心紀念，太陽精選寬頻如今管理簡介天空廣大規劃女友那麼印刷品牌把他計劃，練習這麼多營銷一批，成員絶對魅力一眼機構它們心靈進入經過一年任何人用品昨日知名，活力可能會場所三年施工書記不是很，螢幕加快畢業生魯蛇寵物碩士引進那樣臨床他就神話，蒐集工人走出印刷無關毫無公告無門服裝模糊，較高取消今年，虛擬早就出現這個很有官員等方面南方步驟記憶選手一部，一旦表明，字幕過去.....
                            </p>
                            <a href="#">點我看更多</a>
                        </div>
                    </li>
                </ul>
            </div>

            <div class="camp">
                <h2>營區預約</h2>
                <div class="camp-content">
                    <div id="calendar"></div>
                    <ul class="camp-list">
                        <li class="l1">某某露營區</li>
                        <li class="l2">聖德露營區</li>
                        <li class="l3">亞東路營區</li>
                        <li class="l4">其他露營區</li>
                    </ul>
                    <ul class="camp-img">
                        <li><img class="i1" src="/HiCamp/Member/images/露營區.png" alt="#"></li>
                        <li><img class="i2" src="/HiCamp/Member/images/聖德.jpg" alt="#"></li>
                        <li><img class="i3" src="/HiCamp/Member/images/亞東.jpg" alt="#"></li>
                        <li><img class="i4" src="/HiCamp/Member/images/camping-tent.png" alt=""></li>
                    </ul>
                    <button>快速預約</button>
                </div>

            </div>
			           
        </div>

        <!-- 頁尾 -->
        <footer>
            <div class="infomation">
                <h2><a href="${pageContext.request.contextPath}/Member/ProjectHomePage.jsp"><img src="/HiCamp/Member/images/logo.png" alt="logo"></a></h2>
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
<script src="/HiCamp/Member/js/jquery-3.6.4.js"></script>
<!-- jQuery v1.9.1 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<!-- Moment.js v2.20.0 -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.0/moment.min.js"></script>
<!-- FullCalendar v3.8.1 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.8.1/fullcalendar.min.css" rel="stylesheet" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.8.1/fullcalendar.print.css" rel="stylesheet"
    media="print">
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.8.1/fullcalendar.min.js"></script>

    <script>
        $(function () {
            let index = 0;
            let slideMove = 0;
            $('.slide-dot li').eq(0).css('background', 'white');
            $('.slide-dot li').on('click', function () {
                index = $(this).index();
                moveImg();
            })

            let slideLength = $('.slide-dot li').length;
            // 圖片移動邏輯
            function moveImg() {
                slideMove = 0 - index * 1925;
                $('.slide-img').css('left', slideMove);
                $('.slide-dot li').eq(index).css('background', 'white').siblings().css('background', '#bababa')
            }

            setInterval(autoImg, 4000)
            function autoImg() {
                index++;
                if (index >= slideLength) {
                    index = 0;
                }
                moveImg();
            }

            $(".i2").css("display", "none");
            $(".i3").css("display", "none");
            $(".i4").css("display", "none");

            $(".l1").click(function () {
                $(".i1").css("display", "block");
                $(".i1").parent().siblings().children("img").css("display", "none");
            })
            $(".l2").click(function () {
                $(".i2").css("display", "block");
                $(".i2").parent().siblings().children("img").css("display", "none");
            })
            $(".l3").click(function () {
                $(".i3").css("display", "block");
                $(".i3").parent().siblings().children("img").css("display", "none");
            })
            $(".l4").click(function () {
                $(".i4").css("display", "block");
                $(".i4").parent().siblings().children("img").css("display", "none");
            })

            $('#calendar').fullCalendar();
        })
    </script>
</body>

</html>