package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Command;
import model.ReplyDao;

public class DiaryReplyDelete implements Command {

	@Override
	public void doCommand(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		request.setCharacterEncoding("utf-8");

		int replybno = Integer.parseInt(request.getParameter("reply_bno"));
		int diarybno = Integer.parseInt(request.getParameter("diary_bno"));
		
		ReplyDao dao = new ReplyDao();
		dao.ReplyDelete(replybno);

		response.sendRedirect("/blog/bc/diaryview.do?bno="	+ diarybno);		
	}
}
