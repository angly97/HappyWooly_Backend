package com.ssafy.model.repo;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.model.dto.Board;
import com.ssafy.model.dto.BoardParameter;

@Mapper
public interface BoardRepo {
	
	public int writeArticle(Board board) throws SQLException;
	public List<Board> listArticle(BoardParameter boardParameter) throws SQLException;
	public int getTotalCount(BoardParameter boardParameter) throws SQLException;
	public Board getArticle(int articleno) throws SQLException;
	public void updateHit(int articleno) throws SQLException;
	public int modifyArticle(Board board) throws SQLException;
	public void deleteMemo(int articleno) throws SQLException;
	public int deleteArticle(int articleno) throws SQLException;
	
}