package com.board.action;

import java.sql.*;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.beans.Board;
import com.board.controller.CommandAction;
import com.board.dao.BoardDao;

public class DeleteAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		String idx = request.getParameter("idx");
		
		//Board article = BoardDao.getInstance().getArticle(Integer.parseInt(idx));
		
		BoardDao.getInstance().deleteArticle(Integer.parseInt(idx));	
		return "delete.jsp";
	}

}
