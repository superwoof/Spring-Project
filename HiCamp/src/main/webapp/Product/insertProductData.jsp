<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登露HiCamp</title>
    <link rel="stylesheet" href="/HiCamp/Product/css/project2.css">
    <script defer src="./js/project2.js"></script>
    <style>
    .content{
    	height: 80vh;
    }
        .insert {
            /* background-color: #f3b1b1; */
            /* margin-left: 50px; */
            margin-bottom: 10px;
            width: 100%;
            border-radius: 15px;
            padding: 10px;
            /* display: flex; */
            justify-content: center;
            align-items: center;
        }

        legend {
            border-bottom: 2px solid black;
            text-align: center;
            font-size: large;

        }

        .t1 {
            /* width: 300px; */
            float: left;
            /* border: 1px solid red; */
            text-align: right;
            padding-right: 10px;
            margin-left: 20%;
            /* padding-left: 40%; */

        }

        .st1 {
            /* width: 800px; */
            /* border: 3px dashed #6532e6; */
            margin: 20px auto;
            display: flex;
            /* align-content: center;
            align-items: center; */
            text-align: center;
        }

        h2 {
            /* background-color: #fff; */
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .sub {
            /* width: 100%; */
            margin-left: 20px;
            text-align: center;
            font-size: 40px;
        }

        #type {
            width: 100px;
            background-color: transparent;
            padding: 2px;
            padding-left: 5px;
        }
        .btn {
          display: flex;
           justify-content: center;
         }
         button,
                .sub input {
                    background-color: #9cc9ec;
                    padding: 4px 8px;
                    border-radius: 5px;
                    font-size: 14px;
                    margin: 10px 10px;
                    cursor: pointer;
                }

        textarea {
            resize: none;
            overflow: auto;
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
            <form method="post" action="../InsertProduct">
                <div class="insert">
                    <legend>
                        <h2>新增商品</h2>
                    </legend>

                    <div class="st1">
                        <label for="" class="t1">商品型態 :</label>
                        <select name="productType" id="type">
                            <option value="服飾">服飾</option>
                            <option value="配件">配件</option>
                            <option value="露營">露營</option>
                            <option value="登山健行">登山健行</option>
                        </select>
                    </div>
                    <div class="st1">
                        <label for="" class="t1">商品名稱 : </label>
                        <input type="text" name="productName" />
                    </div>
                    <div class="st1">
                        <label for="" class="t1">商品金額 :</label>
                        <input type="text" name="productPrice" />
                    </div>
                    <div class="st1">
                        <label for="" class="t1">商品數量 : </label>
                        <input type="text" name="productQuantity" />
                    </div>
                    <div class="st1">
                        <label for="" class="t1">商品資訊 :</label>
                        <textarea name="prosuctInfo" cols="40" rows="5" placeholder="商品資訊"></textarea>
                    </div>
                    <div class="st1">
                        <label for="" class="t1">商品狀態 :</label>
                        <select name="productStutas" id="type">
                            <option value="上架">上架</option>
                            <option value="未上架">未上架</option>
                            <option value="下架">下架</option>
                        </select>
                    </div>
                    <div class="sub">
                        <input type="submit" value="確定" />
                        <input type="reset" value="取消" />
                    </div>
            	</form>
                </div>
            	</div>
                   <div class="btn">
                        <a href="../GetAllProduct">
                            <button>回商品後台管理</button>
                        </a>
                    </div>
            	
			</article>
        </div>

        <!-- 頁尾 -->
        <footer>
            <div class="infomation">
                <h2><a href="./project2.html"><img src="./images/logo.png" alt="logo"></a></h2>
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