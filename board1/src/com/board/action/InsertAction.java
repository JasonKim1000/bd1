package com.board.action;

import java.sql.*;
import java.util.ArrayList;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.beans.Board;
import com.board.controller.CommandAction;
import com.board.dao.BoardDao;

public class InsertAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {


		Board article = new Board();

		String title = request.getParameter("title");
		String writer = request.getParameter("writer");

		int count=0;
		String content = request.getParameter("content");
		String regip = request.getRemoteAddr();

		if(title ==""||title==null) System.out.println("title is null");

		if(writer==""||writer==null) System.out.println("writer is null");

		if(content==""||content==null) System.out.println("content is null");

		article.setRegip(regip);
		article.setTitle(title);
		article.setWriter(writer);
		article.setContent(content);
		article.setCount(count);

		BoardDao.getInstance().insertArticle(article);
		
		return "insert.jsp";
	}		

}
