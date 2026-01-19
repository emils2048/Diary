package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Command;
import model.DiaryDao;

public class DiaryDelete implements Command {

	@Override
	public void doCommand(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		request.setCharacterEncoding("utf-8");
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		DiaryDao dao = new DiaryDao();
		dao.diaryDelete(bno);
		response.sendRedirect("/blog/bc/list.do");
		
	}

}
