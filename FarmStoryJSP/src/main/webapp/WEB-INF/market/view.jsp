<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="/FarmStoryJSP/css/farmstory.css">
    <title>상품상세보기</title>
    <style>
        main {
            height: auto;
            width: 980px;
            margin: 0 auto;
        }

        strong {
            font-weight: bold;
        }

        del {
            color: #777;
            font-size: 9px;
        }

        .titleEvent {
            width: 980px;
            height: 184px;
            background-image: url("../images/sub_top_bg.jpg");
            position: relative;
        }

        .titleEvent>img {
            position: absolute;
            left: 10px;
            bottom: 10px;
        }

        .mainSection {
            display: flex;
        }

        .mainAside {
            width: 176px;
            height: 650px;
            box-sizing: border-box;
            background-image: url("../images/sub_aside_bg_line.png");
            background-repeat: no-repeat;
            background-position: 169px;
        }

        .mainAside>.eventList {
            margin: 16px 16px;
        }

        .asideList {
            width: 175px;
            height: 233px;
            background-image: url("../images/sub_aside_bg_lnb.png");
            position: relative;
        }

        .asideList>li:nth-child(1) {
            display: inline-block;
            margin-top: 30px;
        }

        .articleNav {
            width: 762px;
            height: 72px;
            margin-left: 0;
            border-bottom: 1px solid #c2c2c2;
            position: relative;
        }

        .articleNav>img {
            position: absolute;
            bottom: 5px;
        }

        .articleNav>p {
            position: absolute;
            bottom: 5px;
            right: 0px;
        }

        .articleNav>p>strong {
            color: rgb(124, 165, 64)
        }

        .mainArticle>p {
            margin-top: 20px;
            margin-bottom: 10px;
        }

        .mainArticle {
            margin: 0 0;
            width: 762px;
            height: auto;
            box-sizing: border-box;
        }

        /* container 스타일 */
        .container {
            display: flex;
            margin: 20px;
            margin-bottom: 1px;
        }

        /* table 스타일 */
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            text-align: center;
            border-top: 2px solid #E7E7E7;
            border-bottom: 2px solid #E7E7E7;
        }

        thead {
            padding: 10px;
            background-color: #EEE;
            
        }
        .colorRed{
            color: #C20A0A;
            font-weight: 700;
        }

        th,
        td {
            padding: 10px;
            text-align: left;
        }
        span{
            color: #777;
        }

        .listnumber {
            text-align: center;
        }

        .listnumber :hover {
            opacity: 0.9;
            text-decoration: underline;
        }

        /* 추가된 스타일 */
        .product-info {
            display: flex;
            align-items: flex-start;
            gap: 20px;
        }

        .product-info img {
            width: 300px;
            height: auto;
        }

        .product-details {
            flex-grow: 1;
        }

        .product-details table {
            width: 100%;
        }

        /* 버튼 스타일 */
        .button-container {
            display: flex;
            justify-content: flex-end;
            gap: 3px;
            margin-top: 10px; 
        }

        .button-container button {
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            
        }

        .cart-button {
            background-color: #769B0A;
            color: white;
        }

        .buy-button {
            background-color: #960D1A;
            color: white;
        }
        /* 제목 스타일 */
        .section-title {
            font-size: 16px;
            font-weight: 700;
            text-align: left;
            margin-top: 20px;
            margin-bottom: 10px;
        }
        .changeInformation tr{
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            text-align: center;
            border-top: 1px solid #E7E7E7;
            border-bottom: 1px solid #E7E7E7;
        }
        .changeInformation tr th{
            border-right: 1px solid #E7E7E7;
        }
        .countfruitDesign{
            
            border-radius: 3px;
        }
    </style>
</head>

<body>
<%@ include file="/css/_header.jsp"%>
    <main>
        <div class="titleEvent"><img src="../images/sub_top_tit2.png" alt=""></div>
        <section class="mainSection">
            <aside class="mainAside">
                <img src="../images/sub_aside_cate2_tit.png" alt="Event" class="eventList">
                <ul class="asideList">
                    <li><a href="#"><img src="../images/sub_cate2_lnb1_ov.png" alt=""></a></li>
                </ul>
            </aside>
            <div class="container">
                <section>
                    <article class="mainArticle">
                        <nav class="articleNav">
                            <img src="../images/sub_nav_tit_cate2_tit1.png" alt="event">
                            <p><img src="../images/sub_page_nav_ico.gif" alt="navIcon"> HOME > 장보기 >
                                <strong>장보기</strong></p>
                        </nav>
                        <p class="section-title">기본정보</p>
                        <div class="product-info">
                            
                            <img src="../images/market_item_thumb.jpg" alt="상품 이미지">
                            <div class="product-details">
                                <table>
                                    <tr>
                                        <th>상품명</th>
                                        <td>딸기 500g</td>
                                    </tr>
                                    <tr>
                                        <th>상품코드</th>
                                        <td>01</td>
                                    </tr>
                                    <tr>
                                        <th>배송비</th>
                                        <td>5,000원 <span>3만원이상 무료배송</span></td>
                                    </tr>
                                    <tr>
                                        <th>판매가격</th>
                                        <td>4,000원</td>
                                    </tr>
                                    <tr>
                                        <th>구매수량</th>
                                        <td><input type="text" size="5" maxlength="5" class="countfruitDesign" name="countfruit" value="1"></td>
                                    </tr>
                                    <tr>
                                        <th>합계</th>
                                        <td class="colorRed">4,000원</td>
                                    </tr>
                                </table>
                                <div class="button-container">
                                    <button class="cart-button">장바구니</button>
                                    <button class="buy-button">바로구매</button>
                                </div>
                            </div>
                        </div>
                        
                        <div>
                            <p class="section-title">상품설명</p>
                            <img src="../images/market_detail_sample.jpg" alt="">
                        </div>
                    </article>
                    <div>
                        <p class="section-title">배송정보</p>
                        <p>입금하신 이후 택배송장버호는 SMS(문자서비스)를 통해 고객님께 안해해드립니다.</p>
                        <p class="section-title">교환/반품</p>
                        <table class="changeInformation">
                            <tr>
                                <th>교환 반품이 가능한 경우</th>
                                <td>팜스토리 상품에 하자가 있거나 불량인 경우<br>
                                    채소, 과일, 양곡등의 심품은 만1일 이내<br>
                                    기타 상품은 수령일로부터 영업일 기준 일주일 이내<br>
                                    받으신 상품이 표시사항과 다른 경우에는 받으신 날로부터 일주일 이내
                                </td>
                            </tr>
                            <tr>
                                <th>교환 반품이 불가능한 경우</th>
                                <td>신선 식품의 경우 단순히 마음에 들지 않는 경우<br>
                                    단순 변심으로 상품이 가치가 훼손돼서 판매가 어려운 경우<br>
                                </td>
                            </tr>
                        </table>
                    </div>
                </section>
                
            </div>
           
        </section>
        
    </main>
<%@ include file="/css/_footer.jsp"%>
</body>
</html>
