<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>

<body>
<section class ="search_result_contents_full">
			<section class ="no_search_result_movie">
			<div class="search_result_title_div">
				<div class="search_result_title">"${search_keyword}"검색결과</div>
	<section class= "no_result_page">
		<div class="no_result_info"> 
			<span src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDov…1Nzd6Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K" 
			class="no_result_img">					
			</span>
			<div class="no_result_msg">
				"${search_keyword}"에 관한 결과가 없습니다. 다른 검색어를 입력하세요.
			</div>
			<div class="requestfilm_btn_div">			
				<c:choose>
					<c:when test="${not empty loginUser}"> 
						<button class="request_film" type="button" onclick="location.href = '<c:url value='/filmrequest/request' />'">영화 추가 요청하기</button>												
					</c:when>
				</c:choose>
			</div>
		</div>
		</section>
	</div>
	</section>
	</section>
</body>
<%@include file="../footer.jsp" %>