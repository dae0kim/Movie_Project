/**
 * 
 */
 		$(".btnlike").on("click", function() {
			var reviewId = $(this).attr("data-reviewId");
			var memberId = $(this).attr("data-memberId");
			var reviewlikeid = $(this).attr("data-reviewlikeid")
			console.log(reviewId + " " + memberId);

			$.ajax({
				url : "/myapp/insertlike",
				method : "post",
				dataType : "text",
				data : {
					"reviewId" : reviewId,
					"memberId" : memberId
				},
				success : function(data) {
					var countlike = data;
					console.log(data);

					location.reload();
				}
			})

		})
		$(function() {
			$("#btn_toggle").click(function() {
				$("#Toggle").toggle();
			});
		});
		
		function reloadreviewcount() {
			$("#review_count").load(window.location.href + "#review_count");
		}
		
		function fn2() {
			$(".reviewfooter").load(window.location.href + "reviewfooter");
		}
		
		
		
							function checkOnlyOne(element) {
						  
						  const checkboxes 
						      = document.getElementsByName("starScore");
						  
						  checkboxes.forEach((cb) => {
						    cb.checked = false;
						  })
						  
						  element.checked = true;
						}
						
						
//-------------------------영화 상세페이지 이미지 슬라이더-------------------------------
const slides_filminfo = document.querySelector("#slides_filminfo"); //전체 슬라이드 컨테이너
const slideImg_filminfo = document.querySelectorAll("#slides_filminfo li"); //모든 슬라이드들
let currentIdx_filminfo = 0; //현재 슬라이드 index
const prev_filminfo = document.querySelector("#prev_filminfo"); //이전 버튼
const next_filminfo = document.querySelector("#next_filminfo"); //다음 버튼

//슬라이드 개수
var slideCount_filminfo = 0; 

if( ((slideImg_filminfo.length) % 3)==0){
	slideCount_filminfo = ((slideImg_filminfo.length) / 3);
}else{
	slideCount_filminfo = ((slideImg_filminfo.length) % 3) + 1;	
}

if( ((slideImg_filminfo.length) % 3)==0){
	// 1. 전체 이미지 수가 3의 배수인 경우
	slideCount_filminfo = ((slideImg_filminfo.length) / 3);
}else{
	// 2. 3의 배수가 아닌 경우
	// 2-1. 3보다 작은 경우 => 불러온 이미지의 개수가 3보다 작은 경우
	if((slideImg_filminfo.length)<3){
		slideCount_filminfo = 1;	
	}
	// 2-2. 3보다 크고, 3의 배수가 아닌 경우
	else{
		slideCount_filminfo = parseInt(slideImg_filminfo.length/3) + 1;
	}
}

function moveSlide_filminfo(num) {
  slides_filminfo.style.left = -num * 930 + "px";
  currentIdx_filminfo = num;
}


window.onload=function(){
	
	prev_filminfo.addEventListener("click", function () {
	  /*첫 번째 슬라이드로 표시 됐을때는 
	  이전 버튼 눌러도 아무런 반응 없게 하기 위해 
	  currentIdx !==0일때만 moveSlide 함수 불러옴 */
	
	  if (currentIdx_filminfo !== 0) moveSlide_filminfo(currentIdx_filminfo - 1);
	})

	next_filminfo.addEventListener("click", function () {
	  /* 마지막 슬라이드로 표시 됐을때는 
	  다음 버튼 눌러도 아무런 반응 없게 하기 위해
	  currentIdx !==slideCount - 1 일때만 
	  moveSlide 함수 불러옴 */
	  if (currentIdx_filminfo !== slideCount_filminfo - 1) {
	    moveSlide_filminfo(currentIdx_filminfo + 1);
	  }
	})
};						
						