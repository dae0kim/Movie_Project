package com.project.myapp.movie.filmrequest;

public class FilmRequestVO {
	private String filmRequestId;
	private String requestTitle;
	private String requestDate;
	private String requestStatus;
	private String memberId;
	
	public String getFilmRequestId() {
		return filmRequestId;
	}
	public void setFilmRequestId(String filmRequestId) {
		this.filmRequestId = filmRequestId;
	}
	public String getRequestTitle() {
		return requestTitle;
	}
	public void setRequestTitle(String requestTitle) {
		this.requestTitle = requestTitle;
	}
	public String getRequestDate() {
		return requestDate;
	}
	public void setRequestDate(String requestDate) {
		this.requestDate = requestDate;
	}
	public String getRequestStatus() {
		return requestStatus;
	}
	public void setRequestStatus(String requestStatus) {
		this.requestStatus = requestStatus;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	FilmRequestVO(){}
	@Override
	public String toString() {
		return "FilmRequestVO [filmRequestId=" + filmRequestId + ", requestTitle=" + requestTitle + ", requestDate="
				+ requestDate + ", requestStatus=" + requestStatus + ", memberId=" + memberId + "]";
	}
	
	
}

