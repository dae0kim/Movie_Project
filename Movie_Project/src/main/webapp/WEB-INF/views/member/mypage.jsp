<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ include file="../header.jsp" %>

<div class="wrapper">
	<section class="section_layout">
        <div class="myfilm_time">
          <div class="title1">
            <h2 class="mypage_title_font">나의 영화 감상 시간</h2>
          </div>
          <div id="total_time_section">
            <div class="total_time_text" >
            	<c:choose>
            		<c:when test="${empty myTime}">
            			<div class="myTime_font">
	            			<span>
	            				<span class ="my_nickname">${loginUser.nickname}</span>님은 아직 시청하신 영화가 없군요!<br> 
	            				리뷰를 작성하여 시청하신 영화 정보를 추가해 주세요.
	            			</span>            			
            			</div>

            		</c:when>
            		<c:otherwise>
            			<div class="myTime_font">
            				<span>            				
			                	<span class ="mytime_nickname" >${loginUser.nickname}</span>님의 총 영화 감상 시간은
            				</span>
		                	<input type="hidden" id="myTime" value="${myTime}">
		              	</div>
		              	<div id="time_message">
		                	<h3 id="day_hour_min_msg">
							</h3>
		              	</div>
            		</c:otherwise>
            	</c:choose>
            </div>
          </div>
        </div>
      </section>	
      
      		<!-- 김대영 작성 : 가장 최근 리뷰를 남긴 순서로 출력 -->
 			<div class="myfilm_list_box" id="film_list_mypage_time">
				<h2 class="mypage_title_font2">리뷰 작성순</h2>
            <div id="slideShow">
              <ul id="slides_time" class="slides">
              		<c:forEach var="myReviewByTime" items="${myReviewByTime}">
              	<li class="image_list">
              		<div>
              			<div>
		             		<a href="<c:url value='/film/${myReviewByTime.filmId}/${loginUser.memberId }'/>">
		             		<c:set var="len" value="${fn:length(myReviewByTime.fileName)}"/>
							<c:set var="filetype" value="${fn:toUpperCase(fn:substring(myReviewByTime.fileName, len-4, len))}"/>
							<c:if test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG')}">
								<c:url var="imageName" value="/file/${myReviewByTime.fileId}"/>
								<img src="${imageName}" width="100" class="img-thumbnail">
							</c:if>
		             		</a>
              			</div>    
              			<div class= "myfilmlist_info_full">          	
              			<div class="myfilmlist_info">
		             		<span class="myfilm_title">${myReviewByTime.filmTitle}</span>
              			</div>	
              			<div class="myfilmlist_info">
		             		<span class ="mystar">나의 별점:★ ${myReviewByTime.starScore}.0</span>
              			</div>	
              			</div>
              		</div>
              	</li>
              		</c:forEach>
              </ul>
         
			  <p class="controller">
			  	<span id="prev_time" class="prev">&lang;</span>
        		<span id="next_time" class="next">&rang;</span>
			  </p>
            </div>        
            </div>       
            
            <!-- 김대영 작성 : 내가 준 별점이 높은 순서로 출력 -->
 			<div class="myfilm_list_box" id="film_list_mypage_star">
				<h2 class="mypage_title_font2">나의 별점순</h2>
            <div id="slideShow">
              <ul id="slides_star" class="slides">
              		<c:forEach var="myReviewByStar" items="${myReviewByStar}">
              	<li class="image_list">
              		<div class ="img_full_frame">
              			<div class="img_usb_frame">
              				<a href="<c:url value='/film/${myReviewByStar.filmId}/${loginUser.memberId }'/>">
		             		<c:set var="len" value="${fn:length(myReviewByStar.fileName)}"/>
							<c:set var="filetype" value="${fn:toUpperCase(fn:substring(myReviewByStar.fileName, len-4, len))}"/>
							<c:if test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG')}">
								<c:url var="imageName" value="/file/${myReviewByStar.fileId}"/>
								<img src="${imageName}" class="img-thumbnail">
							</c:if>
		             		</a>
              			</div>  
              			<div class= "myfilmlist_info_full">           	
              			<div class="myfilmlist_info">
		             		<span class="myfilm_title">${myReviewByStar.filmTitle}</span>
              			</div>	
              			<div class="myfilmlist_info">
		             		<span class ="mystar" >나의 별점:★ ${myReviewByStar.starScore}.0</span>
              			</div>	
              		</div>
              		</div> 
              	</li>
              		</c:forEach>
              </ul>
			  <p class="controller">
			  	<span id="prev_star" class="prev">&lang;</span>
        		<span id="next_star" class="next">&rang;</span>
			  </p>
            </div>
            </div>
              
            <!-- 김미리 작성 : 마이 위시리스트 조회 -->
				<div class="myfilm_list_box" id="film_list_mypage_wish">
				<span class="mypage_title_font2">나의 보관함 </span>	
            <c:choose>
            <c:when test="${empty BasketList}">
	            	<span style="color:brown;">${loginUser.nickname}</span>님의 자주보는 영화를 보관함에 추가할 수 있어요!<br> 
	            		<a href ="${pageContext.request.contextPath}" class="insert_wish_btn"> 보관함에 추가하기</a>     	            			
	         	</c:when>
	         	<c:otherwise>
	            <div id="slideShow">
	              <ul id="slides_wish" class="slides">
	              		<c:forEach var="myBasketList" items="${BasketList}">
	              	<li class="image_list" id="image_list">
	              			<div>
			             		<a href="<c:url value='/film/${myBasketList.filmId}/${loginUser.memberId }'/>">
			             		<c:set var="len" value="${fn:length(myBasketList.fileName)}"/>
								<c:set var="filetype" value="${fn:toUpperCase(fn:substring(myBasketList.fileName, len-4, len))}"/>
								<c:if test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG')}">
									<c:url var="imageName" value="/file/${myBasketList.fileId}"/>
									<img src="${imageName}" width="100" class="wish_img-thumbnail">
								</c:if>			             		
			             		</a>
	              			</div>  
	              			<div class= "myfilmlist_info_full">
	              			<div class="myfilmlist_info">
			             		<span class="myfilm_title" >${myBasketList.filmTitle}</span>	
	              		</div>
	              		<button type="submit" name="wishlist_deletebtn" class="wishlist_deletebtn" data-listid="${myBasketList.basketId}">삭제</button>	
	              		</div>
	              	</li>
	              </c:forEach>
	              </ul>
	              <p class="controller"> 
					<span id="prev_wish" class="prev">&lang;</span>
			        <span id="next_wish" class="next">&rang;</span> 
 				  </p> 
	            </div>
	            </c:otherwise>
	            </c:choose>
	            </div>

	            <div class="myfilm_list_box">
	           		<button class="update_btn" type="button" onclick="location.href = '<c:url value='/member/updateMember' />'">회원정보 수정</button>
<!-- 	            <div class="pencil"> -->
<!-- 		            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" class="injected-svg" data-src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTMgMTcuMjUyNVYyMS4wMDI1SDYuNzVMMTcuODEgOS45NDI1TDE0LjA2IDYuMTkyNUwzIDE3LjI1MjVaTTIwLjcxIDcuMDQyNUMyMS4xIDYuNjUyNSAyMS4xIDYuMDIyNSAyMC43MSA1LjYzMjVMMTguMzcgMy4yOTI1QzE3Ljk4IDIuOTAyNSAxNy4zNSAyLjkwMjUgMTYuOTYgMy4yOTI1TDE1LjEzIDUuMTIyNUwxOC44OCA4Ljg3MjVMMjAuNzEgNy4wNDI1WiIgZmlsbD0iY3VycmVudENvbG9yIi8+Cjwvc3ZnPgo=" xmlns:xlink="http://www.w3.org/1999/xlink"> -->
<!-- 					<path d="M3 17.2525V21.0025H6.75L17.81 9.9425L14.06 6.1925L3 17.2525ZM20.71 7.0425C21.1 6.6525 21.1 6.0225 20.71 5.6325L18.37 3.2925C17.98 2.9025 17.35 2.9025 16.96 3.2925L15.13 5.1225L18.88 8.8725L20.71 7.0425Z" fill="currentColor"></path> -->
<!-- 					</svg> -->
<!-- 				</div> -->
	            </div>
	            </div>
	            
	          
	            
    <script>
  /* 김미리 작성 : 위시리스트 삭제 버튼 클릭 시 알림창 */
    var delete_wishList = $(function() {
    	  $(document).on("click", "button[name='wishlist_deletebtn']", function () {
    		  var memberId = '${loginUser.memberId}';
    		  var basketId = $(this).attr("data-listid");
    		  
    		  	console.log(basketId);

    		  $.ajax({
    		         url : "./member/mypage", //Controller에서 요청 받을 주소
    		         type : "post", //POST 방식으로 전달
    		         data : {
    		        	 memberId : memberId,
    		        	 basketId : basketId
    		         	},
    		         success : function(data) {  
    		        	 alert(data.message); //삭제버튼 눌렀을 때 알림창 노출
    		        	 $("#image_list").remove(); //버튼 클릭 시 해당 위시리스트 요소 삭제
    		        	 return; 
    		         },

    		         error : function() {
    		            alert("에러입니다");
    		            return; 
    		         }//end error
    		      }); //end ajax
    		});//end login_chk function
    	});//end function
    </script>
<%@ include file="../footer.jsp" %>
