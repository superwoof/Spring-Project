package hiCampActivity;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hiCampBean.ActivityBean;
import hiCampDao.Activity_Dao;

@WebServlet("/Activity_Delete")
public class Activity_Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ActivityBean activity = new ActivityBean();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");


		int activityNo = Integer.parseInt(request.getParameter("activityNo"));
		activity.setActivityNo(activityNo);

		try {
//			如果用include的話要另外寫一個專門讓人呼叫的select功能
//			request.setAttribute("activityNo", activityNo);
//			request.getRequestDispatcher("/Activity_SelectByNo").include(request, response);			

			Activity_Dao ActDao = new Activity_Dao();
			activity = ActDao.selectByNo(activityNo);
			request.setAttribute("activity", activity);

			ActDao.deleteActivity(activity);
			request.setAttribute("activity", activity);
			request.getRequestDispatcher("/Activity/DeleteActivity.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			System.out.println("test");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
