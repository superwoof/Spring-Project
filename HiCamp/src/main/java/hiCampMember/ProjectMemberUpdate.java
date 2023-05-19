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

@WebServlet("/ProjectMemberUpdate")
public class ProjectMemberUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDao dao = new MemberDao();
		MemberBean member = new MemberBean();
		HttpSession session = request.getSession();
		MemberBean attribute = (MemberBean) session.getAttribute("memberInfo");
		
		MemberBean memberLost = dao.searchMemberEmail(attribute.getMemberEmail());
		
		
		member.setMemberName(request.getParameter("memberName"));
		member.setMemberPassword(request.getParameter("memberPassword"));
		member.setMemberPhone(request.getParameter("memberPhone"));
		member.setMemberAddress(request.getParameter("memberAddress"));
		member.setMemberId(request.getParameter("memberId"));
		member.setMemberEmergencyContact(request.getParameter("memberEmergencyContact"));
		member.setMemberEmergencyPhone(request.getParameter("memberEmergencyPhone"));
		member.setMemberEmail(attribute.getMemberEmail());
		member.setMemberGender(memberLost.getMemberGender());
		member.setMemberBirthday(memberLost.getMemberBirthday());
		
		int result = dao.updateMemberInfomation(member);
		if(result > 0) {
			MemberBean memberInfo = dao.searchMemberEmail(member.getMemberEmail());
			session.setAttribute("memberInfo", memberInfo);
			System.out.println(attribute.getMemberEmail());
			response.sendRedirect("/HiCamp/Member/ProjectMemberSetting.jsp");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
