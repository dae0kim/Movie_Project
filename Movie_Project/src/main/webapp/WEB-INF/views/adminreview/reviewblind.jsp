<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review</title>
</head>
<body>
<h3>리뷰 숨김</h3>
${review.reviewId}번 리뷰를 숨깁니다. <p>
숨겨진 후 재 공개처리는 어렵습니다.<p>
<form action="./blind" method="post">
<input type="hidden" name="reviewId" value="${review.reviewId}"><br>
<button type="submit">숨김</button>
</form>
</body>
</html>