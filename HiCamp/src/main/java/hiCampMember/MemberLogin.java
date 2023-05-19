package hiCampMember;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hiCampBean.ManagerBean;
import hiCampBean.MemberBean;
import hiCampDao.ManagerDao;
import hiCampDao.MemberDao;

@WebServlet("/MemberLogin")
public class MemberLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		MemberDao dao = new MemberDao();
		ManagerDao managerDao = new ManagerDao();

		MemberBean memberInfo = dao.searchMemberEmail(request.getParameter("memberEmail"));
		boolean password = dao.searchMemberPassword(request.getParameter("memberPassword"));
		ManagerBean managerAccount = managerDao.searchManagerAccount(request.getParameter("memberEmail"));
		boolean managerPassword = managerDao.searchManagerPassword(request.getParameter("memberPassword"));
		
		System.out.println("會員帳號:"+ memberInfo.getMemberEmail());
		System.out.println("會員密碼:" + password);
		System.out.println("管理帳號:" + managerAccount.getManagerAccount());
		System.out.println("管理密碼:" + managerPassword);
		
		//管理者成功登入
		if (managerAccount.getManagerAccount() != null && managerPassword != false) {
			HttpSession session = request.getSession();
			session.setAttribute("managerAccount", managerAccount.getManagerAccount());
			request.getRequestDispatcher("/Member/ProjectManagerPage.jsp").forward(request, response);
		}
		
		//會員成功登入
		if (memberInfo.getMemberEmail() != null && password != false) {
			HttpSession session = request.getSession();
			session.setAttribute("memberName", memberInfo.getMemberName());
			session.setAttribute("memberInfo", memberInfo);
			request.getRequestDispatcher("/Member/ProjectHomePage.jsp").forward(request, response);
		}
		
		if (memberInfo.getMemberEmail() == null) {
			request.setAttribute("emailFalse", "信箱錯誤");
			request.getRequestDispatcher("/Member/ProjectMemberLogin.jsp").forward(request, response);	
		}
		if (password == false) {
			request.setAttribute("passwordFalse", "密碼錯誤");
			request.getRequestDispatcher("/Member/ProjectMemberLogin.jsp").forward(request, response);			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
