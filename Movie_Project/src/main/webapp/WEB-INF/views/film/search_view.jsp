<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../header.jsp" %>

<!-- 김미리 작성 : 검색결과 페이지 화면 -->
<body>
  <section class="section_layout_search">
  	<section class="content1_layout">
  		<section class ="search_result_contents_full">
			<section class ="search_result_movie">
			<div class="search_result_title_div">
				<div class="search_result_title">"${search_keyword}"검색결과</div>
			</div>
		<div class = "search_result_full"> 
			<div class="search_result_sub_div">
			<header class="title_header_second">
				<h2 class="section_title_main">영화</h2>  
			</header>
				<div class= "result_movie_full">
					<div class="result_movie_sub_full">
						<div class="result_movie_sub" >
						
		<!-- 영화제목으로 검색 시작 -->
		<c:choose>
		<c:when test="${searchFilmInfo != null or fn:length(searchFilmInfo) != 0}">
			<ul class="result_movie_ul">
				<c:forEach var="searchInfoList" items="${searchFilmInfo}" begin ="0" end="3" step="1" varStatus="status">
					<li class="movie_info">
						<a title ="${searchInfoList.filmTitle}" href="<c:url value='/film/film_info/${searchInfoList.filmId}'/>">
							<div class="movie_img_full_div">
								<div class= "movie_img_sub_div">
									<c:choose>
										<c:when test="${not empty loginUser}"> 
										<a href="<c:url value='/film/${searchInfoList.filmId}/${loginUser.memberId}'/>">
										
											</c:when>
											<c:otherwise>
												<a href="<c:url value='/film/${searchInfoList.filmId}/0'/>">
																						
											</c:otherwise>
											</c:choose>
								            <c:set var="len" value="${fn:length(searchInfoList.fileName)}"/>
												<c:set var="filetype" value="${fn:toUpperCase(fn:substring(searchInfoList.fileName, len-4, len))}"/>
												<c:if test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG')}">
													<c:url var="imageName" value="/file/${searchInfoList.fileId}"/>
													<img src="${imageName}" class="img-thumbnail">
												</c:if>
										</a>
										</div>
											<div class="result_movie_info">
												<div class="result_movie_title">
													${searchInfoList.filmTitle}
												</div>
												<div class="result_movie_releaseDate">
													${searchInfoList.releaseDate}
												</div>
												<div class="result_movie_genre">
													${searchInfoList.genre}
												</div>
										</div>
									</a>
								</li>
							</c:forEach>
						</ul>
					</c:when>
				</c:choose>
					
		<%--감독으로 검색 시작--%>
		<hr class="under_line_second">
			<header class="title_header_second">
				<h2 class="section_title_sub">감독</h2>
			</header>
				<c:choose>
					<c:when test="${searchDirectorInfo != null or fn:length(searchDirectorInfo) != 0}">
						<ul class="result_movie_ul">
								<c:forEach var="searchDirector" items="${searchDirectorInfo}" begin ="0" end="3" step="1" varStatus="status">
									<li class="movie_info">
										<a title ="${searchDirector.filmTitle}" href="<c:url value='/film/film_info/${searchDirector.filmId}'/>">
											<div class="movie_img_full_div">
												<div class= "movie_img_sub_div">
												<c:choose>
													<c:when test="${not empty loginUser}"> 
													<a href="<c:url value='/film/${searchDirector.filmId}/${loginUser.memberId}'/>">
													
													</c:when>
												<c:otherwise>
													<a href="<c:url value='/film/${searchDirector.filmId}/0'/>">
																							
												</c:otherwise>
												</c:choose>
									            <c:set var="len" value="${fn:length(searchDirector.fileName)}"/>
													<c:set var="filetype" value="${fn:toUpperCase(fn:substring(searchDirector.fileName, len-4, len))}"/>
													<c:if test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG')}">
														<c:url var="imageName" value="/file/${searchDirector.fileId}"/>
														<img src="${imageName}"  class="img-thumbnail">
													</c:if>
												</a>
											</div>
										<div class="result_movie_info">
											<div class="result_movie_title">
												  ${searchDirector.filmTitle}
											</div>
											<div class="result_movie_releaseDate">
												${searchDirector.releaseDate}
											</div>
											<div class="result_movie_genre">
												${searchDirector.genre}
											</div>
										</div>
										</div>
										</a>
									</li>
								</c:forEach>
								</ul>
							</c:when>
						</c:choose>
						
						<%--배역으로 검색 시작--%>
						<hr class="under_line_second">
							<header class="title_header_second">
								<h2 class="section_title_sub">배역</h2> 
							</header>
						<c:choose>
							<c:when test="${searchActorInfo != null or fn:length(searchActorInfo) != 0}">
								
							<ul class="result_movie_ul">
									<c:forEach var="searchActor" items="${searchActorInfo}" begin ="0" end="3" step="1" varStatus="status">
										<li class="movie_info">
											<a title ="${searchActor.filmTitle}" href="<c:url value='/film/film_info/${searchActor.filmId}'/>">
											
												<div class="movie_img_full_div">
													<div class= "movie_img_sub_div">
													<c:choose>
													<c:when test="${not empty loginUser}"> 
													<a href="<c:url value='/film/${searchActor.filmId}/${loginUser.memberId}'/>">
													
													</c:when>
														<c:otherwise>
															<a href="<c:url value='/film/${searchActor.filmId}/0'/>">	
																								
														</c:otherwise>
															</c:choose> 
													            <c:set var="len" value="${fn:length(searchActor.fileName)}"/>
																	<c:set var="filetype" value="${fn:toUpperCase(fn:substring(searchActor.fileName, len-4, len))}"/>
																	<c:if test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG')}">
																		<c:url var="imageName" value="/file/${searchActor.fileId}"/>
																		<img src="${imageName}"  class="img-thumbnail">
													</c:if>
													</a>
												</div>
												<div class="result_movie_info">
													<div class="result_movie_title">
													   ${searchActor.filmTitle}
													</div>
													<div class="result_movie_releaseDate">
														${searchActor.releaseDate}
													</div>
													<div class="result_movie_genre">
														${searchActor.genre}
													</div>
												</div>
											</div>
										</a>
									</li>
								</c:forEach>
								</ul>
							</c:when>
							</c:choose>
					</div>
				</div>
			</div>
			</div>
		</div>	
				
		</section>
		</section>	
		
		</section>	
	</section>

<%@include file="../footer.jsp" %>
</body>


