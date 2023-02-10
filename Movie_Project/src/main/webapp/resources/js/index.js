/*작성자 : 김대영*/

//-------------------------평균 평점 이미지 슬라이더-------------------------------
const slides_main_star = document.querySelector("#slides_main_star"); //전체 슬라이드 컨테이너
const slideImg_main_star = document.querySelectorAll("#slides_main_star li"); //모든 슬라이드들
let currentIdx_main_star = 0; //현재 슬라이드 index
const prev_main_star = document.querySelector("#prev_main_star"); //이전 버튼
const next_main_star = document.querySelector("#next_main_star"); //다음 버튼

//슬라이드 개수
var slideCount_main_star = 0; 

if( ((slideImg_main_star.length) % 3)==0){
	slideCount_main_star = ((slideImg_main_star.length) / 3);
}else{
	slideCount_main_star = ((slideImg_main_star.length) % 3) + 1;	
}

if( ((slideImg_main_star.length) % 3)==0){
	// 1. 전체 이미지 수가 3의 배수인 경우
	slideCount_main_star = ((slideImg_main_star.length) / 3);
}else{
	// 2. 3의 배수가 아닌 경우
	// 2-1. 3보다 작은 경우 => 불러온 이미지의 개수가 3보다 작은 경우
	if((slideImg_main_star.length)<3){
		slideCount_main_star = 1;	
	}
	// 2-2. 3보다 크고, 3의 배수가 아닌 경우
	else{
		slideCount_main_star = parseInt(slideImg_main_star.length/3) + 1;
	}
}

function moveSlide_main_star(num) {
  slides_main_star.style.left = -num * 930 + "px";
  currentIdx_main_star = num;
}


//window.onload=function(){
	
	prev_main_star.addEventListener("click", function () {
	  /*첫 번째 슬라이드로 표시 됐을때는 
	  이전 버튼 눌러도 아무런 반응 없게 하기 위해 
	  currentIdx !==0일때만 moveSlide 함수 불러옴 */
	
	  if (currentIdx_main_star !== 0) moveSlide_main_star(currentIdx_main_star - 1);
	})
	
	next_main_star.addEventListener("click", function () {
	  /* 마지막 슬라이드로 표시 됐을때는 
	  다음 버튼 눌러도 아무런 반응 없게 하기 위해
	  currentIdx !==slideCount - 1 일때만 
	  moveSlide 함수 불러옴 */
	  if (currentIdx_main_star !== slideCount_main_star - 1) {
	    moveSlide_main_star(currentIdx_main_star + 1);
	  }
	})
//};


//-------------------------리뷰 수 이미지 슬라이더-------------------------------
const slides_main_review = document.querySelector("#slides_main_review"); //전체 슬라이드 컨테이너
const slideImg_main_review = document.querySelectorAll("#slides_main_review li"); //모든 슬라이드들
let currentIdx_main_review = 0; //현재 슬라이드 index
const prev_main_review = document.querySelector("#prev_main_review"); //이전 버튼
const next_main_review = document.querySelector("#next_main_review"); //다음 버튼

//슬라이드 개수
var slideCount_main_review = 0; 

if( ((slideImg_main_review.length) % 3)==0){
	slideCount_main_review = ((slideImg_main_review.length) / 3);
}else{
	slideCount_main_review = ((slideImg_main_review.length) % 3) + 1;	
}

if( ((slideImg_main_review.length) % 3)==0){
	// 1. 전체 이미지 수가 3의 배수인 경우
	slideCount_main_review = ((slideImg_main_review.length) / 3);
}else{
	// 2. 3의 배수가 아닌 경우
	// 2-1. 3보다 작은 경우 => 불러온 이미지의 개수가 3보다 작은 경우
	if((slideImg_main_review.length)<3){
		slideCount_main_review = 1;	
	}
	// 2-2. 3보다 크고, 3의 배수가 아닌 경우
	else{
		slideCount_main_review = parseInt(slideImg_main_review.length/3) + 1;
	}
}

function moveSlide_main_review(num) {
  slides_main_review.style.left = -num * 930 + "px";
  currentIdx_main_review = num;
}


//window.onload=function(){
	prev_main_review.addEventListener("click", function () {
	  /*첫 번째 슬라이드로 표시 됐을때는 
	  이전 버튼 눌러도 아무런 반응 없게 하기 위해 
	  currentIdx !==0일때만 moveSlide 함수 불러옴 */
	
	  if (currentIdx_main_review !== 0) moveSlide_main_review(currentIdx_main_review - 1);
	});
	
	next_main_review.addEventListener("click", function () {
	  /* 마지막 슬라이드로 표시 됐을때는 
	  다음 버튼 눌러도 아무런 반응 없게 하기 위해
	  currentIdx !==slideCount - 1 일때만 
	  moveSlide 함수 불러옴 */
	  if (currentIdx_main_review !== slideCount_main_review - 1) {
	    moveSlide_main_review(currentIdx_main_review + 1);
	  }
	});
//};

//-------------------------사용자 장르 이미지 슬라이더-------------------------------
const slides_main_genre = document.querySelector("#slides_main_genre"); //전체 슬라이드 컨테이너
const slideImg_main_genre = document.querySelectorAll("#slides_main_genre li"); //모든 슬라이드들
let currentIdx_main_genre = 0; //현재 슬라이드 index
const prev_main_genre = document.querySelector("#prev_main_genre"); //이전 버튼
const next_main_genre = document.querySelector("#next_main_genre"); //다음 버튼

//슬라이드 개수
var slideCount_main_genre = 0; 

if( ((slideImg_main_genre.length) % 3)==0){
	slideCount_main_genre = ((slideImg_main_genre.length) / 3);
}else{
	slideCount_main_genre = ((slideImg_main_genre.length) % 3) + 1;	
}

if( ((slideImg_main_genre.length) % 3)==0){
	// 1. 전체 이미지 수가 3의 배수인 경우
	slideCount_main_genre = ((slideImg_main_genre.length) / 3);
}else{
	// 2. 3의 배수가 아닌 경우
	// 2-1. 3보다 작은 경우 => 불러온 이미지의 개수가 3보다 작은 경우
	if((slideImg_main_genre.length)<3){
		slideCount_main_genre = 1;	
	}
	// 2-2. 3보다 크고, 3의 배수가 아닌 경우
	else{
		slideCount_main_genre = parseInt(slideImg_main_genre.length/3) + 1;
	}
}

function moveSlide_main_genre(num) {
  slides_main_genre.style.left = -num * 930 + "px";
  currentIdx_main_genre = num;
}


//window.onload=function(){
	
	prev_main_genre.addEventListener("click", function () {
	  /*첫 번째 슬라이드로 표시 됐을때는 
	  이전 버튼 눌러도 아무런 반응 없게 하기 위해 
	  currentIdx !==0일때만 moveSlide 함수 불러옴 */
	
	  if (currentIdx_main_genre !== 0) moveSlide_main_genre(currentIdx_main_genre - 1);
	})

	next_main_genre.addEventListener("click", function () {
	  /* 마지막 슬라이드로 표시 됐을때는 
	  다음 버튼 눌러도 아무런 반응 없게 하기 위해
	  currentIdx !==slideCount - 1 일때만 
	  moveSlide 함수 불러옴 */
	  if (currentIdx_main_genre !== slideCount_main_genre - 1) {
	    moveSlide_main_genre(currentIdx_main_genre + 1);
	  }
	})
//};