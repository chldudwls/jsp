<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
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
		
		.titleEvent img {
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
		
		.market_ListSet img {
			width: 60px;
			height: 60px;
		}
		/* container 스타일 */
		.container {
			display: flex;
			margin: 20px;
		}
		
		/* table 스타일 */
		table {
			width: 100%;
			border-collapse: collapse;
			background-color: #fff;
			text-align: center;
		}
		
		thead {
			padding: 10px;
			background-color: #EEE;
			border-top: 1px solid #111;
		}
		
		tbody tr:last-child {
			border-bottom: 1px solid #111;
		}
		
		tr {
			border-bottom: 1px solid #EEEEEE;
		}
		
		tr td:nth-child(2) {
			color: #777;
		}
		
		tr td:nth-child(3) {
			text-align: left;
		}
		
		tr td:nth-child(5) {
			font-size: 9px;
		}
		
		th, td {
			padding: 10px;
			text-align: center;
		}
		
		td del:nth-child(3) {
			font-size: 12px;
		}
		
		.listnumber {
			text-align: center;
		}
		
		.listnumber :hover {
			opacity: 0.9;
			text-decoration: underline;
		}
		
		.tableContainer {
			display: flex;
			justify-content: space-between; /* 테이블 사이의 공간을 균등하게 분배 */
			margin-top: 20px; /* 필요에 따라 여백 추가 */
		}
		
		.orderInformation {
			width: 448px;
			height: 440px;
			margin-right: 10px; /* 오른쪽 테이블과의 간격 */
		}
		
		.orderInformation caption {
			text-align: left;
			padding-left: 10px;
			padding-bottom: 10px;
		}
		
		.orderInformation tr td:first-child {
			background-color: #F7F7F7;
		}
		
		.orderInformation tr {
			border-bottom: 1px solid #D7D7D7;
		}
		
		.orderInformation tr:first-child {
			border-top: 1px solid #BE0808;
		}
		
		.downtable {
			width: 305px;
			height: 209px;
			border: 1px solid #D7D7D7;
			box-sizing: border-box;
			border-collapse: collapse;
		}
		
		.downtable thead {
			padding: 10px;
			background-color: #EEE;
			border: none;
			border-bottom: 1px solid #111;
		}
		
		.downtable tr {
			border: none; /* 다른 모든 경계선을 없앰 */
			background-color: #fff;
		}
		
		.orderInformation td {
			text-align: left; /* 왼쪽 정렬 */
		}
		
		.downtable td {
			text-align: left; /* 왼쪽 정렬 */
			padding: 8px;
		}
		
		.redbutton {
			background-color: #960D1A;
			color: white;
			border: none;
			padding: 10px 20px;
			cursor: pointer;
			width: 100%;
			box-sizing: border-box;
		}
		
		.full-width {
			width: 100%;
			box-sizing: border-box;
		}
		
		.total-amount {
			color: red;
		}
		
		.orderInformation input[type="text"] {
			margin-bottom: 3px; /* 입력 필드 간의 여백 추가 */
		}
	</style>
	<link rel="stylesheet" href="/FarmStoryJSP/css/farmstory.css">
</head>

<body>
	<div id="wrapper"></div>
	<%@ include file="/css/_header.jsp"%>
	<main>
		<div class="titleEvent">
			<img src="/FarmStoryJSP/images/sub_top_tit2.png" alt="">
		</div>
		<section class="mainSection">
			<aside class="mainAside">
				<img src="/FarmStoryJSP/images/sub_aside_cate2_tit.png" alt="Event" class="eventList">
				<ul class="asideList">
					<li><a href="#"><img src="/FarmStoryJSP/images/sub_cate2_lnb1_ov.png" alt=""></a></li>
				</ul>
			</aside>
			<div class="container">
				<section>
					<article class="mainArticle">
						<nav class="articleNav">
							<img src="/FarmStoryJSP/images/sub_nav_tit_cate2_tit1.png" alt="event">
							<p>
								<img src="/FarmStoryJSP/images/sub_page_nav_ico.gif" alt="navIcon">
								HOME > 장보기 > <strong>장보기</strong>
							</p>
						</nav>
						<p>전체(10) | 과일 | 야채 | 곡류</p>

						<table>
							<thead>
								<tr>
									<th>이미지</th>
									<th>종류</th>
									<th>상품명</th>
									<th>수량</th>
									<th>할인</th>
									<th>포인트</th>
									<th>가격</th>
									<th>소계</th>
								</tr>
							</thead>
							<tbody class="market_ListSet">
								<tr>
									<td><img src="/FarmStoryJSP/images/market_item1.jpg" alt="사과 500g"></td>
									<td>과일</td>
									<td><a href="#">사과 500g</a></td>
									<td>1</td>
									<td>10%</td>
									<td>40p</td>
									<td>4,000</td>
									<td>3,600원</td>
								</tr>
								<tr>
									<td><img src="/FarmStoryJSP/images/market_item1.jpg" alt="사과 500g"></td>
									<td>과일</td>
									<td><a href="#">사과 500g</a></td>
									<td>1</td>
									<td>10%</td>
									<td>40p</td>
									<td>4,000</td>
									<td>3,600원</td>
								</tr>
								<tr>
									<td><img src="/FarmStoryJSP/images/market_item1.jpg" alt="사과 500g"></td>
									<td>과일</td>
									<td><a href="#">사과 500g</a></td>
									<td>1</td>
									<td>10%</td>
									<td>40p</td>
									<td>4,000</td>
									<td>3,600원</td>
								</tr>

							</tbody>
						</table>
						<div class="tableContainer">
							<!-- 새로운 컨테이너 추가 -->
							<table class="orderInformation">
								<caption>주문정보 입력</caption>
								<tr>
									<td>주문자</td>
									<td><input type="text"></td>
								</tr>
								<tr>
									<td>휴대폰</td>
									<td><input type="text"></td>
								</tr>
								<tr>
									<td>포인트사용</td>
									<td>
										<input type="text" placeholder="포인트 입력">
										<input type="button" value="사용하기"><br>
										<span>사용가능 2,000</span>
									</td>
								</tr>
								<tr>
									<td>배송주소</td>
									<td>
										<input type="text" placeholder="주소 입력">
										<img src="/FarmStoryJSP/images/btn_post_search.gif"><br>
										<input type="text" placeholder="기본주소 검색" class="full-width"><br>
										<input type="text" placeholder="상세주소 검색" class="full-width">
									</td>
								</tr>
								<tr>
									<td>결제방법</td>
									<td>
										<label><input type="radio" name="option" value="1">계좌이체</label>
										<label><input type="radio" name="option" value="2">신용카드</label>
										<label><input type="radio" name="option" value="3">체크카드</label>
										<label><input type="radio" name="option" value="4">휴대폰</label>
									</td>
								</tr>
								<tr>
									<td>기타</td>
									<td><textarea style="resize: none;" class="full-width"></textarea></td>
								</tr>
							</table>
							<div class="finalchecktable">
								<table class="downtable">

									<thead>

										<tr>
											<th colspan="2" class="table-title">최종결제정보</th>
										</tr>
									</thead>
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
											<td>포인트사용</td>
											<td>2,000P</td>
										</tr>
										<tr>
											<td>포인트적립</td>
											<td>400P</td>
										</tr>
										<tr class="total-row">
											<td>전체주문금액</td>
											<td><p class="total-amount">22,000원</p></td>
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<td colspan="2"><input type="button" class="redbutton"
												value="결제하기"></td>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
						<!-- 컨테이너 종료 -->
				</section>

			</div>

		</section>

	</main>
	<%@ include file="/css/_footer.jsp"%>
</body>

</html>