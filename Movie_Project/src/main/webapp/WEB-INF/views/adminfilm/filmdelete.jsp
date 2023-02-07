<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Film Delete</title>
</head>
<body>
<h3>영화 삭제</h3>
[${film.filmTitle}] 영화 정보를 삭제합니다.<p>
삭제된 데이터는 복구할 수 없습니다.<p>
<form action="./delete" method="post">
<input type="hidden" name="filmId" value="${film.filmId}">
<button type="submit">삭제</button>
</form>
</body>
</html>