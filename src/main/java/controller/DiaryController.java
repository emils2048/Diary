	package controller;
	
	
	
	import java.io.IOException;
	
	import javax.servlet.RequestDispatcher;
	import javax.servlet.ServletException;
	import javax.servlet.annotation.MultipartConfig;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	
	import service.DiaryDelete;
	import service.DiaryList;
	import service.DiaryReply;
import service.DiaryReplyDelete;
import service.DiaryUpdate;
	import service.DiaryView;
	import service.DiaryWrite;
	
	
	@WebServlet("/bc/*")
	@MultipartConfig(
			fileSizeThreshold = 1024 * 1024 * 2, //2MB 메모리 또는 임시폴더에 잠깐 저장
			maxFileSize = 1024 * 1024 * 10, // 10MB 파일 1개당 최대 크기
			maxRequestSize = 1024 * 1024 * 50 // 50MB 폼 전체 합산 크기 파일 여러개+텍스트 합쳐서 50MB까지 허용
			)
	
	public class DiaryController extends HttpServlet {
		private static final long serialVersionUID = 1L;
	
		public DiaryController() {
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
			case "/list.do":
				page="/list.jsp";
				new DiaryList().doCommand(request, response);
				break;
			case "/diarywrite.do":
				page="/write.jsp";
				break;
			case "/diarywritepro.do":
				new DiaryWrite().doCommand(request, response);
				break;
			case "/diaryview.do":
				page="/view.jsp";
				new DiaryView().doCommand(request, response);
				break;
			case "/diaryupdate.do":
				page="/update.jsp";
				new DiaryView().doCommand(request, response);
				break;
			case "/diaryupdatepro.do":
				new DiaryUpdate().doCommand(request, response);
				break;
			case "/diarydelete.do":
				new DiaryDelete().doCommand(request, response);
				break;
			case "/diaryreply.do":
				new DiaryReply().doCommand(request, response);
				break;
			case "/diaryreplydelete.do":
				new DiaryReplyDelete().doCommand(request, response);
				break;
			default:
				System.out.println("잘못된 uri 요청");
				break;
			}
	
			if(page != null) {
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
			}
		}
	
	}
