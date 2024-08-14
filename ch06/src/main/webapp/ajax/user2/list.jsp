<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>user1 목록</h3>
	<script>
		window.onload = function() {
			
			const table = document.getElementsByTagName('table')[0];
			
			fetch('./proc/getUsers.jsp')
				.then(resp => resp.json())
				.then(data => {
					console.log(data);
					
					for(const user of data){
						console.log(user.uid);
						
						const row = `<tr>
								<td>\${user.uid}</td>
								<td>\${user.name}</td>
								<td>\${user.birth}</td>
								<td>\${user.addr}</td>
								<td>
									<a href='#' class='modify'>수정</a>
									<a href='#' class='delete'>삭제</a>
								</td>
								</tr>`;
								table.insertAdjacentHTML('beforeend', row);
					}
				}).
				catch(err => {
					console.log(err);
				})
			
			document.body.addEventListener('click', function(e) {
				e.preventDefault();
				
				if(e.target.classList.contains('delete')){
					const tr = e.target.closest('tr');
					const uid = tr.children[0].innerText;
					
					fetch('./proc/deleteProc.jsp?uid='+uid)
							.then(response => response.json())
							.then(data => {
								console.log(data)
								if(data.result > 0){
									alert('삭제');
									tr.remove();
								}
							})
							.catch(err => {
								console.log(err);
							});
				}
				
				if(e.target.classList.contains('modify')){
					
					const tr = e.target.closest('tr');
					const uid = tr.children[0].innerText;
					
					location.href = './modify.jsp?uid='+uid
				}
				
			});
			
		}//onload끝
	</script>
	<a href="./register.jsp">등록하기</a>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>주소</th>
			<th>관리</th>
		</tr>
	</table>
</body>
</html>