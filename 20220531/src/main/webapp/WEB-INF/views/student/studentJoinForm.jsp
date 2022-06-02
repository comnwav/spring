<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<div>
			<h1>회원가입</h1>
		</div>

		<form id="frm" action="studentJoin.do" onsubmit="formCheck()"
			method="post">
			<div>
				<table border="1">
					<tr>
						<th width="150">아이디</th>
						<td width="380">
							<!-- id : js에서 사용, name : java 에서 사용 반드시 둘다 적어야된다 --> <input
							type="text" id="id" name="id" required="required">&nbsp;&nbsp;
							<button type="button" id='btn' onclick="idCheck()">중복체크</button>
							<input type="hidden" id="checkId" value="N">
						</td>
					</tr>
					<tr>
						<th width="150">패스워드</th>
						<td><input type="password" id="password" name="password"
							required="required"></td>
					</tr>
					<tr>
						<th width="150">패스워드확인</th>
						<td width="250"><input type="password" id="passwordCheck"
							required="required"></td>
					</tr>
					<tr>
						<th width="150">이름</th>
						<td><input type="text" id="name" name="name"
							required="required"></td>
					</tr>
					<tr>
						<th width="150">주소</th>
						<td><input type="text" size="50" id="address" name="address"
							required="required"></td>
					</tr>
					<tr>
						<th width="150">전화번호</th>
						<td><input type="tel" id="tel" name="tel"></td>
					</tr>
					<tr>
						<th width="150">생년월일</th>
						<td><input type="date" id="birthday" name="birthday"
							required="required"></td>
					</tr>
					<tr>
						<th width="150">나이</th>
						<td><input type="text" id="age" name="age"
							required="required"></td>
					</tr>
				</table>
			</div>
			<br>
			<div>
				<input type="submit" value="회원가입">&nbsp;&nbsp; <input
					type="reset" value="취소">
			</div>
		</form>
	</div>
	<script type="text/javascript">
    function formCheck() {
    	if (frm.checkId.value == 'N') {
    		alert("아이디 중복체크를 좀 해줘 부탁이야 제발")
    	}
    	if(frm.password.value != frm.passwordCheck.value) {
    		alert("패스워드가 일치하지 아니하지 아니한가?");
    		frm.password.value = "";
    		frm.password1.value = "";
    		frm.password.focus();
    		return false;
    	}
    	return true;
    }
    
    function idCheck() {
    	let id = frm.id.value;
    	let url = 'ajaxIdCheck.do?id='+id;
    	
    	fetch(url, {
    		method : 'GET'})
    		.then(res => {
    			return res.text();
    		})
    		.then(res => {
    			if(res != 'N') {
    				alert(id + '는 사용 할 수 있는 아이디 입니다.');
    				const target = document.getElementById('btn');
    				target.disabled = true;
    				frm.checkId.value = res; // 넘어온 값으로 checkId값을 변경
    			} else {
    				alter(id + '는 사용 할 수 없습니다.');
    				frm.id.value = "";
    				frm.id.focus();
    			}
    		})
    }
    </script>
</body>
</html>