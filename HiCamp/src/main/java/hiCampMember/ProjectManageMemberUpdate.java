package hiCampMember;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hiCampBean.MemberBean;
import hiCampDao.MemberDao;

@WebServlet("/ProjectManageMemberUpdate")
public class ProjectManageMemberUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDao dao = new MemberDao();
		MemberBean member = new MemberBean();
		
		member.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
		member.setMemberName(request.getParameter("memberName"));
		member.setMemberPassword(request.getParameter("memberPassword"));
		member.setMemberPhone(request.getParameter("memberPhone"));
		member.setMemberAddress(request.getParameter("memberAddress"));
		member.setMemberId(request.getParameter("memberId"));
		member.setMemberEmergencyContact(request.getParameter("memberEmergencyContact"));
		member.setMemberEmergencyPhone(request.getParameter("memberEmergencyPhone"));
		member.setMemberEmail(request.getParameter("memberEmail"));
		member.setMemberGender(request.getParameter("memberGender"));
		member.setMemberBirthday(request.getParameter("memberBirthday"));
		
		int result = dao.updateMemberInfomation(member);
		if(result > 0) {
			request.setAttribute("member", member);
			request.getRequestDispatcher("/Member/ProjectManageMemberUpdate.jsp").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
