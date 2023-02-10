package com.project.myapp.movie.basket;

//작성자 : 김대영
public class BasketVO {
	private String basketId;
	private String memberId;
	private String filmId;
	
	public String getBasketId() {
		return basketId;
	}
	public void setBasketId(String basketId) {
		this.basketId = basketId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getFilmId() {
		return filmId;
	}
	public void setFilmId(String filmId) {
		this.filmId = filmId;
	}
	
	BasketVO(){}
	
	@Override
	public String toString() {
		return "BasketVO [basketId=" + basketId + ", memberId=" + memberId + ", filmId=" + filmId + "]";
	}

	
}
