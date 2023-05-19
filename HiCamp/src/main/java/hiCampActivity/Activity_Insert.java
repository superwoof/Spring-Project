package hiCampActivity;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hiCampBean.ActivityBean;
import hiCampDao.Activity_Dao;

@WebServlet("/Activity_Insert")
public class Activity_Insert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		ActivityBean activity = new ActivityBean();
//		int activityNo = Integer.parseInt(request.getParameter("activityNo"));
		
		String activityType = request.getParameter("activityType");
		String activityName = request.getParameter("activityName");
		String activityLocation = request.getParameter("activityLocation");
		String activityInfo = request.getParameter("activityInfo");
		String activityQuota = request.getParameter("activityQuota");
		String activityPrice = request.getParameter("activityPrice");

		try {
			Activity_Dao ActDao = new Activity_Dao();

//			activity.setActivityNo(activityNo);
			activity.setActivityType(activityType);
			activity.setActivityName(activityName);
			activity.setActivityLocation(activityLocation);
			activity.setActivityInfo(activityInfo);
			activity.setActivityQuota(activityQuota);
			activity.setActivityPrice(activityPrice);

			ActDao.InsertActivity(activity);

			request.setAttribute("activity", activity);
			request.getRequestDispatcher("/Activity/InsertToActivity.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		} 
//		finally {
//		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}






//
//在JSP中，你可以使用Java代码来生成一个唯一的流水号，然后将其添加到表中。你可以使用Java类库中的UUID类来生成一个随机的唯一标识符。以下是一个示例代码：
//
//arduino
//Copy code
//<%@ page import="java.util.UUID" %>
//<%
//  String id = UUID.randomUUID().toString();
//  //将id插入到表中
//%>
//在这个例子中，我们导入了java.util.UUID类，并使用它来生成一个唯一的ID。然后，你可以将生成的ID插入到表中作为identity流水号。