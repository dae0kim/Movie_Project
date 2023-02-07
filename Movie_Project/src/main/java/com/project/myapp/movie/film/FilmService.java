package com.project.myapp.movie.film;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class FilmService implements IFilmService {

	@Autowired
	@Qualifier("IFilmRepository")
	IFilmRepository filmRepository;
	
	// -----------------<사용자>-----------------
	@Override
	public FilmVO getFilmInfo(String filmId) {
		return filmRepository.getFilmInfo(filmId);
	}

	@Override
	public FilmVO filmSearch(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}
	
	// 김미리 작성 : 영화 검색 메소드 추가
	@Override
	public List<FilmVO> getFilmSearch(String keyword) {
				
		return filmRepository.getFilmSearch(keyword);
	}
	//감독으로 검색
	public List<FilmVO> getDrectorSearch(String keyword) {
			
		return filmRepository.getDrectorSearch(keyword);
	}
	//배역으로 검색
	public List<FilmVO> getActorSearch(String keyword) {
				
		return filmRepository.getActorSearch(keyword);
	}

	@Override
	public List<FilmVO> getFilmListByReview() {
		return filmRepository.getFilmListByReview();
	}

	@Override
	public List<FilmVO> getFilmListByStar() {
		return filmRepository.getFilmListByStar();
	}

	// 작성자 : 김대영
	@Override
	public List<FilmVO> getFilmListByGenre(String memberId) {
		return filmRepository.getFilmListByGenre(memberId);
	}
	
	@Override
	public List<FilmVO> getFilmListByGenreFilmInfo(String filmId) {
		return filmRepository.getFilmListByGenreFilmInfo(filmId);
	}

	
	// -----------------<관리자>-----------------
	@Override
	public List<FilmVO> getFilmList() {
		return filmRepository.getFilmList();
	}

	@Override
	public void updateFilm(FilmVO film) {
		filmRepository.updateFilm(film);
	}

	@Override
	public void deleteFilm(String filmId) {
		filmRepository.deleteFilm(filmId);
	}
	
	// <관리자> - 영화 추가
	// 작성자 : 김대영
	@Override
	public void insertFilm(FilmVO film) {
		filmRepository.insertFilm(film);
	}

	@Override
	public void updateStarAvg(String filmId) {
		filmRepository.updateStarAvg(filmId);
	}

	@Override
	public void updateRivewCount(String filmId) {
		filmRepository.updateRivewCount(filmId);
	}

	


}
