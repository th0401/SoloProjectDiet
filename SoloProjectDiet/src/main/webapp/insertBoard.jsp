<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 등록창</title>
</head>
<body>
<h2>글 등록창</h2>
<hr>
<br>
<form action="insertBoard.do" method="post">
	<table border="1">
	<input type="hidden" name="writer" value="${uVO.name}">
		<tr>
			<td>글 제목</td>
			<td><input type="text" name="title"></td>
		</tr>
		<tr>
			<td>글 내용</td>
			<td><input type="text" name="content"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="글 작성하기"></td>
		</tr>
	</table>
</form>

<a href="main.do">메인으로 가기</a>

</body>
</html>