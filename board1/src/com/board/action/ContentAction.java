package com.board.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.board.beans.Board;
import com.board.dao.*;

import com.board.controller.CommandAction;

public class ContentAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		String idx = request.getParameter("idx");
		
		Board article = BoardDao.getInstance().getArticle(Integer.parseInt(idx));	
		
		request.setAttribute("article", article);
		
		return "content.jsp";
	}		
}
