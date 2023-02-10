package com.project.myapp.movie.member;

//작성자 : 김대영
public class MemberVO {
	private String memberId;
	private String email;
	private String password;
	private String nickname;
	private String birthDate;
	private String phoneNumber;
	private String gender;
	private String favoriteGenre1;
	private String favoriteGenre2;
	private String favoriteGenre3;
	private String memberType;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getFavoriteGenre1() {
		return favoriteGenre1;
	}
	public void setFavoriteGenre1(String favoriteGenre1) {
		this.favoriteGenre1 = favoriteGenre1;
	}
	public String getFavoriteGenre2() {
		return favoriteGenre2;
	}
	public void setFavoriteGenre2(String favoriteGenre2) {
		this.favoriteGenre2 = favoriteGenre2;
	}
	public String getFavoriteGenre3() {
		return favoriteGenre3;
	}
	public void setFavoriteGenre3(String favoriteGenre3) {
		this.favoriteGenre3 = favoriteGenre3;
	}
	public String getMemberType() {
		return memberType;
	}
	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}
	
	MemberVO(){}
	
	@Override
	public String toString() {
		return "MemberVO [memberId=" + memberId + ", email=" + email + ", password=" + password + ", nickname="
				+ nickname + ", birthDate=" + birthDate + ", phoneNumber=" + phoneNumber + ", gender=" + gender
				+ ", favoriteGenre1=" + favoriteGenre1 + ", favoriteGenre2=" + favoriteGenre2 + ", favoriteGenre3="
				+ favoriteGenre3 + ", memberType=" + memberType + "]";
	}
	
	
	
}
