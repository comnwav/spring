<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
    </head>

    <body>
        <div align="center">
            <form id="frm" onsubmit="checkPassword()" method="post">
                <input type="hidden" id="boardId" name="boardId" value="${board.boardId}">

                <table border="1">
                    <tr>
                        <th width="100"><label for="boardName">작성자</label></th>
                        <td width="400">${board.boardWriter}</td>
                    </tr>
                    <tr>
                        <th><label for="boardTitle">제목</label></th>
                        <td><input type="text" name="boardTitle" id="boardTitle" value="${board.boardTitle}"
                                style="width:400px"></td>
                    </tr>
                    <tr>
                        <th><label for="boardContents">내용</label></th>
                        <td><textarea name="boardContents" id="boardContents" cols="30" rows="10"
                                style="width:400px">${board.boardContents}</textarea></td>
                    </tr>
                    <tr>
                        <th><label for="boardPassword">비밀번호</label></th>
                        <td><input type="password" name="boardPassword" id="boardPassword"></td>
                    </tr>
                </table>
                <input type="reset" value="초기화">
                <input type="submit" value="수정">
            </form>
        </div>
    </body>
    <script>
        function checkPassword() {

            let inputPass = document.getElementById('boardPassword');

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