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
			<section class="userlist">
				<section>
					<h3>회원목록</h3>
					<article>
						<table>
							<thead>
								<tr>
									<th><input type="checkbox" name="all"></th>
									<th>아이디</th>
									<th>이름</th>
									<th>별명</th>
									<th>이메일</th>
									<th>휴대폰</th>
									<th>등급</th>
									<th>가입일</th>
									<th>확인</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="user" items="${Users}">
								<tr>
									<td><input type="checkbox"></td>
									<td>${user.getUserId()}</td>
									<td>${user.getUserName()}</td>
									<td>${user.getUserNick()}</td>
									<td>${user.getUserEmail()}</td>
									<td>${user.getUserHp()}</td>
									<td><select>
											<option>1</option>
											<option selected>2</option>
											<option>3</option>
									</select></td>
									<td>${user.getUserRegdate()}</td>
									<td><a href="#">[상세확인]</a></td>
								</tr>
							</c:forEach>
								
							</tbody>
						</table>
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
	const now = document.querySelector('a#userlist[href]');
	if (now) {
		now.classList.add("now");
	}
</script>
</html>




