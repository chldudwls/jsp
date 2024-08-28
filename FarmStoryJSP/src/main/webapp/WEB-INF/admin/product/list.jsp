<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
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
							<c:forEach var="product" items="${Products}">
								<tr>
									<td><input type="checkbox"></td>
									<td><img src="/FarmStoryJSP/thumbUploads/${product.proImg2}"></td>
									<td>${product.proNo}</td>
									<td>${product.proName}</td>
									<td>${product.proType}</td>
									<td class="price">${product.proPrice}</td>
									<td>${product.proStock}</td>
									<td>${product.proRdate}</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</article>
					<article>
						<h3>
							<a href="#">선택삭제</a> <a href="/FarmStoryJSP/admin/product/register.do" class="btn">상품등록</a>
						</h3>
					</article>
					<article class="paging">
						<p>
							<c:if test="${PageGroup.start > 1}">
								<a href="?page=${PageGroup.start-1}"> &lt; </a>
							</c:if>
							<c:forEach var="i" begin="${PageGroup.start}" end="${PageGroup.end}">
							<c:if test="${i<=LastPage}">
								<a href="?page=${i}" class="num ${i eq Current?'current':'off'}">[${i}]</a>
							</c:if>
							</c:forEach>
							<c:if test="${PageGroup.end < LastPage}">
								<a href="?page=${PageGroup.end+1}"> &gt; </a>
							</c:if>

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




