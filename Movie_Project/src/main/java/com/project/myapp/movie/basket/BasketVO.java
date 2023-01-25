package com.project.myapp.movie.basket;

public class BasketVO {
	private int basketId;
	private int memberId;
	private int filmId;
	
	public int getBasketId() {
		return basketId;
	}
	public void setBasketId(int basketId) {
		this.basketId = basketId;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public int getFilmId() {
		return filmId;
	}
	public void setFilmId(int filmId) {
		this.filmId = filmId;
	}
	
	BasketVO(){}
	@Override
	public String toString() {
		return "BasketVO [basketId=" + basketId + ", memberId=" + memberId + ", filmId=" + filmId + "]";
	}
	
}
