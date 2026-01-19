package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Command;
import model.DiaryDao;
import model.DiaryDto;

public class DiaryList implements Command {

	@Override
	public void doCommand(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		request.setCharacterEncoding("utf-8");
		
		List<DiaryDto> list = new DiaryDao().diaryWriteSelect();
		
		request.setAttribute("list", list);
	}

}
