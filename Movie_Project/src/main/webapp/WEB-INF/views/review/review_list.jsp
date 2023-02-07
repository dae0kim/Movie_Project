<%@ page contentType="text/html; charset=UTF-8"%>
		<h1>리뷰 목록</h1>
		<table border="1">
		<tr>
			<th>filmId</th>
			<th>memberId</th>
			<th>reviewContent</th>
			<th>starScore</th>
			<th>reviewDate</th>
			<th>likeCount</th>
		</tr>
		<c:forEach var="reviewlist" items="${reviewlist}">
		<tr>
			<td><a href="<c:url value='/review/review_list/${reviewlist.filmId}'/>">${reviewlist.filmId}</a></td>
			<td><a href="<c:url value='/review/review_list/${reviewlist.memberId}'/>">${reviewlist.memberId}</a></td>
			<td>${reviewlist.reviewContent}</td>
			<td>${reviewlist.starScore}</td>
			<td>${reviewlist.reviewDate}</td>
			<td>${reviewlist.likeCount}</td>
		</tr>
		</c:forEach>
		</table>
<%@include file="../footer.jsp"%>
