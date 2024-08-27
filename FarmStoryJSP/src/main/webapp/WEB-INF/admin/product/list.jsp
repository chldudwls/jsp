<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Administrator</title>
	<link rel="stylesheet" href="/FarmStoryJSP/css/admin.css">
</head>
<body>
	<div id="wrap">
		<%@ include file="../_header.jsp"%>
		<main>
			<%@ include file="../_aside.jsp"%>
			<section class="prodList">
				<section>
					<h3>상품목록</h3>
					<article>
						<table>
							<thead>
								<tr>
									<th><input type="checkbox"></th>
									<th>사진</th>
									<th>상품번호</th>
									<th>상품명</th>
									<th>구분</th>
									<th>가격</th>
									<th>재고</th>
									<th>등록일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="checkbox"></td>
									<td><img src="/FarmStoryJSP/images/sample_item1.jpg"></td>
									<td>1011</td>
									<td>사과500g</td>
									<td>과일</td>
									<td class="price">4,000</td>
									<td>100</td>
									<td>2023-01-01</td>
								</tr>
							</tbody>
						</table>
					</article>
					<article>
						<h3>
							<a href="#">선택삭제</a> <a href="/FarmStoryJSP/admin/product/register.do">상품등록</a>
						</h3>
						<p>
							<a href="#"> &lt; </a> <b>[1]</b> <a href="#">[2]</a> <a href="#">[3]</a>
							<a href="#">[4]</a> <a href="#">[5]</a> <a href="#"> &gt; </a>
						</p>
					</article>
				</section>
			</section>
		</main>
	</div>
	<%@ include file="../_footer.jsp"%>
</body>
<script>
	const now = document.querySelector('a#prodlist[href]');
	if (now) { now.classList.add("now"); }
</script>
</html>




