package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Command;
import model.ReplyDao;
import model.ReplyDto;

public class DiaryReply implements Command {

	@Override
	public void doCommand(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");
		
		int diary_bno = Integer.parseInt(request.getParameter("diary_bno"));
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("userid");
		String replytext = request.getParameter("replytext");
		
		if (userid == null) {
			response.sendRedirect("/blog/login.jsp");
			return;
		}
		
		ReplyDto dto = new ReplyDto();
		dto.setDiary_bno(diary_bno);
		dto.setUserid(userid);
		dto.setReplytext(replytext);
		ReplyDao dao = new ReplyDao();
		dao.ReplyInsert(dto);
		
		response.sendRedirect("/blog/bc/diaryview.do?bno="+diary_bno);
	}

}
