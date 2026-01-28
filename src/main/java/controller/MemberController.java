package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import service.MemberInsert;
import service.MemberLogin;
import service.MemberLogout;

@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 2, //2MB 메모리 또는 임시폴더에 잠깐 저장
		maxFileSize = 1024 * 1024 * 10, // 10MB 파일 1개당 최대 크기
		maxRequestSize = 1024 * 1024 * 50 // 50MB 폼 전체 합산 크기 파일 여러개+텍스트 합쳐서 50MB까지 허용
		)

@WebServlet("/mem/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String uri = request.getPathInfo();
		System.out.println("uri: " + uri);
		
		String page=null;
		
		switch(uri) {
		case "/join.do":
			page="/member/join.jsp";
			break;
		case "/memberinsert.do":
			new MemberInsert().doCommand(request, response);
			break;
		case "/login.do":
		    page = "/member/login.jsp";
		    break;
		case "/loginpro.do":
			new MemberLogin().doCommand(request, response);
			break;
		case "/logout.do":	
			new MemberLogout().doCommand(request, response);
			break;
		}
	
		if(page != null) {
			request.getRequestDispatcher(page).forward(request, response);
		}
	}
}