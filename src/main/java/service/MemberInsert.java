package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.Command;
import model.MemberDao;
import model.MemberDto;

public class MemberInsert implements Command {

	@Override
	public void doCommand(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {


		request.setCharacterEncoding("utf-8");

		String userid = request.getParameter("userid");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");

		Part profilePart = request.getPart("profile");
		String profile = null;

		if(profilePart != null && profilePart.getSize() > 0) {
			profile = profilePart.getSubmittedFileName();

			// 실제 서버 폴더에 저장
			String savePath = "C:/upload/" + profile;
			profilePart.write(savePath);
		} else {
			profile = "default.jpg"; // 기본 이미지
		}

		MemberDto dto = new MemberDto();
		dto.setUserid(userid);
		dto.setUsername(username);
		dto.setPassword(password);
		dto.setEmail(email);
		dto.setProfile(profile);

		MemberDao dao = new MemberDao();
		dao.UserInsert(dto);

		response.sendRedirect(request.getContextPath() + "/mem/login.do");
	}
}