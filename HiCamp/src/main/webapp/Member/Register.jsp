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
    <link rel="stylesheet" href="/HiCamp/Member/css/projectRegister.css">
    <script src="/HiCamp/Member/js/registerAddress.js" defer></script>
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
                            <ul>
                                <li>
                                    <a href="#">裝備</a>
                                </li>
                            </ul>
                        </li>
                        <li class="discussion">
                            <a href="#">論壇</a>
                            <ul>
                                <li>
                                    <a href="#">討論</a>
                                </li>
                            </ul>
                        </li>
                        <li class="journey"><a href="#">行程</a></li>
                        <li class="news"><a href="#">露營區</a></li>
                        <li class="connection"><a href="#">聯絡我們</a></li>
                        <li class="member"><a href="/HiCamp/Member/ProjectMemberLogin.jsp">登入</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <!-- 內容 -->
        <div class="content">
            <article>
                <h3>註冊新帳號</h3>
                <form action="/HiCamp/GetMemberInfomation" method="post">
                    <label>
                        姓名<br><input type="text" name="memberName" id="memberName" placeholder="請輸入您的姓名" required>
                    </label>
                    <label>
                        性別
                        <input class="gender" type="radio" name="memberGender" id="memberGender" value="男"
                            required>男
                        <input class="gender" type="radio" name="memberGender" id="memberGender" value="女">女
                    </label>
                    <label>
                        電子信箱<br><input type="email" name="memberEmail" id="memberEmail" placeholder="請輸入您的電子信箱"
                            required>
                            <c:choose>
			                        <c:when test="${requestScope.emailError != null }">
		                       		${requestScope.emailError}
			                      	</c:when>
			              	</c:choose>
                    </label>
                    <label>
                        密碼<br><input type="password" name="memberPassword" id="memberPassword" placeholder="請輸入您的密碼"
                            required>
                    </label>
                    <label>
                        確認密碼<br><input type="password" name="confirm_password" id="confirm_password"
                            placeholder="請再次輸入您的密碼" required>
                            <span id="password_match_message"></span>
                    </label>
                    <label>
                        連絡電話<br><input type="tel" name="memberPhone" id="memberPhone" placeholder="請輸入您的電話" required>
                    </label>
                    <label for="city" class="city">選擇縣市</label>
                    <select name="city" id="city" required>
                        <option value="">請選擇</option>
                        <option value="基隆市">基隆市</option>
                        <option value="台北市">台北市</option>
                        <option value="新北市">新北市</option>
                        <option value="桃園市">桃園市</option>
                        <option value="新竹市">新竹市</option>
                        <option value="新竹縣">新竹縣</option>
                        <option value="苗栗縣">苗栗縣</option>
                        <option value="台中市">台中市</option>
                        <option value="彰化縣">彰化縣</option>
                        <option value="南投縣">南投縣</option>
                        <option value="雲林縣">雲林縣</option>
                        <option value="嘉義市">嘉義市</option>
                        <option value="嘉義縣">嘉義縣</option>
                        <option value="台南市">台南市</option>
                        <option value="高雄市">高雄市</option>
                        <option value="屏東縣">屏東縣</option>
                        <option value="台東縣">台東縣</option>
                        <option value="花蓮縣">花蓮縣</option>
                        <option value="宜蘭縣">宜蘭縣</option>
                        <option value="澎湖縣">澎湖縣</option>
                        <option value="金門縣">金門縣</option>
                        <option value="連江縣">連江縣</option>
                    </select>
                    <label for="district" class="district">選擇鄉鎮區</label>
                    <select name="district" id="district" required>
                        <option value="">請先選擇縣市</option>
                    </select>
                    <label>
                        連絡地址<br><input type="text" name="memberAddress" id="memberAddress" placeholder="請輸入您的地址"
                            required>
                    </label>
                    <label>
                        身分證字號<br><input type="text" name="memberId" id="memberId" pattern="[A-Z][1-2]\d{8}"
                            placeholder="請輸入您的身分證字號" required>
                    </label>
                    <label>
                        生日<br><input type="date" name="memberBirthday" id="memberBirthday" value="2000-01-01"
                            required>
                    </label>
                    <label>
                        緊急聯絡人<br><input type="text" name="memberEmergencyContact" id="memberEmergencyContact"
                            placeholder="請輸入緊急聯絡人姓名" required>
                    </label>
                    <label>
                        聯絡人電話<br><input type="tel" name="memberEmergencyPhone" id="memberEmergencyPhone"
                            placeholder="請輸入聯絡人電話" required>
                    </label>
                    <div class="check">
                        <input type="checkbox" name="check" id="check" required>
                        <p>我已閱讀並同意<a href="#">《個人資料蒐集聲明》</a></p>
                    </div>
                    <div class="button"><button type="submit">送出</button></div>

                </form>
            </article>
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

</body>

</html>