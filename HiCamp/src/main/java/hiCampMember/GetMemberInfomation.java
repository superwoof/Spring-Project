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

@WebServlet("/GetMemberInfomation")
public class GetMemberInfomation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDao dao = new MemberDao();
		MemberBean member = new MemberBean();
		
		member.setMemberName(request.getParameter("memberName"));
		member.setMemberGender(request.getParameter("memberGender"));
		member.setMemberEmail(request.getParameter("memberEmail"));
		member.setMemberPassword(request.getParameter("memberPassword"));
		member.setMemberPhone(request.getParameter("memberPhone"));
		member.setMemberAddress(request.getParameter("city") + request.getParameter("district") + request.getParameter("memberAddress"));
		member.setMemberId(request.getParameter("memberId"));
		member.setMemberBirthday(request.getParameter("memberBirthday"));
		member.setMemberEmergencyContact(request.getParameter("memberEmergencyContact"));
		member.setMemberEmergencyPhone(request.getParameter("memberEmergencyPhone"));
		
		HttpSession session = request.getSession();
		session.setAttribute("memberName", request.getParameter("memberName"));
		System.out.println(request.getParameter("memberName"));
		session.setAttribute("memberInfo", member);
		
		int result = dao.creatNewMember(member);
		if (result > 0) {
			request.getRequestDispatcher("/Member/ProjectHomePage.jsp").forward(request, response);			
		}else {
			request.setAttribute("emailError", "此信箱已經註冊過了");
			request.getRequestDispatcher("/Member/Register.jsp").forward(request, response);
			System.out.println("test");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
