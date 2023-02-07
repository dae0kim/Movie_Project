<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.jsp"%>

	<div class="wrapper">
		<div>
			<!-- 리뷰 정보 컨테이너 시작 -->
			<div class="film_info_container">
				<div id="poster">
					<c:set var="len" value="${fn:length(filmInfo.fileName)}"/>
						<c:set var="filetype" value="${fn:toUpperCase(fn:substring(filmInfo.fileName, len-4, len))}"/>
						<c:if test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG')}">
							<c:url var="imageName" value="/file/${filmInfo.fileId}"/>
							<img src="${imageName}" width="100" class="img-thumbnail">
						</c:if>
				</div>

				<div id="film_info">
					<div id="title_name">${filmInfo.filmTitle}</div>
					<br> ${filmInfo.releaseDate} • ${filmInfo.genre} •
					${filmInfo.country}
				</div>

				<div id="star_avg">
					<div id="title_name">평균별점</div>
					<br>★
					<fmt:formatNumber value="${filmInfo.starAverage}" pattern=".00" />
				</div>

				<div id="review_count" onload="reloadreviewcount();">
					<div id="title_name">리뷰 수</div>
					<br> ${filmInfo.reviewCount} 개의 리뷰가 작성됨
				</div>

				<div id="summary">
					<div id="title_name">줄거리</div>
					<br> ${filmInfo.summary}
				</div>
			</div>

			<!-- 김미리 작성 : 위시리스트 -->
			<form name="insertwish" class ="insertwish" onsubmit="return false;">
			<div class="box" id="wishlist_div">
				<button type="submit" class="wishlist_btn" name="wishlist_btn"  >보관함에 추가 </button> 
			</div>
			</form>
			<!-- 위시리스트 끝-->

			<!-- 리뷰 입출력(로그인 상태, 리뷰 입력상태에 따라) -->
			<div class="box" id="insertreview">
				<c:choose>
					<c:when test="${loginUser.memberId == null }">
						<h2>로그인 되지 않았습니다. 로그인 해주세요</h2>	
						<a href="#login_modal" rel="modal:open">로그인하기</a>					
					</c:when>
					<c:when test="${rev.reviewContent == null}">
						<h2>작성된 리뷰가 없습니다. 리뷰를 작성해주세요</h2>
						<br>
						<a href="<c:url value='/insertreview/${filmId}'/>"><h1>리뷰작성하기</h1></a>
					</c:when>
					<c:otherwise>
						<h4>회원님의 리뷰</h4>
						<div id="reviewtable">
							<table border="1" style="width: 100%;">
								<tr>
									<th><h4>별점</h4></th>
									<th><h4>리뷰 내용</h4></th>
									<th><h4>좋아요 수</h4></th>
								</tr>
								<tr>
									<td>${rev.starScore}</td>
									<td>${rev.reviewContent}</td>
									<td>${rev.likeCount}</td>
								</tr>
							</table>
						</div>
					</c:otherwise>
				</c:choose>
			</div>

			<!-- 해당 영화의 모든 리뷰 출력 (로그인시에만 좋아요버튼 활성화 -->
			<div class="box" id="test">
				<h3>리뷰들을 보고싶으시다면?</h3>
				<button id="btn_toggle">전체 리뷰 보기</button>
				<div id="Toggle" style="display: none">
					<c:forEach var="reviewlist" items="${reviewlist}">
						<div class="test" id="reviewcontainer">
							<div class="reviewhead">
								<div class="nickname">${reviewlist.nickname}</div>
								<div class="starscore">★ ${reviewlist.starScore}</div>
							</div>

							<div class="reviewbody">
								<pre>
									<div class="reviewcontent">${reviewlist.reviewContent}</div>
								</pre>
							</div>


							<div class="reviewfooter">
								<div onload="fn2">좋아요 수 : ${reviewlist.likeCount}</div>

								<div class="likebtnif">
									<c:if test="${loginUser.memberId != null }">
										<input type="button" data-reviewId="${reviewlist.reviewId}"
											data-memberId="${loginUser.memberId}" class="btnlike"
											value="좋아요!">
									</c:if>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>





			<!-- 동일장르 영화 추천 -->
			<div class="box" id="filminfolistsamegenre">
				<h2>같은장르의 다른 영화는 어떠세요?</h2>
				<div id="slideShow">
					<ul id="slides_filminfo" class="slides">
						<c:forEach var="filmInfo2" items="${filmInfo2}">
							<li class="image_list">
								<div>
									<div>
										<c:choose>
											<c:when test="${not empty  loginUser}"> 
												<a href="<c:url value='/film/${filmInfo2.filmId}/${loginUser.memberId}'/>">
											</c:when>
											<c:otherwise>
												<a href="<c:url value='/film/${filmInfo2.filmId}/0'/>">										
											</c:otherwise>
										</c:choose>
										<c:set var="len" value="${fn:length(filmInfo2.fileName)}"/>
											<c:set var="filetype" value="${fn:toUpperCase(fn:substring(filmInfo2.fileName, len-4, len))}"/>
											<c:if test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG')}">
												<c:url var="imageName" value="/file/${filmInfo2.fileId}"/>
												<img src="${imageName}" width="100" class="img-thumbnail">
											</c:if>	
										</a>
									</div>
									<div style="text-align: center;">
										<span>${filmInfo2.filmTitle}</span>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
					<p class="controller">
						<span id="prev_filminfo" class="prev">&lang;</span> 
						<span id="next_filminfo" class="next">&rang;</span>
					</p>
				</div>
			</div>
		</div>
	</div>
	<script>
	 // 김미리 작성 : 위시리스트 담기 - 데이터 전송(ajax)
	var login_chk = $(function() {
		  $(document).on("click", "button[name='wishlist_btn']", function () {
			  var filmId = '${filmInfo.filmId}';
			  var memberId = '${loginUser.memberId}';
			  	
			  	console.log(filmId);
			  	console.log(memberId);
		  		
		  if(memberId ==''){
		      alert("내 보관함에 작품을 담으려면 로그인이 필요해요. 회원가입 혹은 로그인해주세요.");  //비로그인 시 알림창 노출
		       return ; //false ;
		        }
		  else{  //로그인 상태일 때 실행
			  $.ajax({
			         url : "./film", //Controller에서 요청 받을 주소
			         type : "post", //POST 방식으로 전달
			         data : {
			        	 filmId : filmId,
			        	 memberId : memberId
			         	},
			         success : function(data) { //컨트롤러에서 넘어온 BasketList값을 받는다 
			        	 //insertwish.submit(); 
			        	 alert(data.message);
			        	 return; //true ;
			         },

			         error : function() {
			            alert("에러입니다");
			            return; //false;
			         }//end error
			      }); //end ajax
			   } //end else
			});//end login_chk function
		});//end function
	</script>
<%@include file="../footer.jsp"%>
