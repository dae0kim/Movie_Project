package com.project.myapp.movie.basket;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.myapp.movie.film.FilmVO;

@Service
public class BasketService implements IBasketService {

	@Autowired
	@Qualifier("IBasketRepository")
	IBasketRepository basketRepository;
	
	@Override
	public void insertBasket(BasketVO basket) {
		basketRepository.insertBasket(basket);

	}

	@Override
	public List<FilmVO> getBasketList(String memberId) {
		return basketRepository.getBasketList(memberId);
	}

	@Override
	public List<FilmVO> getBasketList_chk(String memberId, String filmId) {
		return basketRepository.getBasketList_chk(memberId, filmId);
	}

	@Override
	public void deleteBasket(String memberId, String basketId ) {
		basketRepository.deleteBasket( memberId, basketId);
		
	}

}
