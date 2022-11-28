package com.ssafy.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.model.dto.Board;
import com.ssafy.model.dto.BoardParameter;
import com.ssafy.util.PageNavigation;
import com.ssafy.model.repo.BoardRepo;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardRepo repo;

	@Override
	public boolean writeArticle(Board board) throws Exception {
		if(board.getSubject() == null || board.getContent() == null) {
			throw new Exception();
		}
		return repo.writeArticle(board) == 1;
	}

	@Override
	public List<Board> listArticle(BoardParameter boardParameter) throws Exception {
		int start = boardParameter.getPg() == 0 ? 0 : (boardParameter.getPg() - 1) * boardParameter.getSpp();
		boardParameter.setStart(start);
		return repo.listArticle(boardParameter);
	}

	@Override
	public PageNavigation makePageNavigation(BoardParameter boardParameter) throws Exception {
		int naviSize = 5;
		PageNavigation pageNavigation = new PageNavigation();
		pageNavigation.setCurrentPage(boardParameter.getPg());
		pageNavigation.setNaviSize(naviSize);
		int totalCount = repo.getTotalCount(boardParameter);//총글갯수  269
		pageNavigation.setTotalCount(totalCount);  
		int totalPageCount = (totalCount - 1) / boardParameter.getSpp() + 1;//27
		pageNavigation.setTotalPageCount(totalPageCount);
		boolean startRange = boardParameter.getPg() <= naviSize;
		pageNavigation.setStartRange(startRange);
		boolean endRange = (totalPageCount - 1) / naviSize * naviSize < boardParameter.getPg();
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		return pageNavigation;
	}

	@Override
	public Board getArticle(int articleno) throws Exception {
		return repo.getArticle(articleno);
	}
	
	@Override
	public void updateHit(int articleno) throws Exception {
		repo.updateHit(articleno);
	}

	@Override
	@Transactional
	public boolean modifyArticle(Board board) throws Exception {
		return repo.modifyArticle(board) == 1;
	}

	@Override
	@Transactional
	public boolean deleteArticle(int articleno) throws Exception {
		return repo.deleteArticle(articleno) == 1;
	}
}