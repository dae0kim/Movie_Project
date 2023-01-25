<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CoderBy</title>
</head>
<body>
<h1>사용자 목록</h1>
${message} <!-- 리다이렉트 메시지 출력 -->
<a href="<c:url value='/member/insert'/>">신규 사원 정보 입력</a>
<table border="1">
<tr>
	<th>MEMBER_ID</th>
	<th>EMAIL</th>
	<th>PASSWORD</th>
	<th>NICKNAME</th>
	<th>BIRTH_DATE</th>
	<th>PHONE_NUMBER</th>
	<th>GENDER</th>
	<th>FAVORITEGENRE1</th>
	<th>FAVORITEGENRE2</th>
	<th>FAVORITEGENRE3</th>
	<th>MEMBER_TYPE</th>
</tr>
<c:forEach var="member" items="${memberList}">
<tr>
	<td><a href="<c:url value='/member/${member.memberId}'/>">${member.memberId}</a></td>
	<td>${member.email}</td>
	<td>${member.password}</td>
	<td>${member.nickname}</td>
	<td>${member.birthDate}</td>
	<td>${member.phoneNumber}</td>
	<td>${member.gender}</td>
	<td>${member.favoriteGenre1}</td>
	<td>${member.favoriteGenre2}</td>
	<td>${member.favoriteGenre3}</td>
	<td>${member.memberType}</td>
</tr>
</c:forEach>
</table>
</body>
</html>