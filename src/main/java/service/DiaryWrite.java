package service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.Command;
import model.DiaryDao;
import model.DiaryDto;

public class DiaryWrite implements Command {

	@Override
	public void doCommand(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("userid");

		String content = request.getParameter("content");
		Part imgfile = request.getPart("imgfile");

		String fileName = null;
		if(imgfile != null && imgfile.getSize()>0) {
			String oriFileName = Paths.get(imgfile.getSubmittedFileName()).getFileName().toString();
			fileName = UUID.randomUUID().toString()+"_"+oriFileName;
			System.out.println("UUID:+" + fileName);
			
			String uploadPath = "c:/upload";
			File uploadDir = new File(uploadPath);
			if(!uploadDir.exists()) {
				uploadDir.mkdirs();
			}
			
			imgfile.write(uploadPath + File.separator + fileName);
		}

			DiaryDto dto = new DiaryDto();
			dto.setUserid(userid);
			dto.setContent(content);
			dto.setImgfile(fileName);

			DiaryDao dao = new DiaryDao();
			dao.diaryInsert(dto);

			response.sendRedirect("/blog/bc/list.do");

		}

}