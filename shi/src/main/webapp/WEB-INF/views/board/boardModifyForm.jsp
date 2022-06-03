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
        <form id="frm" onsubmit="checkPassword()" method="post">
             <input type="hidden" id="boardId" name="boardId" value="${board.boardId}">
         
             <label for="boardName">작성자</label>
             <input type="text" name="boardWriter" id="boardWriter" value="${board.boardWriter}"><br>
             
             <label for="boardTitle">제목</label>
             <input type="text" name="boardTitle" id="boardTitle" value="${board.boardTitle}"><br>
             
             <label for="boardContents">내용</label>
             <textarea name="boardContents" id="boardContents" cols="30" rows="10" >${board.boardContents}</textarea><br>
             
             <label for="boardPassword">비밀번호</label>
             <input type="text" name="boardPassword" id="boardPassword"><br>
             
             <input type="reset" value="초기화">
             <input type="submit" value="수정">
         </form>
    </div>
</body>
<script>
    function checkPassword() {

        let inputPass = document.getElementById('boardPassword');
        console.log(inputPass.value);
         console.log('${board.boardPassword}');

        if (inputPass.value != '${board.boardPassword}') {
            alert("비밀번호가 일치하지 않습니다!");
        } else {
            frm.boardId.value = '${board.boardId}';
            frm.method = "post"
	        frm.action = "boardModify.do"
	        frm.submit();
        }
    }
</script>
</html>