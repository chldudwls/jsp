<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	window.onload = function() {
		
		const btnSubmit = docment.getElementsByName('submit')[0];
		const formUser = document.getElementByTagName('form')[0];
		
		btnSubmit.onclick = (e) => {
			e.prevetDefault();
			
			const uid = formUser.uid.value;
			const name = formUser.name.value;
			const birth = formUser.birth.value;
			const addr = formUser.addr.value;
			
			const jsonData = {
					"uid":uid,
					"name":name,
					"birth":hp,
					"addr":addr
			};
			console.log(jsonData);
			
			fetch('./proc/regiserProc.jsp',{
				method: 'POST',
				headers:{'Content-Type' : 'application/json'},
				body: JSON.stringify(jsonData)
			})
					.then(resp => resp.json())
					.then(data => {
						console.log(data);
						
						if(data.result > 0){
							alert('승공');
							location.href = './list.jsp';
						}else{
							alert('실패');
						}
					})
					.catch(err => {
						console.log(err);
					})
		}
	}//끝

</script>
</head>
<body>
<h3>user1 수정</h3>
	
	<a href="/ch06/ajax/user2/list.jsp">목록</a>
	<form action="#" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid" value="" readonly/></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value=""/></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="date" name="birth" value=""/></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" value=""/></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" name="submit" value="수정하기"/>
				</td>
			</tr>		
		</table>
	
	</form>
</body>
</html>