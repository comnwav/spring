<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
        <form action="noticeModify.do" method="post" enctype="multipart/form-data">
        	<input type="hidden" id="noticeId" name="noticeId" value="${notice.noticeId}">
        
            <label for="noticeName">작성자</label>
            <input type="text" name="noticeName" id="noticeName" value="${notice.noticeName}"><br>
            
            <label for="noticeTitle">제목</label>
            <input type="text" name="noticeTitle" id="noticeTitle" value="${notice.noticeTitle}"><br>
            
            <label for="noticeContents">내용</label>
            <textarea name="noticeContents" id="noticeContents" cols="30" rows="10" >${notice.noticeContents}</textarea><br>
            
            <label for="noticeDate">작성일</label>
            <input type="date" name="noticeDate" id="noticeDate" value="${notice.noticeDate}"><br>
            
            <label for="file">파일</label>
            <input type="file" name="file" id="file"><br>
            
            <input type="submit" value="입력">
            <input type="reset" value="초기화">
            <input type="submit" value="수정">
        </form>
</body>
</html>