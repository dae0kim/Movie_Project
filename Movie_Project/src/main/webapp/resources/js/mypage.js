//-------------------------영화 감상 시간 출력문구-------------------------------
var myTime = $("#myTime").val();
//console.log("총 영화 감상 시간"+myTime);
var day=0;
if(parseInt(myTime/1440) < 1){
	day=0;
}else{
	day = parseInt(myTime/1440);
	myTime = myTime-(day*1440);
	$('#day_hour_min_msg').append('<span>총 '+day+'일 </span>');
}

//console.log("일 단위를 뺀 나머지 분"+myTime);
//console.log("총 "+day+"일");

var hour=0;
if(parseInt(myTime/60) < 1){
	hour = 0;
	$('#day_hour_min_msg').append('<span>'+hour+'시간 </span>');
}else{
	hour = parseInt(myTime/60);
	myTime = myTime-(hour*60);
	$('#day_hour_min_msg').append('<span>'+hour+'시간 </span>');
}
//console.log("시간 단위를 뺀 나머지 분"+myTime);
//console.log("총 "+hour+"시간");

var min=0;
if(myTime==0){
	min = 0;
}else{
	min = myTime;
	$('#day_hour_min_msg').append('<span>'+min+'분 입니다.</span>');
}
//$('#myTime_min').append(min);
//console.log("다 계산하고 남은 분:"+myTime);
//console.log("총"+min+"분");



//-------------------------리뷰 작성순서 이미지 슬라이더-------------------------------
const slides_time = document.querySelector("#slides_time"); //전체 슬라이드 컨테이너
const slideImg_time = document.querySelectorAll("#slides_time li"); //모든 슬라이드들
let currentIdx_time = 0; //현재 슬라이드 index
const prev_time = document.querySelector("#prev_time"); //이전 버튼
const next_time = document.querySelector("#next_time"); //다음 버튼

//슬라이드 개수
var slideCount_time = 0; 

if( ((slideImg_time.length) % 3)==0){
	// 1. 전체 이미지 수가 3의 배수인 경우
	slideCount_time = ((slideImg_time.length) / 3);
}else{
	// 2. 3의 배수가 아닌 경우
	// 2-1. 3보다 작은 경우 => 불러온 이미지의 개수가 3보다 작은 경우
	if((slideImg_time.length)<3){
		slideCount_time = 1;	
	}
	// 2-2. 3보다 크고, 3의 배수가 아닌 경우
	else{
		slideCount_time = parseInt(slideImg_time.length/3) + 1;
	}
}



function moveSlide_time(num) {
  slides_time.style.left = -num * 930 + "px";
  currentIdx_time = num;
}


//window.onload=function(){
	
	prev_time.addEventListener("click", function () {
	  /*첫 번째 슬라이드로 표시 됐을때는 
	  이전 버튼 눌러도 아무런 반응 없게 하기 위해 
	  currentIdx !==0일때만 moveSlide 함수 불러옴 */
	
	  if (currentIdx_time !== 0) moveSlide_time(currentIdx_time - 1);
	})
	
	next_time.addEventListener("click", function () {
	  /* 마지막 슬라이드로 표시 됐을때는 
	  다음 버튼 눌러도 아무런 반응 없게 하기 위해
	  currentIdx !==slideCount - 1 일때만 
	  moveSlide 함수 불러옴 */
	  if (currentIdx_time !== slideCount_time - 1) {
	    moveSlide_time(currentIdx_time + 1);
	  }
	})
//};


//-------------------------별점 순서 이미지 슬라이더-------------------------------
const slides_star = document.querySelector("#slides_star"); //전체 슬라이드 컨테이너
const slideImg_star = document.querySelectorAll("#slides_star li"); //모든 슬라이드들
let currentIdx_star = 0; //현재 슬라이드 index
const prev_star = document.querySelector("#prev_star"); //이전 버튼
const next_star = document.querySelector("#next_star"); //다음 버튼

//슬라이드 개수
var slideCount_star = 0; 

if( ((slideImg_star.length) % 3)==0){
	slideCount_star = ((slideImg_star.length) / 3);
}else{
	slideCount_star = ((slideImg_star.length) % 3) + 1;	
}

if( ((slideImg_star.length) % 3)==0){
	// 1. 전체 이미지 수가 3의 배수인 경우
	slideCount_star = ((slideImg_star.length) / 3);
}else{
	// 2. 3의 배수가 아닌 경우
	// 2-1. 3보다 작은 경우 => 불러온 이미지의 개수가 3보다 작은 경우
	if((slideImg_star.length)<3){
		slideCount_star = 1;	
	}
	// 2-2. 3보다 크고, 3의 배수가 아닌 경우
	else{
		slideCount_star = parseInt(slideImg_star.length/3) + 1;
	}
}

function moveSlide_star(num) {
  slides_star.style.left = -num * 930 + "px";
  currentIdx_star = num;
}


//window.onload=function(){
	
	prev_star.addEventListener("click", function () {
	  /*첫 번째 슬라이드로 표시 됐을때는 
	  이전 버튼 눌러도 아무런 반응 없게 하기 위해 
	  currentIdx !==0일때만 moveSlide 함수 불러옴 */
	
	  if (currentIdx_star !== 0) moveSlide_star(currentIdx_star - 1);
	})
	
	next_star.addEventListener("click", function () {
	  /* 마지막 슬라이드로 표시 됐을때는 
	  다음 버튼 눌러도 아무런 반응 없게 하기 위해
	  currentIdx !==slideCount - 1 일때만 
	  moveSlide 함수 불러옴 */
	  if (currentIdx_star !== slideCount_star - 1) {
	    moveSlide_star(currentIdx_star + 1);
	  }
	})
//};

//-------------------------위시리스트 이미지 슬라이더-------------------------------
const slides_wish = document.querySelector("#slides_wish"); //전체 슬라이드 컨테이너
const slideImg_wish = document.querySelectorAll("#slides_wish li"); //모든 슬라이드들
let currentIdx_wish = 0; //현재 슬라이드 index
const prev_wish = document.querySelector("#prev_wish"); //이전 버튼
const next_wish = document.querySelector("#next_wish"); //다음 버튼

//슬라이드 개수
var slideCount_wish = 0; 

if( ((slideImg_wish.length) % 3)==0){
	slideCount_wish = ((slideImg_wish.length) / 3);
}else{
	slideCount_wish = ((slideImg_wish.length) % 3) + 1;	
}

if( ((slideImg_wish.length) % 3)==0){
	// 1. 전체 이미지 수가 3의 배수인 경우
	slideCount_wish = ((slideImg_wish.length) / 3);
}else{
	// 2. 3의 배수가 아닌 경우
	// 2-1. 3보다 작은 경우 => 불러온 이미지의 개수가 3보다 작은 경우
	if((slideImg_wish.length)<3){
		slideCount_wish = 1;	
	}
	// 2-2. 3보다 크고, 3의 배수가 아닌 경우
	else{
		slideCount_wish = parseInt(slideImg_wish.length/3) + 1;
	}
}

function moveSlide_wish(num) {
  slides_wish.style.left = -num * 930 + "px";
  currentIdx_wish = num;
}


//window.onload=function(){
	
	prev_wish.addEventListener("click", function () {
	  /*첫 번째 슬라이드로 표시 됐을때는 
	  이전 버튼 눌러도 아무런 반응 없게 하기 위해 
	  currentIdx !==0일때만 moveSlide 함수 불러옴 */
	
	  if (currentIdx_wish !== 0) moveSlide_wish(currentIdx_wish - 1);
	})
	
	next_wish.addEventListener("click", function () {
	  /* 마지막 슬라이드로 표시 됐을때는 
	  다음 버튼 눌러도 아무런 반응 없게 하기 위해
	  currentIdx !==slideCount - 1 일때만 
	  moveSlide 함수 불러옴 */
	  if (currentIdx_wish !== slideCount_wish - 1) {
	    moveSlide_wish(currentIdx_wish + 1);
	  }
	})
//};

