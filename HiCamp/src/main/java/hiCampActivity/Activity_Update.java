package hiCampActivity;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hiCampBean.ActivityBean;
import hiCampDao.Activity_Dao;

@WebServlet("/Activity_Update")
public class Activity_Update extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ActivityBean activity = new ActivityBean();
//    boolean isFirstTime = true;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		
		int activityNo = Integer.parseInt(request.getParameter("activityNo"));
//		String activityType = request.getParameter("activityType");
//		String activityName = request.getParameter("activityName");
//		String activityLocation = request.getParameter("activityLocation");
//		String activityInfo = request.getParameter("activityInfo");
//		String activityQuota = request.getParameter("activityQuota");
//		String activityPrice = request.getParameter("activityPrice");

		try {
			Activity_Dao ActDao = new Activity_Dao();
			
//			判斷attribute裡面有沒有已經查詢回來的資料
//			判斷第一次執行會有問題
			
//			if (isFirstTime) {
//			1. 呼叫DAO&執行查詢功能, 確認是否有此筆資料, 將查詢結果給jsp顯示, 再透過連結按鈕連到更新頁面
				activity = ActDao.selectByNo(activityNo);
				request.setAttribute("activity", activity);
				request.getRequestDispatcher("/Activity/UpdateActivity.jsp").forward(request, response);

//			}else {
//				2. 執行修改功能: 要如何指到第二個jsp頁面, 並跳過查詢功能
//					activity.setActivityType(activityType);
//					activity.setActivityName(activityName);
//					activity.setActivityLocation(activityLocation);
//					activity.setActivityInfo(activityInfo);
//					activity.setActivityQuota(activityQuota);
//					activity.setActivityPrice(activityPrice);
//					activity.setActivityNo(activityNo);
//					ActDao.updateActivity(activity);
//					
//					ActDao.selectByNo(activityNo);
//					request.setAttribute("activity", activity);
//					System.out.println(activity);
//					request.setAttribute("activityUpdate", activity); // 回傳多次activity會有問題嗎
//					request.getRequestDispatcher("/Project_activity/UpdateInsertData.jsp").forward(request, response);
//					response.sendRedirect("/Project_activity/UpdateInsertData.jsp");
					
//			}
//	        isFirstTime = false;


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
