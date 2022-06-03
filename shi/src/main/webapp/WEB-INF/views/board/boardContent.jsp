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
			<table border="1">
				<tr>
					<th width="70">작성자</th>
					<td>${content.boardWriter}</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${content.boardDate}</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${content.boardHit}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${content.boardTitle}</td>
				</tr>
				<tr>
					<th height="400">작성글</th>
					<td>${content.boardContents}</td>
				</tr>
			</table>
		</div>
		<div>
			<button type="button" onclick="location.href='boardModifyForm.do?boardId=${content.boardId}'">수정</button>
			<button type="button" onclick="location.href='boardList.do'">글목록</button>
			<button type="button"
				onclick="removeCheck()">글삭제</button>
		</div>

	</div>
</body>
<script type="text/javascript">
function removeCheck() {

    let password = prompt("비밀번호를 입력하세요!");

    if (password == '${content.boardPassword}') {
        if (confirm("해당 글을 지우시겠습니까?") == true) {
            location.href="boardDelete.do?boardId=" + ${content.boardId};
        } else false;
    } else {
        alert("비밀번호가 일치하지않습니다!")
    }
}
</script>
</html>