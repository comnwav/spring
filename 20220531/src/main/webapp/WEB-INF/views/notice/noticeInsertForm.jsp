<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="noticeInsert.do" method="post" enctype="multipart/form-data">
        <input type="text" name="noticeId" id="noticeId">
        <input type="text" name="noticeName" id="noticeName">
        <input type="text" name="noticeTitle" id="noticeTitle">
        <textarea name="noticeContents" id="noticeContents" cols="30" rows="10"></textarea>
        <input type="date" name="noticeDate" id="noticeDate">
        <input type="file" name="file" id="file">
		<input type="submit" value="입력">
		<input type="reset" value="초기화">
		<input type="submit" value="수정">
	</form>
</body>
</html>