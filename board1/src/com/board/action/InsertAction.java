package com.board.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.beans.Board;
import com.board.controller.CommandAction;
import com.board.dao.BoardDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class InsertAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");

		MultipartRequest multi = null;
		int sizeLimit = 10 * 1024 * 1024 ; 

		@SuppressWarnings("deprecation")
		String savePath = request.getRealPath("/upload");    

		try{
			multi=new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		}catch (Exception e) {
			e.printStackTrace();
		}		

		String filename = multi.getFilesystemName("filename");
		String title = multi.getParameter("title");
		String writer = multi.getParameter("writer");
		int count=0;
		String content = multi.getParameter("content");
		String regip = request.getRemoteAddr();

		if(title ==""||title==null) System.out.println("title is null");

		if(writer==""||writer==null) System.out.println("writer is null");

		if(content==""||content==null) System.out.println("content is null");

		Board article = new Board();

		article.setRegip(regip);
		article.setTitle(title);
		article.setWriter(writer);
		article.setContent(content);
		article.setCount(count);
		article.setFilename(filename);

		BoardDao.getInstance().insertArticle(article);

		return "insert.jsp";
	}		

}
