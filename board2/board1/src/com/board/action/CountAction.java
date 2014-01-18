package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.beans.Board;
import com.board.controller.CommandAction;
import com.board.dao.*;


public class CountAction implements CommandAction{
	
	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {

		int idx =Integer.parseInt( request.getParameter("idx"));        
		
		Board article = BoardDao.getInstance().getArticle(idx);     
		String regip = request.getRemoteAddr(); 

		if(!regip.equals(article.getRegip())){          
			int count = article.getCount();                 
			article.setCount(count++);                      
			
			BoardDao.getInstance().setArticleCount(article);    
		}
		request.setAttribute("url", "content.do?idx="+idx);

		return "redirect2.jsp";

	}

}
