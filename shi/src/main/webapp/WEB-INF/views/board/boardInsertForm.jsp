<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
      <form action="boardInsert.do" method="post">
            <label for="boardWriter">작성자</label>
            <input type="text" name="boardWriter" id="boardWriter"><br>
            <label for="boardPassword">비밀번호</label>
            <input type="password" name="boardPassword" id="boardPassword"><br>
            <label for="boardTitle">제목</label>
            <input type="text" name="boardTitle" id="boardTitle"><br>
            <label for="boardContents">내용</label>
            <textarea name="boardContents" id="boardContents" cols="30" rows="10"></textarea><br>
            <input type="submit" value="입력">
            <input type="reset" value="초기화">
            <input type="submit" value="수정">
        </form>
</div>
</body>
</html>