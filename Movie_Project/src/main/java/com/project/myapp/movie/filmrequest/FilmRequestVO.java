package com.project.myapp.movie.filmrequest;

import java.sql.Date;

public class FilmRequestVO {
	private int filmRequestId;
	private String requestTitle;
	private Date requestDate;
	private String requestStatus;
	private int memberId;
	
	public int getFilmRequestId() {
		return filmRequestId;
	}
	public void setFilmRequestId(int filmRequestId) {
		this.filmRequestId = filmRequestId;
	}
	public String getRequestTitle() {
		return requestTitle;
	}
	public void setRequestTitle(String requestTitle) {
		this.requestTitle = requestTitle;
	}
	public Date getRequestDate() {
		return requestDate;
	}
	public void setRequestDate(Date requestDate) {
		this.requestDate = requestDate;
	}
	public String getRequestStatus() {
		return requestStatus;
	}
	public void setRequestStatus(String requestStatus) {
		this.requestStatus = requestStatus;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	
	FilmRequestVO(){}
	
	@Override
	public String toString() {
		return "FilmRequestVO [filmRequestId=" + filmRequestId + ", requestTitle=" + requestTitle + ", requestDate="
				+ requestDate + ", requestStatus=" + requestStatus + ", memberId=" + memberId + "]";
	}
	
	
	
}

