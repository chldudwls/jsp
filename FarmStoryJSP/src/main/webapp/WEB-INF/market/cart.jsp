<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	<link rel="stylesheet" href="/FarmStoryJSP/css/farmstory.css">
    <style>
        *{
            margin: 0;
            padding: 0;
            font: normal 12px '맑은고딕';
        }
        *
        ul,ol {list-style: none;}
        a {text-decoration: none; color: black;}
        input,textarea {outline:none}*
        #wrapper {
        width: 100%;
        height: 100%;
    }
        main {
            width: 980px;
            height: auto;
            top: 326px;
            left: 470px;
            margin: 0 auto;
        }
        main .background {
            position: relative;
            width: 980px;
            height: 184px;
            background-image: url(../images/sub_top_bg.jpg);
        }
        main .background > img {
            position: absolute;
            top: 137px;
            left: 10px;
        }
        main > section {
            display: flex;
            width: 980px;
            height: 743px;
        }
        main section aside {
            position: relative;
            width: 176px;
            height: 650px;
            background-image: url('../images/sub_aside_bg_line.png'); /* 라인 이미지 경로 */
            background-repeat: no-repeat;
            background-position: right center;
            background-size: contain;
        }
        .intro {
            margin: 16px 16px;
        }
        .image > img {
            margin-left: 20px;
            margin-top: 10px;
        }
        .sideimage {
            position: relative;
            width: 175px;
            height: 233px;
            background-image: url("../images/sub_aside_bg_lnb.png");
        }
        .sideimage .greet img:nth-child(1) { position:absolute; top :26px; }
        .sideimage .way img:nth-child(1) { position:absolute; top: 61px; }
        
        
        main section article {
            flex-grow: 1;
            height: 743px;
            position: relative;
        }
        .articleNav {
        width: 762px;
        height: 72px;
        margin-left: 40px;
        border-bottom: 1px solid #c2c2c2;
        position: absolute;
        }
        .articleNav > img {
        position: absolute;
        bottom: 5px;
        }
        .articleNav > p {
        position: absolute;
        bottom: 5px;
        right: 0px;
        }
        .articleNav > p > strong {
        color : rgb(124, 165, 64)
        }
        
        .all {
            width: 95.2px;
            height: 14px;
            position: absolute;
            top: 113px;
            left: 40px;
            white-space: nowrap;
        }
        .cart {
            width: 762px;
            height: 332px;
            border-top: 1px solid black;
            border-bottom: 1px solid black;
            border-collapse: collapse;
            position: absolute;
            top: 139px;
            left: 40px;
        }
        .cart thead {
            width: 762px;
            height: 38px;
            border-bottom: 1px solid  rgb(199, 199, 199);
            background-color: #EEEEEE;
            border-collapse: collapse;
            box-sizing: border-box;
        }
        .cart thead #tt {
            width: 76.19px;
            height: 38px;
            
        }
        .cart thead th:nth-of-type(2) {
            width: 80px;
            height: 38px;
            
        }
        .cart thead th:nth-of-type(4) {
            width: 148.69px;
            height: 38px;
            
        }
        .cart tbody {
            width: 762px;
            height: 293px;
            text-align: center;
            
        }
        .cart > tbody > tr:nth-of-type(2){
            border-top: 1px solid rgb(199, 199, 199);
            border-bottom: 1px solid rgb(199, 199, 199);
        }
        .cart > tbody > tr:nth-of-type(3){
            border-bottom: 1px solid rgb(199, 199, 199);
        }

        .cart > tbody > tr > td > a > img {
            max-width: 100%;
            height: auto;
            
        }
        
        .cart tbody #dd {
            width: 76.19px;
            height: 85px;
            
        }
        .cart tbody th:nth-of-type(2) {
            width: 80px;
            height: 85px;
           
        }
        .cart tbody th:nth-of-type(4) {
            width: 148.69px;
            height: 85px;
            
        }
        
        
        
        .total {
            width: 304.8px;
            height: 262px;
            position: relative;
            top: 481px;
            left: 497.2px;
            border: 1px solid rgb(124, 124, 124);
            box-sizing: border-box;
        }
        .downtable {
            width: 290.8px;
            height: 201px;
            position: absolute;
            top: 7px;
            left: 6px;
            border-top: 1.5px solid rgb(0, 0, 0);
            border-bottom: 1.5px solid rgb(0, 0, 0);
            box-sizing: border-box;
            border-collapse: collapse;
        }
        .downtable > caption {
            position: absolute;
            width: 48.2px;
            height: 14px;
            top: 7px;
            left: 121.39px;
        }
        .downtable tbody {
            position: absolute;
            width: 286.8px;
            height: 166px;
            top: 32px;
            left: 2px;
        }
        .downtable > tbody > tr {
            width: 286.8px;
            height: 28px;
           
            
            
            
        }
        .downtable > tbody > tr > td:nth-child(1) {
            width: 143.4px;
            padding-left: 10px;
            line-height: 12.48px;
            font-size: 12px;
            font-weight: 550;
        }
        .downtable > tbody > tr > td:nth-child(2) {
            width: 143.4px;
            padding-left: 80px;
            line-height: 12.48px;
            font-size: 12px;
            font-weight: 400;
        }
        .downtable > tbody> tr:nth-of-type(6) > td:nth-of-type(2) {
            color: red;
            font-weight: bold;
        }

        .total input[type=button]{
            width: 290.8px;
            height: 37px;
            position: absolute;
            top: 218px;
            left: 6px;
            background-color: #960D1A;
            color: white;
            border: none;
            cursor: pointer;
        }

        article > a> input[type=button]{
            position: absolute;
            width: 60px;
            height: 29px;
            top: 481px;
            left: 40px;
            background-color: #960D1A;
            color: white;
            cursor: pointer;
            border: none;
        }
    </style>

</head>
<body>
<%@ include file="/css/_header.jsp"%>
    <main>
        <div class="background">
            <img src="../images/sub_top_tit2.png" alt="1">
        </div>
        <section>
            <aside>
                <img src="../images/sub_aside_cate2_tit.png" alt="장보기" class="intro">
            <ul class="sideimage">
                <li><a href="./introduction.html" class="greet"><img src="../images/sub_cate2_lnb1_ov.png" alt="2"></a></li>
            </ul>
        </aside>
            <article>
                <nav class="articleNav">
                    <img src="../images/sub_nav_tit_cate2_tit1.png" alt="장보기">
                    <p><img src="../images/sub_page_nav_ico.gif" alt="navIcon"> HOME > 장보기 > <strong>장보기</strong></p>
                </nav>
                <div class="all"><a href="#">장바구니 전체(10)</a></div>
                <table class="cart">
                    <thead>
                        <tr>
                            <th id="tt"><input type="checkbox"></th>
                            <th>이미지</th>
                            <th id="tt">종류</th>
                            <th>상품명</th>
                            <th id="tt">수량</th>
                            <th id="tt">할인</th>
                            <th id="tt">포인트</th>
                            <th id="tt">가격</th>
                            <th id="tt">소계</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="9" style="color: #8d8d8d;">장바구니에 상품이 없습니다.</td>
                        </tr>
                        <tr>
                            <td id="dd"><input type="checkbox" name="selectedItems"></td>
                            <td><a href="#"><img src="../images/market_item1.jpg" alt="사과"></a></td>
                            <td id="dd">과일</td>
                            <td><a href="#" style="font-weight: bold;">사과 500g</a></td>
                            <td id="dd">1</td>
                            <td id="dd">10%</td>
                            <td id="dd">40p</td>
                            <td id="dd">4,000원</td>
                            <td id="dd"><span style="font-weight: bold;">3,600</span>원</td>
                        </tr>
                        <tr>
                            <td id="dd"><input type="checkbox"></td>
                            <td><a href="#"><img src="../images/market_item1.jpg" alt="사과2"></a></td>
                            <td id="dd">과일</td>
                            <td><a href="#" style="font-weight: bold;">사과 500g</a></td>
                            <td id="dd">1</td>
                            <td id="dd">10%</td>
                            <td id="dd">40p</td>
                            <td id="dd">4,000원</td>
                            <td id="dd"><span style="font-weight: bold;">3,600</span>원</td>
                        </tr>
                        <tr>
                            <td id="dd"><input type="checkbox"></td>
                            <td><a href="#"><img src="../images/market_item1.jpg" alt="사과3"></a></td>
                            <td id="dd">과일</td>
                            <td><a href="#" style="font-weight: bold;">사과 500g</a></td>
                            <td id="dd">1</td>
                            <td id="dd">10%</td>
                            <td id="dd">40p</td>
                            <td id="dd">4,000원</td>
                            <td id="dd"><span style="font-weight: bold;">3,600</span>원</td>
                        </tr>
                    </tbody>
                </table>
                <a href=""><input type="button" value="선택삭제"></a>
                <div class="total">
                    <table class="downtable">
                        <caption>전체합계</caption>
                        <tbody>
                            <tr>
                                <td>상품수</td>
                                <td>1</td>
                            </tr>
                            <tr>
                                <td>상품금액</td>
                                <td>27,000원</td>
                            </tr>
                            <tr>
                                <td>할인금액</td>
                                <td>5,000원</td>
                            </tr>
                            <tr>
                                <td>배송비</td>
                                <td>5,000원</td>
                            </tr>
                            <tr>
                                <td>포인트</td>
                                <td>4,000원</td>
                            </tr>
                            <tr>
                                <td>전체주문금액</td>
                                <td>22,000</td>
                            </tr>
                        </tbody>
                    </table>
                    <a href=""><input type="button" value="주문하기"></a>
                </div>
            </article>
        </section>
    </main>
<%@ include file="/css/_footer.jsp"%>
</body>
</html>