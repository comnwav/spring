<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<div>
			<h1>게시판</h1>
		</div>
		<div>
			<form id="frm" action="ajaxSearchList.do" method="post">
				<select name="state" id="state">
						<option value="1">전 체</option>
						<option value="2">작성자</option>
						<option value="3">제 목</option>
						<option value="4">내 용</option>
				</select>
				&nbsp;<input type="text" id="key" name="key">
				&nbsp;<button type="button" id="searchBtn" name="searchBtn" onclick="searchList()">검색</button>
			</form>
		</div>
		<div>
			<table>
			<thead>
				<tr>
					<th width="50">No</th>
					<th width="300">제목</th>
					<th width="100">작성자</th>
					<th width="100">작성일</th>
					<th width="50">조회수</th>
				</tr>
			</thead>
			<tbody id="listBody">
				<tr>
					<c:if test="${not empty boards }">
							<c:forEach items="${boards }" var="board">
								<tr onclick="clickTr('${board.boardId}')">
									<td>${board.boardId}</td>
									<td>${board.boardTitle}</td>
									<td>${board.boardWriter}</td>
									<td>${board.boardDate}</td>
									<td>${board.boardHit}</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty boards }">
							<tr>
								<td colspan="6" align="center">게시글이 존재하지 않습니다.</td>
							</tr>
						</c:if>
				</tr>
			</tbody>
			</table>
			<form id="frmHidden">
					<input type="hidden" id="boardId" name="boardId">
			</form>
		</div>
		<div>
			<button type="button" onclick="location.href='boardInsertForm.do'">글쓰기</button>
		</div>
	</div>
	<script type="text/javascript">
function clickTr(data) {
	frmHidden.boardId.value = data;
	frmHidden.method = "post"
	frmHidden.action = "getContent.do"
	frmHidden.submit();
}

			let listBody = document.getElementById('listBody')
			function searchList() {
				let data = new FormData(document.getElementById('frm'))
				console.log(data);
				fetch("ajaxSearchList.do", {
					method: "POST",
					body: data
				})
					.then(res => res.json())
					.then(res => {
						listBody.innerHTML = '';
						let ary = ['boardId', 'boardTitle', 'boardWriter',  'boardDate', 'boardHit'];

						res.forEach(Element => {
							let tr = document.createElement('tr');
							ary.forEach(field => {
								let td = document.createElement('td');
								td.innerHTML = Element[field];
								tr.appendChild(td);
							})
							listBody.appendChild(tr);
						})
					})
			}
</script>
</body>
</html>