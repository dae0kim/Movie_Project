<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="i18n/member"/>

    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인</title>
		<!--  <script type="text/javascript" src="/resources/js/member.js"></script>-->
		<link href="${pageContext.request.contextPath}/resources/css/body.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainnoticelist.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainnoticeinfo.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header_footer.css">
	    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<!-- jQuery Modal -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
	
	</head>
<body>
<%@ include file="../header.jsp" %>

<div class="wrapper">
  <section class="section_layout">
		<div class ="content1">
			
	
		<form action="<c:url value='/member/adminlogin'/>" method="post" name="loginfrm">	
			<div class="title1">
				<p class="title1_content">관리자 로그인</p>
			</div>
		
				<div>
					<input id="member_id" name="email" title="아이디 입력란" style="height:100% !important;" placeholder="이메일" type="text" value="">			
				</div>
				<div>
					<input id="member_pw" name="password" title="비밀번호 입력란" placeholder="비밀번호" type="password" value="">			
				</div>
				<div class="loginBtn">
					<input type="submit" value="로그인" onclick="return loginCheck()"/>
				</div>
				 
		<script>
		 function loginCheck() {
				/* 아이디 입력상자 : 이름이 loginfrm인 폼 태그 내부에 존재 */
				if (loginfrm.email.value.length == 0) {
					alert("아이디를 입력하세요!")
		 			loginfrm.email.focus();
		 			return false;
		 		}
				
		 		if (loginfrm.password.value == "") {
		 			alert("비밀번호를 입력하세요!")
		 			loginfrm.password.focus();
		 			return false;
		 		}
		 		var pattern = /\s/g; // 공백체크 (탭, 스페이스)
		 		if (loginfrm.password.value.match(pattern)) {
		 			alert("비밀번호는 공백 없이 입력해주세요.");
		 			frm.password.focus();
		 			return false;
		 		}
		 		return true;
			}
		 </script>	

		</form>
		</div>
		</section>
	</div>
	<%@ include file="../footer.jsp" %>	
	</body>
</html>