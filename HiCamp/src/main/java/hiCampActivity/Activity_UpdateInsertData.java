package hiCampActivity;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hiCampBean.ActivityBean;
import hiCampDao.Activity_Dao;

@WebServlet("/Activity_UpdateInsertData")
public class Activity_UpdateInsertData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ActivityBean activity = new ActivityBean();
	boolean isFirstTime = true;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");


		int activityNo = Integer.parseInt(request.getParameter("activityNo"));
		String activityType = request.getParameter("activityType");
		String activityName = request.getParameter("activityName");
		String activityLocation = request.getParameter("activityLocation");
		String activityInfo = request.getParameter("activityInfo");
		String activityQuota = request.getParameter("activityQuota");
		String activityPrice = request.getParameter("activityPrice");

		try {
			Activity_Dao ActDao = new Activity_Dao();

//			2. 執行修改功能: 要如何指到第二個jsp頁面, 並跳過查詢功能
			activity.setActivityType(activityType);
			activity.setActivityName(activityName);
			activity.setActivityLocation(activityLocation);
			activity.setActivityInfo(activityInfo);
			activity.setActivityQuota(activityQuota);
			activity.setActivityPrice(activityPrice);
			activity.setActivityNo(activityNo);
			ActDao.updateActivity(activity);

			ActDao.selectByNo(activityNo);
			request.setAttribute("activity", activity);
			System.out.println(activity);
			request.getRequestDispatcher("/Activity/UpdateInsertData.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}

}
