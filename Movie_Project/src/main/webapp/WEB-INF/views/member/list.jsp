<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member</title>
</head>
<body>
<a href="<c:url value='/adminhome'/>">메인으로가기</a><br><br>
<h3>회원 정보 조회</h3>
${message} <!-- 리다이렉트 메시지 출력 -->
<table border="1">
<tr>
	<th>No.</th>
	<th>이메일ID</th>
	<th>비밀번호</th>
	<th>닉네임</th>
	<th>생년월일</th>
	<th>휴대폰번호</th>
	<th>성별</th>
	<th>선호장르1</th>
	<th>선호장르2</th>
	<th>선호장르3</th>
	<th>type</th>
</tr>
<c:forEach var="member" items="${memberList}">
<tr>
	<td>${member.memberId}</td>
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