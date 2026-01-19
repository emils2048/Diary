package service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Command;
import model.DiaryDao;
import model.DiaryDto;
import model.ReplyDao;
import model.ReplyDto;

public class DiaryView implements Command {

	@Override
	public void doCommand(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		request.setCharacterEncoding("utf-8");
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		
		DiaryDto dto = new DiaryDao().getView(bno);
		List<ReplyDto> list = new ArrayList<ReplyDto>();
		list = new ReplyDao().ReplySelect(bno);
		
		request.setAttribute("view", dto);
		request.setAttribute("rpview", list);
				
	}

}
