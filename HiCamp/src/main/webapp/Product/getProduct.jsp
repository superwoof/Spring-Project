<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>登露HiCamp</title>
    <link rel="stylesheet" href="/HiCamp/Product/css/project2.css">
    
    <style>
    .content{
    	height: 80vh;
    }
     .insert {
	                    /* background-color: #f3b1b1; */
	                    /* margin-left: 50px; */
	                    margin-bottom: 10px;
	                    width: 100%;
	                    padding: 10px;
	                    display: block;
	                    justify-content: center;
	                    align-items: center;
                }

                legend {
                    border-bottom: 2px solid black;
                    text-align: center;
                    font-size: large;

                }

                .tab {
                    width: 100%-20px;
                    /* background: #faf8f8; */
                    margin-top: 20px;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    text-align: center;
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
                #type {
		            width: 70px;
		            /*background-color: transparent;*/
		            padding: 2px;
		            padding-left: 5px;
		        }

                input,textarea {
                    margin-left: 10px;
                    margin-bottom: 5px;
                    resize: none;
            		overflow: auto;
                    
                }

                h2 {
                    /* background-color: #fff; */
                    display: flex;
                    justify-content: center;
                    align-items: center;
                }

                .btn {
                    width: 100%;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                }
                button,
                .input1 {
                    background-color: #9cc9ec;
                    padding: 4px 8px;
                    border-radius: 5px;
                    font-size: 14px;
                    margin: 10px 10px;
                    cursor: pointer;
                }
                button {
                    margin: 10px 10px;
                }
                tr,td {
                	margin: 10px 5px;
                }
                
                .trno input
                {
                    margin-left: 10px;
                    margin-right: 0px;
                    height: 25px;
                    width: 25px;
                    padding-left: 10px;
                    border: none;
                    border-radius: 50%;
                    background-color: lightgray;
                }

                .trno input:focus {
                    outline: none;
                }
                #productInfo1  {
                display: none;
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
                        <li class="content_member">
                            <a href="/HiCamp/SearchAllMember">會員編輯</a>
                        </li>
                        <li><a href="#">論壇編輯</a></li>
                        <li><a href="/HiCamp/GetAllProduct">商品編輯</a></li>
                        <li><a href="#">行程編輯</a></li>
                        <li><a href="#">評論編輯</a></li>
                    </ul>
                </nav>
            </aside>
            <article>
                    <div class="insert">
                        <legend>
                            <h2>查詢商品</h2>
                        </legend>

                        <div class="tab">

                            <jsp:useBean id="product" scope="request" class="hiCampBean.ProductBean" />
                            <form method="post" action="./UpdateProduct">
                                <table>

                                    <tr class="trno">
                                        <td>商品編號
                                        <td><input type="text" readonly value="${product.productNo }" name="productNo">
                                    <tr>
                                        <td>商品類型
                                        <td><label for="" class="t1"></label>
					                        <select name="productType" id="type">
					                            <option value="服飾">服飾</option>
					                            <option value="配件">配件</option>
					                            <option value="露營">露營</option>
					                            <option value="登山健行">登山健行</option>
					                        </select>

                                    <tr>
                                        <td>商品名稱
                                        <td><input type="text" value="${product.productName }" name="productName">
                                    <tr>
                                        <td>金額
                                        <td><input type="text" value="${product.productPrice }" name="productPrice">
                                    <tr>
                                        <td>數量
                                        <td><input type="text" value="${product.productQuantity }" name="productQuantity">
                                    <tr>
                                        <td>介紹<input type="text" value="${product.productInfo }" name="productInfo1" id="productInfo1">
                                        <td><textarea name="productInfo" id="productInfo" rows="4">${product.productInfo }</textarea>
                                    <tr>
                                        <td>狀態
                                        <td><select name="productStutas" id="type">
					                            <option value="上架">上架</option>
					                            <option value="未上架">未上架</option>
					                            <option value="下架">下架</option>
					                        </select>
                                </table>
                                <input class="input1" type="submit" value="修改此商品" />
                            </form>
                        </div>
                    </div>
                   <div class="btn">

                        <button id="btn">刪除此商品</button>
                        <a href="./GetAllProduct">
                            <button>回商品後台管理</button>
                        </a>
                    </div>
                    </article>
                 </div> 
        <!-- 頁尾 -->
        <footer>
            <div class="infomation">
                <h2><a href="./project2.html"><img src="/HiCamp/Product/images/logo.png" alt="logo"></a></h2>
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
                document.addEventListener("DOMContentLoaded", function () {
                    function changeText(){
                    	document.getElementById("prosuctInfo").value=document.getElementById("prosuctInfo1").value;
                    }
                	
                	const btn = document.getElementById("btn");

                    btn.addEventListener("click", function () {
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
                                            window.location.href = "./DeleteProduct"
                                        })
                                }
                            })
                            ;
                    });
                });
            </script>
</body>
</html>