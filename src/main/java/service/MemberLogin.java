package service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Command;
import model.MemberDao;
import model.MemberDto;

public class MemberLogin implements Command {
	@Override
	public void doCommand(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");

		MemberDao dao = new MemberDao();
		MemberDto dto = dao.UserLogin(userid, password);


		if(dto != null) {
			// 로그인 성공: 세션에 정보 저장
			HttpSession session = request.getSession();
			session.setAttribute("userid", dto.getUserid());
			session.setAttribute("username", dto.getUsername());
			session.setAttribute("profile", dto.getProfile());
			response.sendRedirect("/blog/main.do"); // 로그인 성공 시 메인페이지로 이동(필요시 경로 수정)
		} else {
			//			로그인 실패: 다시 로그인 페이지로
			response.sendRedirect("/blog/login.do");
		}
	}
}
