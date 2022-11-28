package com.ssafy.model.service;

import java.util.List;

import com.ssafy.model.dto.Board;
import com.ssafy.model.dto.BoardParameter;
import com.ssafy.util.PageNavigation;

public interface BoardService {
	public boolean writeArticle(Board board) throws Exception;
	public List<Board> listArticle(BoardParameter boardParameter) throws Exception;
	public PageNavigation makePageNavigation(BoardParameter boardParameter) throws Exception;
	
	public Board getArticle(int articleno) throws Exception;
	public void updateHit(int articleno) throws Exception;
	public boolean modifyArticle(Board board) throws Exception;
	public boolean deleteArticle(int articleno) throws Exception;
}
