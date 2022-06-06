<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
    </head>

    <body>
        <div align="center">
            <form action="boardInsert.do" method="post">

                <table border="1">
                    <tr>
                        <th width="100"><label for="boardWriter">작성자</label></th>
                        <td width="150"><input type="text" name="boardWriter" id="boardWriter" style="width:150px"></td>
                        <th width="100"><label for="boardPassword">비밀번호</label></th>
                        <td width="150"><input type="password" name="boardPassword" id="boardPassword"
                                style="width:150px"></td>
                    </tr>
                    <tr>
                        <th><label for="boardTitle">제목</label></th>
                        <td colspan="3"><input type="text" name="boardTitle" id="boardTitle" style="width:400px"></td>
                    </tr>
                    <tr>
                        <th><label for="boardContents">내용</label></th>
                        <td colspan="3"><textarea name="boardContents" id="boardContents" cols="30" rows="10"
                                style="width:400px"></textarea></td>
                    </tr>
                    <tr>
                        <th><label for="boardPassword">비밀번호</label></th>
                        <td colspan="3"><input type="password" name="boardPassword" id="boardPassword"></td>
                    </tr>
                </table>
                <input type="submit" value="입력">
                <input type="reset" value="초기화">
            </form>
        </div>
    </body>

    </html>