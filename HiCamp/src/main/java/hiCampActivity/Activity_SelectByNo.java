package hiCampActivity;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hiCampBean.ActivityBean;
import hiCampDao.Activity_Dao;

@WebServlet("/Activity_SelectByNo")
public class Activity_SelectByNo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ActivityBean activity = new ActivityBean();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");


		int activityNo = Integer.parseInt(request.getParameter("activityNo"));
		
		try {
			Activity_Dao ActDao = new Activity_Dao();
			activity = ActDao.selectByNo(activityNo);
			
//			缺判斷式
//			if (activityNo != null) {
//				System.out.println("查到一筆資料:" + "\n" + activity);
//			} else {
//				System.out.println("查無此筆資料");
//			}
			
			
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			request.setAttribute("activity", activity);
			request.getRequestDispatcher("/Activity/SelectByNo.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
