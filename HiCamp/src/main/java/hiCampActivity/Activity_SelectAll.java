package hiCampActivity;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hiCampBean.ActivityBean;
import hiCampDao.Activity_Dao;

@WebServlet("/Activity_SelectAll")
public class Activity_SelectAll extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ActivityBean activity = new ActivityBean();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

				
		try {
			Activity_Dao ActDao = new Activity_Dao();
			List<ActivityBean> actList = ActDao.selectAllActivity();
			request.setAttribute("actList", actList);
			System.out.println(actList);

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			request.getRequestDispatcher("/Activity/SelectAll.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
