<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>

<div class="wrapper">
	<div class="upadate_form_container">
	<form action="<c:url value='/member/update'/>" method="post" > 					
		<div>
			<div class="update_member_title">
				<label>${loginUser.nickname}님의 회원정보 수정</label>
				<hr class="myunder_line">
			</div>	
			<div class="input_data_full">									
				<div class="input_member_data">
					<label class="input_memeber_title" >비밀번호</label>
					<input name="password_update" id="password_update"  type="password" size="15"  required>
				</div>
				<div class="input_member_data">
					<label class="input_memeber_title" >비밀번호 확인</label>
					<input name="pwchk" id="pwchk"  type="password" size="15" oninput="passwordChk()" required>
					<label class="ChkLabel" id="pwchkMsg"></label>							
					<input id="pwchk2" type="hidden" value="false">
				</div>												
				
					<div class="input_member_data">
						<label class="input_memeber_title">연락처</label>
						<input id="phoneNumber_update" name="phoneNumber_update" type="tel" required pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" value="${loginUser.phoneNumber}" required/>
						<label class="ChkLabel" id="phoneNumber_msg"></label>							
					</div>	
								
					<div class="like_genre_dropdown">
						<label >선호 장르</label>
						<select id="favoriteGenre1_update" name="favoriteGenre1_update" required>
							<option value="${loginUser.favoriteGenre1}">${loginUser.favoriteGenre1}</option>
							<option value="액션">액션</option>
							<option value="코메디">코메디</option>
							<option value="로맨스">로맨스</option>
							<option value="드라마">드라마</option>
							<option value="호러/스릴러">호러/스릴러</option>
							<option value="SF/판타지">SF/판타지</option>
							<option value="애니메이션">애니메이션</option>
							<option value="다큐멘터리">다큐멘터리</option>
						</select>
						<select id="favoriteGenre2_update" name="favoriteGenre2_update" required>
							<option value="${loginUser.favoriteGenre2}">${loginUser.favoriteGenre2}</option>
							<option value="액션">액션</option>
							<option value="코메디">코메디</option>
							<option value="로맨스">로맨스</option>
							<option value="드라마">드라마</option>
							<option value="호러/스릴러">호러/스릴러</option>
							<option value="SF/판타지">SF/판타지</option>
							<option value="애니메이션">애니메이션</option>
							<option value="다큐멘터리">다큐멘터리</option>
						</select>
						<select id="favoriteGenre3_update" name="favoriteGenre3_update" required>
							<option value="${loginUser.favoriteGenre3}">${loginUser.favoriteGenre3}</option>
							<option value="액션">액션</option>
							<option value="코메디">코메디</option>
							<option value="로맨스">로맨스</option>
							<option value="드라마">드라마</option>
							<option value="호러/스릴러">호러/스릴러</option>
							<option value="SF/판타지">SF/판타지</option>
							<option value="애니메이션">애니메이션</option>
							<option value="다큐멘터리">다큐멘터리</option>
						</select>
					</div>
		
					<div class="input_member_data">									
						<input type="button" id="update_btn" value="회원정보 수정" class="update_member_btn">
						<button id="delete_btn" type="button" class="delete_btn">회원 탈퇴하기</button>					
				</div>	
				</div>
			</div>
			 
			</form>  		
		</div>							  
</div>



<script>
$("#update_btn").click(function(){

	var password_update = $('#password_update').val();
	var phoneNumber_update = $('#phoneNumber_update').val();
	var favoriteGenre1_update = $('#favoriteGenre1_update').val();
	var favoriteGenre2_update = $('#favoriteGenre2_update').val();
	var favoriteGenre3_update = $('#favoriteGenre3_update').val();
	
	if (password_update == ""){
		alert("비밀번호를 입력해 주세요.");
	} else {
	
		$.ajax({
			url: "<c:url value='/member/update'/>",
			type: "post",
			data: {password_update: password_update, phoneNumber_update: phoneNumber_update, favoriteGenre1_update: favoriteGenre1_update, favoriteGenre2_update: favoriteGenre2_update, favoriteGenre3_update: favoriteGenre3_update},
			success: function(data){
				if(data == 'ok'){
					alert("회원정보가 수정되었습니다.");
					window.location.replace("/myapp/index");	
				} else {
					alert("회원정보를 수정할 수 없습니다.");			
				}//end if
			},//end success
			error:function(){
				alert("회원정보 수정 불가");
			}		
		})//end ajax
	
	}
})//end update_btn

function passwordChk(){
	if($('#pwchk').val() != '' ){
		if($('#password_update').val() == $('#pwchk').val()){
			$('#pwchkMsg').text("비밀번호가 일치합니다.").css({"color": "#008000", "font-size": "13px","font-weight": "400","letter-spacing":" -0.2px", "line-height": "18px;", "margin": "6px 12px 4px"});
			$('#pwchk2').val("true");
		} else {
			$('#pwchkMsg').focus();
			$('#pwchkMsg').text("비밀번호가 일치하지 않습니다.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400","letter-spacing":" -0.2px", "line-height": "18px;", "margin": "6px 12px 4px"});			
		}
	}
}//end passwordChk

$("#delete_btn").click(function(e){
    if(confirm("정말 탈퇴하시겠습니까?")){
    	$.ajax({
			url: "<c:url value='/member/deleteMember'/>",
			type: "post",
			success: function(data){
				if(data == 'ok'){
					alert("회원 탈퇴가 완료되었습니다.");
					window.location.replace("/myapp/index");					
				} else {
					alert("회원 탈퇴가 불가합니다.");	
				}//end if								
			},//end success
			error:function(){
				alert("회원 탈퇴 불가");
			}//end error														
		})//end 로그인 실행 ajax	     
    } else {
        return false;
    }
})


</script>










<%@include file="../footer.jsp"%>