package hiCampActivity;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import hiCampBean.ActivityPictureBean;
import hiCampDao.Activity_Dao;

@WebServlet("/Activity_InsertPicture")
@MultipartConfig
public class Activity_InsertPicture extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActivityPictureBean activityPic = new ActivityPictureBean();
		
		String activityNo = request.getParameter("activityNo");
		activityPic.setActivityNo(activityNo);

		InputStream activityPicture = request.getPart("activityPicture1").getInputStream();
		byte[] filebyte =activityPicture.readAllBytes();
		activityPic.setActivityPicture(filebyte);
		
		try {
			Activity_Dao ActDao = new Activity_Dao();
			ActDao.InsertPicture(activityPic);
			String base64=Base64.getEncoder().encodeToString(filebyte);
			request.setAttribute("activityPic", base64);
			request.getRequestDispatcher("./Activity/InsertToActivityPic.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}