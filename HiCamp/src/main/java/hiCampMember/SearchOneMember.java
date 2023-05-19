package hiCampMember;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hiCampBean.MemberBean;
import hiCampDao.MemberDao;

/**
 * Servlet implementation class SearchOneMember
 */
@WebServlet("/SearchOneMember")
public class SearchOneMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDao dao = new MemberDao();
		System.out.println(request.getParameter("memberEmail"));
		MemberBean member = dao.searchMemberEmail(request.getParameter("memberEmail"));
		
		HttpSession session = request.getSession();
		session.setAttribute("memberEmail", request.getParameter("memberEmail"));
		
		request.setAttribute("member", member);
		request.getRequestDispatcher("/Member/ProjectManageMemberUpdate.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
