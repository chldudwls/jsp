<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	window.onload = function() {
		
		const params = location.href.split('?')[1];
		const value = params.split('=')[1];
		
		
		const form = document.getElementsByTagName('form')[0];
		const btnSubmit = form.submit;
		
		btnSubmit.onclick = (e) => {
			e.preventDefault();
			
			const jsonData = {
					"uid":form.uid.value,
					"name":form.name.value,
					"birth":form.birth.value,
					"addr":form.addr.value
			};
			
			$.ajax({
				method: 'POST',
				url: './proc/modifyProc.jsp',
				data: jsonData,
				success: function(data) {
					console.log(data);
					
					if(data.result > 0){
						alert('수정!')
						location.href = '../user2/list.jsp';
					}
					
				}
			});
			
		}
		fetch('./proc/getUser.jsp?uid'+value)
				.then(resp => resp.json())
				.then(data => {
					console.log(data);
					
					form.uid.value = data.uid;
					form.name.value = data.name;
					form.birth.value = data.birth;
					form.addr.value = data.addr;
				})
				.catch(err => {
					console.log(err);
				});
		
	}

</script>
</head>
<body>
<h3>user1 수정</h3>
	
	<a href="./list.jsp">목록이동</a>
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