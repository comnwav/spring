<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table tr:hover {
	cursor: pointer;
	background: gray;
}
</style>
<body>
	<div align="center">
		<div>
			<h1>공지사항 목록</h1>
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
	</div>
	<br />
	<div>
		<table id="tb" border="1">
			<thead>
				<tr>
					<th width="70">순번</th>
					<th width="150">작성자</th>
					<th width="300">제목</th>
					<th width="150">작성일자</th>
					<th width="70">조회수</th>
					<th width="70">첨부파일</th>
				</tr>
			</thead>
			<tbody id="tbody">
				<c:if test="${not empty notices }">
					<c:forEach items="${notices }" var="notice">
						<tr>
							<td>${notice.noticeId}</td>
							<td>${notice.noticeName}</td>
							<td>${notice.noticeTitle}</td>
							<td>${notice.noticeDate}</td>
							<td>${notice.noticeHit}</td>
							<td>${notice.noticeAttach}</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty notices }">
					<tr>
						<td colspan="6" align="center">게시글이 존재하지 않습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>
		<form id="frmHidden">
			<input type="hidden" id="noticeId" name="noticeId">
		</form>
	</div>
	<div>
		<button type="button" onclick="location.href='noticeInsertForm.do'">글등록</button>
	</div>
</body>

<script>
	let list = document.querySelector('tbody');
	list.addEventListener('click', function(e) {
		if (e.target.tagName === 'TD') {
			// console.log(e.target.parentNode.children[0].textContent);
			// console.log(e.target);
			// location.href = 'getContent.do?noticeId='+e.target.parentNode.children[0].textContent;
			frmHidden.noticeId.value = e.target.parentNode.children[0].textContent;
			frmHidden.method = "post"
			frmHidden.action = "getContent.do"
			frmHidden.submit();
		}
	})
	
	let tbody = document.getElementById('tbody')
	function searchList() {
		let data = new FormData(document.getElementById('frm'))

		fetch("ajaxSearchList.do", {
			method : "POST",
			body: data
		})
		.then(res => res.json())
		.then(res => {
			tbody.innerHTML = '';

			let ary = ['noticeId', 'noticeName', 'noticeTitle', 'noticeDate', 'noticeHit', 'noticeAttach'];

			res.forEach(Element => {

				console.log(Element);

				// let tr = document.createElement('tr');
				
				// let id = document.createElement('td');
				// id.innerHTML = Element.noticeId;
				// tr.appendChild(id);

				// let name = document.createElement('td');
				// name.innerHTML = Element.noticeName;
				// tr.appendChild(name);

				// let title = document.createElement('td');
				// title.innerHTML = Element.noticeTitle;
				// tr.appendChild(title);

				// let date = document.createElement('td');
				// date.innerHTML = Element.noticeDate;
				// tr.appendChild(date);

				// let hit = document.createElement('td');
				// hit.innerHTML = Element.noticeHit;
				// tr.appendChild(hit);

				// let dir = document.createElement('td');
				// dir.innerHTML = Element.noticeDir;
				// tr.appendChild(dir);

				// tbody.appendChild(tr);
			})
		})
	}
</script>
</html>
<!-- 
function drawTbTable(dataList) {
      let tbody = document.querySelector('#tb tbody');
      let theadArr = ['noticeId', 'noticeName', 
         'noticeTitle', 'noticeDate', 'noticeDate', 'noticeHit', 'noticeAttach'];

      while(tbody.children[0]){
         tbody.children[0].remove();
      }

      for(let data of dataList) {
         let mtr = document.createElement('tr');
         for(let v in data) {
            if(theadArr.indexOf(v) < 0) {
               continue;
            }
            let mtd = document.createElement('td');
            mtd.innerText = data[v];
            mtr.appendChild(mtd);
         }
         tbody.appendChild(mtr);
      }
   } -->