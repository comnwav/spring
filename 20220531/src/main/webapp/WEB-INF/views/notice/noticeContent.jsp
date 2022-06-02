<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeContent</title>
</head>
<body>
	<div align="center">
		<div>
			<h1>공지사항</h1>
		</div>
		<div>
			<table id="tb" border="1">
				<tr>
					<th width="70">작성자</th>
					<td>${content.noticeName}</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${content.noticeDate}</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${content.noticeHit}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${content.noticeTitle}</td>
				</tr>
				<tr>
					<th height="400">작성글</th>
					<td>${content.noticeContents}</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td><c:choose>
							<c:when test="${not empty content.noticeAttach}">
								<a href="downLoad.do?saveName=${content.noticeDir}">
									${content.noticeAttach} </a>
							</c:when>
							<c:otherwise>
						등록된 첨부파일이 없습니다.
						</c:otherwise>
						</c:choose></td>
				</tr>
			</table>
		</div>
		<div>
			<button type="button" onclick="location.href='noticeModifyForm.do?noticeId=${content.noticeId}'">수정</button>
			<button type="button" onclick="location.href='noticeList.do'">글목록</button>
			<button type="button"
				onclick="removeCheck()">글삭제</button>
		</div>

	</div>
</body>
<script type="text/javascript">
function removeCheck() {
	if (confirm("해당 글을 지우시겠습니까?") == true) {
		location.href="noticeDelete.do?noticeId=" + ${content.noticeId};
	} else false;
}
</script>
</html>